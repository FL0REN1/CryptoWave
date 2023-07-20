using RabbitMQ.Client;
using System.Text;

namespace news_backend.Models
{
    public class NewsRabbitMQ
    {
        private static readonly Lazy<NewsRabbitMQ> _newsErrorMQ = new(() => new("News_Error_Exchange"));
        private static readonly Lazy<NewsRabbitMQ> _newsActionMQ = new(() => new("News_Action_Exchange"));

        private readonly string _hostname;
        private readonly string _exchangeName;
        private readonly IModel _channel;

        private NewsRabbitMQ(string exchangeName)
        {
            _hostname = "localhost";
            _exchangeName = exchangeName;

            var factory = new ConnectionFactory() { HostName = _hostname };
            var connection = factory.CreateConnection();
            _channel = connection.CreateModel();
            _channel.ExchangeDeclare(_exchangeName, ExchangeType.Fanout);
        }

        public static NewsRabbitMQ NewsErrorMQ => _newsErrorMQ.Value;
        public static NewsRabbitMQ NewsActionMQ => _newsActionMQ.Value;

        public void SendMessage(string message)
        {
            var body = Encoding.UTF8.GetBytes(message);
            _channel.BasicPublish(_exchangeName, "", null, body);
        }
    }
}

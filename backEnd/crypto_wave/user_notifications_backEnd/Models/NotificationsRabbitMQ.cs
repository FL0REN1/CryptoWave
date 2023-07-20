using RabbitMQ.Client;
using System.Text;

namespace crypto_wave.Models.NotificationsModel
{
    public class NotificationsRabbitMQ
    {
        private static readonly Lazy<NotificationsRabbitMQ> _NotificationsErrorMQ = new(() => new("Notifications_Error_Exchange"));
        private static readonly Lazy<NotificationsRabbitMQ> _NotificationsActionMQ = new(() => new("Notifications_Action_Exchange"));

        private readonly string _hostname;
        private readonly string _exchangeName;
        private readonly IModel _channel;

        private NotificationsRabbitMQ(string exchangeName)
        {
            _hostname = "localhost";
            _exchangeName = exchangeName;

            var factory = new ConnectionFactory() { HostName = _hostname };
            var connection = factory.CreateConnection();
            _channel = connection.CreateModel();
            _channel.ExchangeDeclare(_exchangeName, ExchangeType.Fanout);
        }

        public static NotificationsRabbitMQ NotificationsErrorMQ => _NotificationsErrorMQ.Value;
        public static NotificationsRabbitMQ NotificationsActionMQ => _NotificationsActionMQ.Value;

        public void SendMessage(string message)
        {
            var body = Encoding.UTF8.GetBytes(message);
            _channel.BasicPublish(_exchangeName, "", null, body);
        }
    }
}

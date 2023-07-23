using RabbitMQ.Client;
using System.Text;

namespace user_wallet.Models
{
    public class WalletRabbitMQ
    {
        private static readonly Lazy<WalletRabbitMQ> _WalletErrorMQ = new(() => new("Wallet_Error_Exchange"));
        private static readonly Lazy<WalletRabbitMQ> _WalletActionMQ = new(() => new("Wallet_Action_Exchange"));

        private readonly string _hostname;
        private readonly string _exchangeName;
        private readonly IModel _channel;

        private WalletRabbitMQ(string exchangeName)
        {
            _hostname = "localhost";
            _exchangeName = exchangeName;

            var factory = new ConnectionFactory() { HostName = _hostname };
            var connection = factory.CreateConnection();
            _channel = connection.CreateModel();
            _channel.ExchangeDeclare(_exchangeName, ExchangeType.Fanout);
        }

        public static WalletRabbitMQ WalletErrorMQ => _WalletErrorMQ.Value;
        public static WalletRabbitMQ WalletActionMQ => _WalletActionMQ.Value;

        public void SendMessage(string message)
        {
            var body = Encoding.UTF8.GetBytes(message);
            _channel.BasicPublish(_exchangeName, "", null, body);
        }
    }
}

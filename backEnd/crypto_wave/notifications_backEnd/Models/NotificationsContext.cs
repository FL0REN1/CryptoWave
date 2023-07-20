using Microsoft.EntityFrameworkCore;

namespace userNotifications.Models
{
    public class NotificationsContext : DbContext
    {
        public NotificationsContext(DbContextOptions<NotificationsContext> options) : base(options) { }
        public DbSet<Notifications>? Notifications { get; set; }
    }
}

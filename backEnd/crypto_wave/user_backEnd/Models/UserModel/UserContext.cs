﻿using Microsoft.EntityFrameworkCore;

namespace crypto_wave.Models.UserModel
{
    public class UserContext : DbContext
    {
        public UserContext(DbContextOptions<UserContext> options) : base(options) { }
        public DbSet<User>? Users { get; set; }
    }
}

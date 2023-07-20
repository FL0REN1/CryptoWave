
using Microsoft.EntityFrameworkCore;
using news_backend.Models;

namespace news_backend
{
    public class Program
    {
        public static void Main(string[] args)
        {
            var builder = WebApplication.CreateBuilder(args);

            var connectionString = builder.Configuration.GetConnectionString("DbConn");
            var userId = builder.Configuration.GetValue<string>("DbConn:UserId");
            var password = builder.Configuration.GetValue<string>("DbConn:Password");

            connectionString = connectionString?.Replace("${DbConn:UserId}", userId)
                                                 .Replace("${DbConn:Password}", password);

            builder.Services.AddDbContext<NewsContext>(options => options.UseSqlServer(connectionString));
            builder.Services.AddScoped<INewsRep, NewsRep>();

            builder.Services.AddControllers();
            builder.Services.AddEndpointsApiExplorer();
            builder.Services.AddSwaggerGen();
            builder.Services.AddCors();

            builder.Services.AddAutoMapper(typeof(Program).Assembly);

            var app = builder.Build();

            if (app.Environment.IsDevelopment())
            {
                app.UseSwagger();
                app.UseSwaggerUI();
            }

            app.UseCors(builder =>
            {
                builder
                .AllowAnyOrigin()
                .AllowAnyMethod()
                .AllowAnyHeader();
            });

            app.UseHttpsRedirection();
            app.UseAuthorization();
            app.MapControllers();

            app.Run();
        }
    }
}
﻿using HouseM8API.Configs;
using HouseM8API.Data_Access;
using Microsoft.Extensions.Options;
using System;
using System.Data;
using System.Data.SqlClient;

namespace HouseM8APITests.PaymentTests
{
    class PaymentTestFixture
    {
        private AppSettings _appSettings;
        private Connection _connection;

        public PaymentTestFixture()
        {
            _appSettings = new AppSettings();
            //Change this string to your local DB and server!
            _appSettings.DBConnection = "Server=DB LINK HERE;Initial Catalog= DB NAME HERE;User ID=USERNAME HERE;Password=PASS HERE;MultipleActiveResultSets=False;Connection Timeout=30;";
            IOptions<AppSettings> options = Options.Create<AppSettings>(_appSettings);
            _connection = new Connection(options);

            using (SqlCommand cmd = _connection.Fetch().CreateCommand())
            {
                cmd.CommandType = CommandType.Text;

                cmd.CommandText = "DELETE FROM dbo.[UserChat];" +
                "DELETE FROM dbo.[Message];" +
                "DELETE FROM dbo.[Chat];" +
                "DELETE FROM dbo.[PendingJobs];" +
                "DELETE FROM dbo.[Job];" +
                "DELETE FROM dbo.[Invoice];" +
                "DELETE FROM dbo.[EmployerReview];" +
                "DELETE FROM dbo.[MateReview];" +
                "DELETE FROM dbo.[IgnoredJobs];" +
                "DELETE FROM dbo.[UserChat];" +
                "DELETE FROM dbo.[Message];" +
                "DELETE FROM dbo.[MateAchievements];" +
                "DELETE FROM dbo.[Favourites];" +
                "DELETE FROM dbo.[Offer];" +
                "DELETE FROM dbo.[PaymentJob];" +
                "DELETE FROM dbo.[JobPosts];" +
                "DELETE FROM dbo.[CategoriesFromM8];" +
                "DELETE FROM dbo.[Mate];" +
                "DELETE FROM dbo.[Employer];" +
                "DELETE FROM dbo.[Reports];" +
                "DELETE FROM dbo.[RefreshTokens]" +
                "DELETE FROM dbo.[ChatConnections]" +
                "DELETE FROM dbo.[User];";

                cmd.ExecuteScalar();
            }
        }

        ~PaymentTestFixture()
        {
            Dispose();
        }

        public void Dispose()
        {
            GC.SuppressFinalize(this);
            using (SqlCommand cmd = _connection.Fetch().CreateCommand())
            {
                cmd.CommandType = CommandType.Text;

                cmd.CommandText = "DELETE FROM dbo.[UserChat];" +
                "DELETE FROM dbo.[Message];" +
                "DELETE FROM dbo.[Chat];" +
                "DELETE FROM dbo.[PendingJobs];" +
                "DELETE FROM dbo.[Job];" +
                "DELETE FROM dbo.[Invoice];" +
                "DELETE FROM dbo.[EmployerReview];" +
                "DELETE FROM dbo.[MateReview];" +
                "DELETE FROM dbo.[IgnoredJobs];" +
                "DELETE FROM dbo.[UserChat];" +
                "DELETE FROM dbo.[Message];" +
                "DELETE FROM dbo.[MateAchievements];" +
                "DELETE FROM dbo.[Favourites];" +
                "DELETE FROM dbo.[Offer];" +
                "DELETE FROM dbo.[PaymentJob];" +
                "DELETE FROM dbo.[JobPosts];" +
                "DELETE FROM dbo.[CategoriesFromM8];" +
                "DELETE FROM dbo.[Mate];" +
                "DELETE FROM dbo.[Employer];" +
                "DELETE FROM dbo.[Reports];" +
                "DELETE FROM dbo.[RefreshTokens]" +
                "DELETE FROM dbo.[ChatConnections]" +
                "DELETE FROM dbo.[User];";

                cmd.ExecuteScalar();
            }
        }

        public Connection GetConnection()
        {
            return _connection;
        }
    }
}

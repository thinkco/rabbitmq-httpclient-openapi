/* 
 * Rabbitmq Http API
 *
 * This is the OpenAPI specification of the RabbitMQ HTTP API. For more information, please refer to [HTTP API](https://cdn.rawgit.com/rabbitmq/rabbitmq-management/v3.7.14/priv/www/api/index.html) official documentation.
 *
 * OpenAPI spec version: 1.0
 * Contact: carlos@adaptive.me
 * Generated by: https://github.com/openapitools/openapi-generator.git
 */


using Xunit;

using System;
using System.Linq;
using System.IO;
using System.Collections.Generic;
using Thinkcode.RabbitMQ.OpenAPI.Api;
using Thinkcode.RabbitMQ.OpenAPI.Model;
using Thinkcode.RabbitMQ.OpenAPI.Client;
using System.Reflection;
using Newtonsoft.Json;

namespace Thinkcode.RabbitMQ.OpenAPI.Test
{
    /// <summary>
    ///  Class for testing ErrorMessage
    /// </summary>
    /// <remarks>
    /// This file is automatically generated by OpenAPI Generator (https://openapi-generator.tech).
    /// Please update the test case below to test the model.
    /// </remarks>
    public class ErrorMessageTests : IDisposable
    {
        // TODO uncomment below to declare an instance variable for ErrorMessage
        //private ErrorMessage instance;

        public ErrorMessageTests()
        {
            // TODO uncomment below to create an instance of ErrorMessage
            //instance = new ErrorMessage();
        }

        public void Dispose()
        {
            // Cleanup when everything is done.
        }

        /// <summary>
        /// Test an instance of ErrorMessage
        /// </summary>
        [Fact]
        public void ErrorMessageInstanceTest()
        {
            // TODO uncomment below to test "IsInstanceOfType" ErrorMessage
            //Assert.IsInstanceOfType<ErrorMessage> (instance, "variable 'instance' is a ErrorMessage");
        }


        /// <summary>
        /// Test the property 'Error'
        /// </summary>
        [Fact]
        public void ErrorTest()
        {
            // TODO unit test for the property 'Error'
        }
        /// <summary>
        /// Test the property 'Reason'
        /// </summary>
        [Fact]
        public void ReasonTest()
        {
            // TODO unit test for the property 'Reason'
        }

    }

}

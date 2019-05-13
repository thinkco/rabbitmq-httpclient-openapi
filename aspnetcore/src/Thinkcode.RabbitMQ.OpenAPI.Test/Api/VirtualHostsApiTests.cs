/* 
 * Rabbitmq Http API
 *
 * This is the OpenAPI specification of the RabbitMQ HTTP API. For more information, please refer to [HTTP API](https://cdn.rawgit.com/rabbitmq/rabbitmq-management/v3.7.14/priv/www/api/index.html) official documentation.
 *
 * OpenAPI spec version: 1.0
 * Contact: carlos@adaptive.me
 * Generated by: https://github.com/openapitools/openapi-generator.git
 */

using System;
using System.IO;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Reflection;
using RestSharp;
using Xunit;

using Thinkcode.RabbitMQ.OpenAPI.Client;
using Thinkcode.RabbitMQ.OpenAPI.Api;
using Thinkcode.RabbitMQ.OpenAPI.Model;

namespace Thinkcode.RabbitMQ.OpenAPI.Test
{
    /// <summary>
    ///  Class for testing VirtualHostsApi
    /// </summary>
    /// <remarks>
    /// This file is automatically generated by OpenAPI Generator (https://openapi-generator.tech).
    /// Please update the test case below to test the API endpoint.
    /// </remarks>
    public class VirtualHostsApiTests : IDisposable
    {
        private VirtualHostsApi instance;

        public VirtualHostsApiTests()
        {
            instance = new VirtualHostsApi();
        }

        public void Dispose()
        {
            // Cleanup when everything is done.
        }

        /// <summary>
        /// Test an instance of VirtualHostsApi
        /// </summary>
        [Fact]
        public void InstanceTest()
        {
            // TODO uncomment below to test 'IsInstanceOfType' VirtualHostsApi
            //Assert.IsType(typeof(VirtualHostsApi), instance, "instance is a VirtualHostsApi");
        }

        
        /// <summary>
        /// Test CreateDefinitionsForVirtualHost
        /// </summary>
        [Fact]
        public void CreateDefinitionsForVirtualHostTest()
        {
            // TODO uncomment below to test the method and replace null with proper value
            //string vhost = null;
            //Definition body = null;
            //instance.CreateDefinitionsForVirtualHost(vhost, body);
            
        }
        
        /// <summary>
        /// Test CreateVirtualHost
        /// </summary>
        [Fact]
        public void CreateVirtualHostTest()
        {
            // TODO uncomment below to test the method and replace null with proper value
            //string vhost = null;
            //instance.CreateVirtualHost(vhost);
            
        }
        
        /// <summary>
        /// Test DeleteVirtualHost
        /// </summary>
        [Fact]
        public void DeleteVirtualHostTest()
        {
            // TODO uncomment below to test the method and replace null with proper value
            //string vhost = null;
            //instance.DeleteVirtualHost(vhost);
            
        }
        
        /// <summary>
        /// Test GetDefinitionsForVirtualHost
        /// </summary>
        [Fact]
        public void GetDefinitionsForVirtualHostTest()
        {
            // TODO uncomment below to test the method and replace null with proper value
            //string vhost = null;
            //var response = instance.GetDefinitionsForVirtualHost(vhost);
            //Assert.IsType<Definition> (response, "response is Definition");
        }
        
        /// <summary>
        /// Test GetVirtualHost
        /// </summary>
        [Fact]
        public void GetVirtualHostTest()
        {
            // TODO uncomment below to test the method and replace null with proper value
            //string vhost = null;
            //var response = instance.GetVirtualHost(vhost);
            //Assert.IsType<VHost> (response, "response is VHost");
        }
        
        /// <summary>
        /// Test ListVirtualHosts
        /// </summary>
        [Fact]
        public void ListVirtualHostsTest()
        {
            // TODO uncomment below to test the method and replace null with proper value
            //var response = instance.ListVirtualHosts();
            //Assert.IsType<ICollection<VHost>> (response, "response is ICollection<VHost>");
        }
        
    }

}

using NUnit.Framework;
using RestSharp;
using System.Net;

namespace NUnitProjectInvokeApiRest
{
    public class InvokeApiRest
    {
        [SetUp]
        public void Setup()
        {
        }

        [Test]
        public void SucessStatusCodeTest()
        {
            string cep = "54160000";
            var client = new RestClient($"https://viacep.com.br/ws/{cep}/json/");
            RestRequest request = new RestRequest("", Method.GET);

            // act
            IRestResponse response = client.Execute(request);

            // assert
            Assert.That(response.StatusCode, Is.EqualTo(HttpStatusCode.OK));
        }

        [Test]
        public void BadRequestStatusCodeTest()
        {
            string cep = "";
            var client = new RestClient($"https://viacep.com.br/ws/{cep}/json/");
            RestRequest request = new RestRequest("", Method.GET);

            // act
            IRestResponse response = client.Execute(request);

            // assert
            Assert.That(response.StatusCode, Is.EqualTo(HttpStatusCode.BadRequest));
        }
    }
}
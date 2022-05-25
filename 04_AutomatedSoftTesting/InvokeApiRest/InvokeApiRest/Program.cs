using System;
using RestSharp;

namespace InvokeApiRest
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Informar o Cep que deseja validar!");
            string cep = Console.ReadLine();
            //string cep = "54160000";

            InvocarGet(cep);
        }

        private static void InvocarGet(string cep)
        {
            var client = new RestClient($"https://viacep.com.br/ws/{cep}/json/");
            RestRequest request = new RestRequest("", Method.GET);
            var response = client.Execute(request);

            if (response.StatusCode == System.Net.HttpStatusCode.OK)
                Console.WriteLine(response.Content);
            else
            {
                Console.WriteLine(response.ErrorMessage);
            }

            Console.ReadKey();
        }
    }
}

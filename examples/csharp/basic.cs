/*
 * HTML to Text API - Basic Usage Example
 *
 * This example demonstrates the basic usage of the HTML to Text API.
 * API Documentation: https://docs.apiverve.com/ref/htmltotext
 */

using System;
using System.Net.Http;
using System.Text;
using System.Text.Json;
using System.Threading.Tasks;
using System.Linq;

namespace APIVerve.Examples
{
    class HTMLtoTextExample
    {
        private static readonly string API_KEY = Environment.GetEnvironmentVariable("APIVERVE_API_KEY") ?? "YOUR_API_KEY_HERE";
        private static readonly string API_URL = "https://api.apiverve.com/v1/htmltotext";

        /// <summary>
        /// Make a POST request to the HTML to Text API
        /// </summary>
        static async Task<JsonDocument> CallHTMLtoTextAPI()
        {
            try
            {
                using var client = new HttpClient();
                client.DefaultRequestHeaders.Add("x-api-key", API_KEY);

                // Request body
                var requestBody &#x3D; new { html &#x3D; &quot;&lt;!doctype html&gt; &lt;html&gt;  &lt;head&gt; &lt;title&gt;This is the title of the webpage!&lt;/title&gt; &lt;/head&gt; &lt;body&gt; &lt;p&gt;This is an example paragraph. Anything in the &lt;strong&gt;body&lt;/strong&gt; tag will appear on the page, just like this &lt;strong&gt;p&lt;/strong&gt; tag and its contents.&lt;/p&gt; &lt;/body&gt; &lt;/html&gt;&quot; };

                var jsonContent = JsonSerializer.Serialize(requestBody);
                var content = new StringContent(jsonContent, Encoding.UTF8, "application/json");

                var response = await client.PostAsync(API_URL, content);

                // Check if response is successful
                response.EnsureSuccessStatusCode();

                var responseBody = await response.Content.ReadAsStringAsync();
                var data = JsonDocument.Parse(responseBody);

                // Check API response status
                if (data.RootElement.GetProperty("status").GetString() == "ok")
                {
                    Console.WriteLine("✓ Success!");
                    Console.WriteLine("Response data: " + data.RootElement.GetProperty("data"));
                    return data;
                }
                else
                {
                    var error = data.RootElement.TryGetProperty("error", out var errorProp)
                        ? errorProp.GetString()
                        : "Unknown error";
                    Console.WriteLine($"✗ API Error: {error}");
                    return null;
                }
            }
            catch (HttpRequestException e)
            {
                Console.WriteLine($"✗ Request failed: {e.Message}");
                return null;
            }
        }

        static async Task Main(string[] args)
        {
            Console.WriteLine("📤 Calling HTML to Text API...\n");

            var result = await CallHTMLtoTextAPI();

            if (result != null)
            {
                Console.WriteLine("\n📊 Final Result:");
                Console.WriteLine(result.RootElement.GetProperty("data"));
            }
            else
            {
                Console.WriteLine("\n✗ API call failed");
            }
        }
    }
}

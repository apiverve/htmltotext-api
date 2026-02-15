using System;
using System.Collections.Generic;
using System.Text;
using Newtonsoft.Json;

namespace APIVerve.API.HTMLtoText
{
    /// <summary>
    /// Query options for the HTML to Text API
    /// </summary>
    public class HTMLtoTextQueryOptions
    {
        /// <summary>
        /// The HTML to convert to text
        /// </summary>
        [JsonProperty("html")]
        public string Html { get; set; }
    }
}

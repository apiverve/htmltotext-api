# HTML to Text API - Ruby Gem

HTML to Text extracts clean plain text from raw HTML markup, reporting word counts and character counts. It identifies main article bodies automatically, records the extraction method used, and notes whether parsing succeeded.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'apiverve_htmltotext'
```

And then execute:

```bash
$ bundle install
```

Or install it yourself as:

```bash
$ gem install apiverve_htmltotext
```

## Getting Started

Get your API key at [APIVerve](https://apiverve.com)

### Basic Usage

```ruby
require 'apiverve_htmltotext'

# Initialize the client
client = APIVerve::Htmltotext::Client.new(api_key: "YOUR_API_KEY")

# Make a request
response = client.execute({ html: "<!doctype html> <html>  <head> <title>This is the title of the webpage!</title> </head> <body> <p>This is an example paragraph. Anything in the <strong>body</strong> tag will appear on the page, just like this <strong>p</strong> tag and its contents.</p> </body> </html>" })

# Print the response
puts response
```


### Error Handling

```ruby
begin
  response = client.execute({ html: "<!doctype html> <html>  <head> <title>This is the title of the webpage!</title> </head> <body> <p>This is an example paragraph. Anything in the <strong>body</strong> tag will appear on the page, just like this <strong>p</strong> tag and its contents.</p> </body> </html>" })
  puts response["data"]
rescue APIVerve::Htmltotext::ValidationError => e
  puts "Validation error: #{e.errors.join(', ')}"
rescue APIVerve::Htmltotext::APIError => e
  puts "API error: #{e.message}"
  puts "Status code: #{e.status_code}"
end
```

### Debug Mode

```ruby
# Enable debug logging
client = APIVerve::Htmltotext::Client.new(
  api_key: "YOUR_API_KEY",
  debug: true
)
```

## Example Response

```json
{
  "status": "ok",
  "error": null,
  "data": {
    "text": "This is an example paragraph. Anything in the body tag will appear on the page, just like this p tag and its contents.",
    "parsed": true,
    "extractionMethod": "article",
    "detectedLanguage": {
      "language": "english",
      "confidence": 0.3507446808510638
    },
    "characterCount": 118,
    "wordCount": 23
  }
}
```

## Documentation

For more information, visit the [API Documentation](https://docs.apiverve.com/ref/htmltotext?utm_source=rubygems&utm_medium=referral&utm_content=readme).

## Support

- Website: [https://apiverve.com/marketplace/htmltotext?utm_source=ruby&utm_medium=referral&utm_content=readme](https://apiverve.com/marketplace/htmltotext?utm_source=ruby&utm_medium=referral&utm_content=readme)
- Email: hello@apiverve.com

## License

This gem is available under the [MIT License](LICENSE).

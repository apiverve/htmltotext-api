# HTML to Text API - PHP Package

HTML to Text is a simple tool for converting HTML to text. It returns the text extracted from the HTML.

## Installation

Install via Composer:

```bash
composer require apiverve/htmltotext
```

## Getting Started

Get your API key at [APIVerve](https://apiverve.com)

### Basic Usage

```php
<?php

require_once 'vendor/autoload.php';

use APIVerve\Htmltotext\Client;

// Initialize the client
$client = new Client('YOUR_API_KEY');

// Make a request
$response = $client->execute(['html' => '<!doctype html> <html>  <head> <title>This is the title of the webpage!</title> </head> <body> <p>This is an example paragraph. Anything in the <strong>body</strong> tag will appear on the page, just like this <strong>p</strong> tag and its contents.</p> </body> </html>']);

// Print the response
print_r($response);
```


### Error Handling

```php
use APIVerve\Htmltotext\Client;
use APIVerve\Htmltotext\Exceptions\APIException;
use APIVerve\Htmltotext\Exceptions\ValidationException;

try {
    $response = $client->execute(['html' => '<!doctype html> <html>  <head> <title>This is the title of the webpage!</title> </head> <body> <p>This is an example paragraph. Anything in the <strong>body</strong> tag will appear on the page, just like this <strong>p</strong> tag and its contents.</p> </body> </html>']);
    print_r($response['data']);
} catch (ValidationException $e) {
    echo "Validation error: " . implode(', ', $e->getErrors());
} catch (APIException $e) {
    echo "API error: " . $e->getMessage();
    echo "Status code: " . $e->getStatusCode();
}
```

### Debug Mode

```php
// Enable debug logging
$client = new Client(
    apiKey: 'YOUR_API_KEY',
    debug: true
);
```

## Example Response

```json
{
  "status": "ok",
  "error": null,
  "data": {
    "text": "This is an example paragraph. Anything in the body tag will appear on the page, just like this p tag and its contents.",
    "parsed": true,
    "detectedLanguage": {
      "language": "english",
      "confidence": 0.3507446808510638
    },
    "characterCount": 118,
    "wordCount": 22
  }
}
```

## Requirements

- PHP 7.4 or higher
- Guzzle HTTP client

## Documentation

For more information, visit the [API Documentation](https://docs.apiverve.com/ref/htmltotext?utm_source=packagist&utm_medium=readme).

## Support

- Website: [https://htmltotext.apiverve.com?utm_source=php&utm_medium=readme](https://htmltotext.apiverve.com?utm_source=php&utm_medium=readme)
- Email: hello@apiverve.com

## License

This package is available under the [MIT License](LICENSE).

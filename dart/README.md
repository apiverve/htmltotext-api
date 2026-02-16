# HTML to Text API - Dart/Flutter Client

HTML to Text is a simple tool for converting HTML to text. It returns the text extracted from the HTML.

[![pub package](https://img.shields.io/pub/v/apiverve_htmltotext.svg)](https://pub.dev/packages/apiverve_htmltotext)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

This is the Dart/Flutter client for the [HTML to Text API](https://htmltotext.apiverve.com?utm_source=dart&utm_medium=readme).

## Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  apiverve_htmltotext: ^1.1.14
```

Then run:

```bash
dart pub get
# or for Flutter
flutter pub get
```

## Usage

```dart
import 'package:apiverve_htmltotext/apiverve_htmltotext.dart';

void main() async {
  final client = HtmltotextClient('YOUR_API_KEY');

  try {
    final response = await client.execute({
      'html': '<!doctype html> <html>  <head> <title>This is the title of the webpage!</title> </head> <body> <p>This is an example paragraph. Anything in the <strong>body</strong> tag will appear on the page, just like this <strong>p</strong> tag and its contents.</p> </body> </html>'
    });

    print('Status: ${response.status}');
    print('Data: ${response.data}');
  } catch (e) {
    print('Error: $e');
  }
}
```

## Response

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
    }
  }
}
```

## API Reference

- **API Home:** [HTML to Text API](https://htmltotext.apiverve.com?utm_source=dart&utm_medium=readme)
- **Documentation:** [docs.apiverve.com/ref/htmltotext](https://docs.apiverve.com/ref/htmltotext?utm_source=dart&utm_medium=readme)

## Authentication

All requests require an API key. Get yours at [apiverve.com](https://apiverve.com?utm_source=dart&utm_medium=readme).

## License

MIT License - see [LICENSE](LICENSE) for details.

---

Built with Dart for [APIVerve](https://apiverve.com?utm_source=dart&utm_medium=readme)

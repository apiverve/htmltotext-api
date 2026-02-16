/// Response models for the HTML to Text API.

/// API Response wrapper.
class HtmltotextResponse {
  final String status;
  final dynamic error;
  final HtmltotextData? data;

  HtmltotextResponse({
    required this.status,
    this.error,
    this.data,
  });

  factory HtmltotextResponse.fromJson(Map<String, dynamic> json) => HtmltotextResponse(
    status: json['status'] as String? ?? '',
    error: json['error'],
    data: json['data'] != null ? HtmltotextData.fromJson(json['data']) : null,
  );

  Map<String, dynamic> toJson() => {
    'status': status,
    if (error != null) 'error': error,
    if (data != null) 'data': data,
  };
}

/// Response data for the HTML to Text API.

class HtmltotextData {
  String? text;
  bool? parsed;
  HtmltotextDataDetectedlanguage? detectedLanguage;

  HtmltotextData({
    this.text,
    this.parsed,
    this.detectedLanguage,
  });

  factory HtmltotextData.fromJson(Map<String, dynamic> json) => HtmltotextData(
      text: json['text'],
      parsed: json['parsed'],
      detectedLanguage: json['detectedLanguage'] != null ? HtmltotextDataDetectedlanguage.fromJson(json['detectedLanguage']) : null,
    );
}

class HtmltotextDataDetectedlanguage {
  String? language;
  double? confidence;

  HtmltotextDataDetectedlanguage({
    this.language,
    this.confidence,
  });

  factory HtmltotextDataDetectedlanguage.fromJson(Map<String, dynamic> json) => HtmltotextDataDetectedlanguage(
      language: json['language'],
      confidence: json['confidence'],
    );
}

class HtmltotextRequest {
  String html;

  HtmltotextRequest({
    required this.html,
  });

  Map<String, dynamic> toJson() => {
      'html': html,
    };
}

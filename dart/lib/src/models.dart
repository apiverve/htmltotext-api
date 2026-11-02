/// Response models for the HTML to Text API.

/// API Response wrapper.
class HtmltotextResponse {
  final String status;
  final dynamic error;
  final HtmltotextData? data;

  /// Set only when the current plan locks one or more fields; null otherwise.
  final PremiumInfo? premium;

  HtmltotextResponse({
    required this.status,
    this.error,
    this.data,
    this.premium,
  });

  factory HtmltotextResponse.fromJson(Map<String, dynamic> json) => HtmltotextResponse(
    status: json['status'] as String? ?? '',
    error: json['error'],
    data: json['data'] != null ? HtmltotextData.fromJson(json['data']) : null,
    premium: json['premium'] != null ? PremiumInfo.fromJson(json['premium']) : null,
  );

  Map<String, dynamic> toJson() => {
    'status': status,
    if (error != null) 'error': error,
    if (data != null) 'data': data,
    if (premium != null) 'premium': premium!.toJson(),
  };
}

/// Describes fields the current plan does not unlock. Locked fields arrive as null
/// in [data], and [lockedFields] names them (nested ones use dot paths).
class PremiumInfo {
  final String? message;
  final String? upgradeUrl;
  final List<String>? lockedFields;

  PremiumInfo({this.message, this.upgradeUrl, this.lockedFields});

  factory PremiumInfo.fromJson(Map<String, dynamic> json) => PremiumInfo(
    message: json['message'] as String?,
    upgradeUrl: json['upgrade_url'] as String?,
    lockedFields: (json['locked_fields'] as List?)?.map((e) => e.toString()).toList(),
  );

  Map<String, dynamic> toJson() => {
    if (message != null) 'message': message,
    if (upgradeUrl != null) 'upgrade_url': upgradeUrl,
    if (lockedFields != null) 'locked_fields': lockedFields,
  };
}

/// Response data for the HTML to Text API.

class HtmltotextData {
  String? text;
  bool? parsed;
  String? extractionMethod;
  HtmltotextDataDetectedlanguage? detectedLanguage;
  num? characterCount;
  num? wordCount;

  HtmltotextData({
    this.text,
    this.parsed,
    this.extractionMethod,
    this.detectedLanguage,
    this.characterCount,
    this.wordCount,
  });

  factory HtmltotextData.fromJson(Map<String, dynamic> json) => HtmltotextData(
      text: json['text'],
      parsed: json['parsed'],
      extractionMethod: json['extractionMethod'],
      detectedLanguage: json['detectedLanguage'] != null ? HtmltotextDataDetectedlanguage.fromJson(json['detectedLanguage']) : null,
      characterCount: json['characterCount'],
      wordCount: json['wordCount'],
    );
}

class HtmltotextDataDetectedlanguage {
  String? language;
  num? confidence;

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

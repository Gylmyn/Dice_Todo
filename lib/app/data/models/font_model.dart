class FontModel {
  final String value;

  FontModel({
    required this.value,
  });

  factory FontModel.fromJson(Map<String, dynamic> json) {
    return FontModel(value: json['value']);
  }
}

class Body {
  String? count;
  String? description;
  String? reference;
  String? zekr;

  Body({this.count, this.description, this.reference, this.zekr});

  factory Body.fromJson(Map<String, dynamic> json) => Body(
        count: json['count'] as String?,
        description: json['description'] as String?,
        reference: json['reference'] as String?,
        zekr: json['zekr'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'count': count,
        'description': description,
        'reference': reference,
        'zekr': zekr,
      };
}

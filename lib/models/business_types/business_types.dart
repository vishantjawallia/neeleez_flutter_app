class BusinessTypes {
  final int? businessTypeId;
  final int? countryId;
  final int? serviceCategoryId;
  final String? businessTypeNameEn;
  final String? businessTypeNameAr;
  final String? businessTypeNameFr;
  final dynamic iconImage;
  const BusinessTypes({this.businessTypeId, this.countryId, this.serviceCategoryId, this.businessTypeNameEn, this.businessTypeNameAr, this.businessTypeNameFr, this.iconImage});
  BusinessTypes copyWith({int? businessTypeId, int? countryId, int? serviceCategoryId, String? businessTypeNameEn, String? businessTypeNameAr, String? businessTypeNameFr, dynamic? iconImage}) {
    return BusinessTypes(
        businessTypeId: businessTypeId ?? this.businessTypeId,
        countryId: countryId ?? this.countryId,
        serviceCategoryId: serviceCategoryId ?? this.serviceCategoryId,
        businessTypeNameEn: businessTypeNameEn ?? this.businessTypeNameEn,
        businessTypeNameAr: businessTypeNameAr ?? this.businessTypeNameAr,
        businessTypeNameFr: businessTypeNameFr ?? this.businessTypeNameFr,
        iconImage: iconImage ?? this.iconImage);
  }

  Map<String, Object?> toJson() {
    return {
      'businessTypeId': businessTypeId,
      'countryId': countryId,
      'serviceCategoryId': serviceCategoryId,
      'businessTypeNameEn': businessTypeNameEn,
      'businessTypeNameAr': businessTypeNameAr,
      'businessTypeNameFr': businessTypeNameFr,
      'iconImage': iconImage
    };
  }

  static BusinessTypes fromJson(Map<String, Object?> json) {
    return BusinessTypes(
        businessTypeId: json['businessTypeId'] == null ? null : json['businessTypeId'] as int,
        countryId: json['countryId'] == null ? null : json['countryId'] as int,
        serviceCategoryId: json['serviceCategoryId'] == null ? null : json['serviceCategoryId'] as int,
        businessTypeNameEn: json['businessTypeNameEn'] == null ? null : json['businessTypeNameEn'] as String,
        businessTypeNameAr: json['businessTypeNameAr'] == null ? null : json['businessTypeNameAr'] as String,
        businessTypeNameFr: json['businessTypeNameFr'] == null ? null : json['businessTypeNameFr'] as String,
        iconImage: json['iconImage'] as dynamic);
  }

  static List<BusinessTypes> fromJsonList(dynamic json) {
    List<BusinessTypes> businessTypesList = [];
    for (Map<String, dynamic> element in json) {
      businessTypesList.add(BusinessTypes.fromJson(element));
    }
    return businessTypesList;
  }

  @override
  String toString() {
    return '''BusinessTypes(
                businessTypeId:$businessTypeId,
countryId:$countryId,
serviceCategoryId:$serviceCategoryId,
businessTypeNameEn:$businessTypeNameEn,
businessTypeNameAr:$businessTypeNameAr,
businessTypeNameFr:$businessTypeNameFr,
iconImage:$iconImage
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is BusinessTypes &&
        other.runtimeType == runtimeType &&
        other.businessTypeId == businessTypeId &&
        other.countryId == countryId &&
        other.serviceCategoryId == serviceCategoryId &&
        other.businessTypeNameEn == businessTypeNameEn &&
        other.businessTypeNameAr == businessTypeNameAr &&
        other.businessTypeNameFr == businessTypeNameFr &&
        other.iconImage == iconImage;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, businessTypeId, countryId, serviceCategoryId, businessTypeNameEn, businessTypeNameAr, businessTypeNameFr, iconImage);
  }
}

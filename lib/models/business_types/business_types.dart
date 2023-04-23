class BusinessType {
  final int? id;
  final int? countryId;
  final int? businessServiceId;
  final String? businessTypeNameEn;
  final String? businessTypeNameAr;
  final String? businessTypeNameFr;
  final dynamic businessService;
  final dynamic businessServiceAr;
  final dynamic iconImage;
  final bool? isActive;
  final int? userId;

  const BusinessType({
    this.id,
    this.countryId,
    this.businessServiceId,
    this.businessTypeNameEn,
    this.businessTypeNameAr,
    this.businessTypeNameFr,
    this.businessService,
    this.businessServiceAr,
    this.iconImage,
    this.isActive,
    this.userId,
  });
  BusinessType copyWith({
    int? id,
    int? countryId,
    int? businessServiceId,
    String? businessTypeNameEn,
    String? businessTypeNameAr,
    String? businessTypeNameFr,
    dynamic? businessService,
    dynamic? businessServiceAr,
    dynamic? iconImage,
    bool? isActive,
    int? userId,
  }) {
    return BusinessType(
      id: id ?? this.id,
      countryId: countryId ?? this.countryId,
      businessServiceId: businessServiceId ?? this.businessServiceId,
      businessTypeNameEn: businessTypeNameEn ?? this.businessTypeNameEn,
      businessTypeNameAr: businessTypeNameAr ?? this.businessTypeNameAr,
      businessTypeNameFr: businessTypeNameFr ?? this.businessTypeNameFr,
      businessService: businessService ?? this.businessService,
      businessServiceAr: businessServiceAr ?? this.businessServiceAr,
      iconImage: iconImage ?? this.iconImage,
      isActive: isActive ?? this.isActive,
      userId: userId ?? this.userId,
    );
  }

  Map<String, Object?> toJson() {
    return {
      'id': id,
      'countryId': countryId,
      'businessServiceId': businessServiceId,
      'businessTypeNameEn': businessTypeNameEn,
      'businessTypeNameAr': businessTypeNameAr,
      'businessTypeNameFr': businessTypeNameFr,
      'businessService': businessService,
      'businessServiceAr': businessServiceAr,
      'iconImage': iconImage,
      'isActive': isActive,
      'userId': userId
    };
  }

  static BusinessType fromJson(Map<String, Object?> json) {
    return BusinessType(
      id: json['id'] == null ? null : json['id'] as int,
      countryId: json['countryId'] == null ? null : json['countryId'] as int,
      businessServiceId: json['businessServiceId'] == null ? null : json['businessServiceId'] as int,
      businessTypeNameEn: json['businessTypeNameEn'] == null ? null : json['businessTypeNameEn'] as String,
      businessTypeNameAr: json['businessTypeNameAr'] == null ? null : json['businessTypeNameAr'] as String,
      businessTypeNameFr: json['businessTypeNameFr'] == null ? null : json['businessTypeNameFr'] as String,
      businessService: json['businessService'] as dynamic,
      businessServiceAr: json['businessServiceAr'] as dynamic,
      iconImage: json['iconImage'] as dynamic,
      isActive: json['isActive'] == null ? null : json['isActive'] as bool,
      userId: json['userId'] == null ? null : json['userId'] as int,
    );
  }

  @override
  String toString() {
    return '''BusinessType(
                id:$id,
                countryId:$countryId,
                businessServiceId:$businessServiceId,
                businessTypeNameEn:$businessTypeNameEn,
                businessTypeNameAr:$businessTypeNameAr,
                businessTypeNameFr:$businessTypeNameFr,
                businessService:$businessService,
                businessServiceAr:$businessServiceAr,
                iconImage:$iconImage,
                isActive:$isActive,
                userId:$userId
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is BusinessType &&
        other.runtimeType == runtimeType &&
        other.id == id &&
        other.countryId == countryId &&
        other.businessServiceId == businessServiceId &&
        other.businessTypeNameEn == businessTypeNameEn &&
        other.businessTypeNameAr == businessTypeNameAr &&
        other.businessTypeNameFr == businessTypeNameFr &&
        other.businessService == businessService &&
        other.businessServiceAr == businessServiceAr &&
        other.iconImage == iconImage &&
        other.isActive == isActive &&
        other.userId == userId;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, id, countryId, businessServiceId, businessTypeNameEn, businessTypeNameAr, businessTypeNameFr, businessService, businessServiceAr, iconImage, isActive, userId);
  }
}

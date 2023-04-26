class BusinessServicesByCountry {
  final int? businessServiceId;
  final String? service;
  final String? serviceAr;
  final String? serviceFr;
  final String? iconImage;
  final bool? isActive;
  final int? userId;
  final String? stateDate;

  const BusinessServicesByCountry({
    this.businessServiceId,
    this.service,
    this.serviceAr,
    this.serviceFr,
    this.iconImage,
    this.isActive,
    this.userId,
    this.stateDate,
  });

  BusinessServicesByCountry copyWith({
    int? businessServiceId,
    String? service,
    String? serviceAr,
    String? serviceFr,
    String? iconImage,
    bool? isActive,
    int? userId,
    String? stateDate,
  }) {
    return BusinessServicesByCountry(
      businessServiceId: businessServiceId ?? this.businessServiceId,
      service: service ?? this.service,
      serviceAr: serviceAr ?? this.serviceAr,
      serviceFr: serviceFr ?? this.serviceFr,
      iconImage: iconImage ?? this.iconImage,
      isActive: isActive ?? this.isActive,
      userId: userId ?? this.userId,
      stateDate: stateDate ?? this.stateDate,
    );
  }

  Map<String, Object?> toJson() {
    return {
      'businessServiceId': businessServiceId,
      'service': service,
      'serviceAr': serviceAr,
      'serviceFr': serviceFr,
      'iconImage': iconImage,
      'isActive': isActive,
      'userId': userId,
      'stateDate': stateDate
    };
  }

  static BusinessServicesByCountry fromJson(Map<String, Object?> json) {
    return BusinessServicesByCountry(
      businessServiceId: json['businessServiceId'] == null ? null : json['businessServiceId'] as int,
      service: json['service'] == null ? null : json['service'] as String,
      serviceAr: json['serviceAr'] == null ? null : json['serviceAr'] as String,
      serviceFr: json['serviceFr'] == null ? null : json['serviceFr'] as String,
      iconImage: json['iconImage'] == null ? null : json['iconImage'] as String,
      isActive: json['isActive'] == null ? null : json['isActive'] as bool,
      userId: json['userId'] == null ? null : json['userId'] as int,
      stateDate: json['stateDate'] == null ? null : json['stateDate'] as String,
    );
  }

  static List<BusinessServicesByCountry> fromJsonList(dynamic json) {
    List<BusinessServicesByCountry> businessServicesByCountryList = [];
    for (Map<String, dynamic> element in json) {
      businessServicesByCountryList.add(BusinessServicesByCountry.fromJson(element));
    }
    return businessServicesByCountryList;
  }

  @override
  String toString() {
    return '''BusinessServicesByCountry(
              businessServiceId:$businessServiceId,
              service:$service,
              serviceAr:$serviceAr,
              serviceFr:$serviceFr,
              iconImage:$iconImage,
              isActive:$isActive,
              userId:$userId,
              stateDate:$stateDate
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is BusinessServicesByCountry &&
        other.runtimeType == runtimeType &&
        other.businessServiceId == businessServiceId &&
        other.service == service &&
        other.serviceAr == serviceAr &&
        other.serviceFr == serviceFr &&
        other.iconImage == iconImage &&
        other.isActive == isActive &&
        other.userId == userId &&
        other.stateDate == stateDate;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, businessServiceId, service, serviceAr, serviceFr, iconImage, isActive, userId, stateDate);
  }
}

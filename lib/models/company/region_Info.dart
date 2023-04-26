class RegionInformation {
  final String? address;
  final String? googleAddress;
  final double? lattitude;
  final double? longitude;
  final int? countryId;
  final String? countryNameEn;
  final String? countryNameAr;
  final String? countryNameFr;
  final int? provinceId;
  final String? provinceNameEn;
  final String? provinceNameAr;
  final String? provinceNameFr;
  final int? cityId;
  final String? cityNameEn;
  final String? cityNameAr;
  final String? cityNameFr;
  final int? areaId;
  final dynamic areaNameEn;
  final dynamic areaNameAr;
  final dynamic areaNameFr;
  const RegionInformation(
      {this.address,
      this.googleAddress,
      this.lattitude,
      this.longitude,
      this.countryId,
      this.countryNameEn,
      this.countryNameAr,
      this.countryNameFr,
      this.provinceId,
      this.provinceNameEn,
      this.provinceNameAr,
      this.provinceNameFr,
      this.cityId,
      this.cityNameEn,
      this.cityNameAr,
      this.cityNameFr,
      this.areaId,
      this.areaNameEn,
      this.areaNameAr,
      this.areaNameFr});
  RegionInformation copyWith(
      {String? address,
      String? googleAddress,
      double? lattitude,
      double? longitude,
      int? countryId,
      String? countryNameEn,
      String? countryNameAr,
      String? countryNameFr,
      int? provinceId,
      String? provinceNameEn,
      String? provinceNameAr,
      String? provinceNameFr,
      int? cityId,
      String? cityNameEn,
      String? cityNameAr,
      String? cityNameFr,
      int? areaId,
      dynamic? areaNameEn,
      dynamic? areaNameAr,
      dynamic? areaNameFr}) {
    return RegionInformation(
        address: address ?? this.address,
        googleAddress: googleAddress ?? this.googleAddress,
        lattitude: lattitude ?? this.lattitude,
        longitude: longitude ?? this.longitude,
        countryId: countryId ?? this.countryId,
        countryNameEn: countryNameEn ?? this.countryNameEn,
        countryNameAr: countryNameAr ?? this.countryNameAr,
        countryNameFr: countryNameFr ?? this.countryNameFr,
        provinceId: provinceId ?? this.provinceId,
        provinceNameEn: provinceNameEn ?? this.provinceNameEn,
        provinceNameAr: provinceNameAr ?? this.provinceNameAr,
        provinceNameFr: provinceNameFr ?? this.provinceNameFr,
        cityId: cityId ?? this.cityId,
        cityNameEn: cityNameEn ?? this.cityNameEn,
        cityNameAr: cityNameAr ?? this.cityNameAr,
        cityNameFr: cityNameFr ?? this.cityNameFr,
        areaId: areaId ?? this.areaId,
        areaNameEn: areaNameEn ?? this.areaNameEn,
        areaNameAr: areaNameAr ?? this.areaNameAr,
        areaNameFr: areaNameFr ?? this.areaNameFr);
  }

  Map<String, Object?> toJson() {
    return {
      'address': address,
      'googleAddress': googleAddress,
      'lattitude': lattitude,
      'longitude': longitude,
      'countryId': countryId,
      'countryNameEn': countryNameEn,
      'countryNameAr': countryNameAr,
      'countryNameFr': countryNameFr,
      'provinceId': provinceId,
      'provinceNameEn': provinceNameEn,
      'provinceNameAr': provinceNameAr,
      'provinceNameFr': provinceNameFr,
      'cityId': cityId,
      'cityNameEn': cityNameEn,
      'cityNameAr': cityNameAr,
      'cityNameFr': cityNameFr,
      'areaId': areaId,
      'areaNameEn': areaNameEn,
      'areaNameAr': areaNameAr,
      'areaNameFr': areaNameFr
    };
  }

  static RegionInformation fromJson(Map<String, Object?> json) {
    return RegionInformation(
        address: json['address'] == null ? null : json['address'] as String,
        googleAddress: json['googleAddress'] == null ? null : json['googleAddress'] as String,
        lattitude: json['lattitude'] == null ? null : json['lattitude'] as double,
        longitude: json['longitude'] == null ? null : json['longitude'] as double,
        countryId: json['countryId'] == null ? null : json['countryId'] as int,
        countryNameEn: json['countryNameEn'] == null ? null : json['countryNameEn'] as String,
        countryNameAr: json['countryNameAr'] == null ? null : json['countryNameAr'] as String,
        countryNameFr: json['countryNameFr'] == null ? null : json['countryNameFr'] as String,
        provinceId: json['provinceId'] == null ? null : json['provinceId'] as int,
        provinceNameEn: json['provinceNameEn'] == null ? null : json['provinceNameEn'] as String,
        provinceNameAr: json['provinceNameAr'] == null ? null : json['provinceNameAr'] as String,
        provinceNameFr: json['provinceNameFr'] == null ? null : json['provinceNameFr'] as String,
        cityId: json['cityId'] == null ? null : json['cityId'] as int,
        cityNameEn: json['cityNameEn'] == null ? null : json['cityNameEn'] as String,
        cityNameAr: json['cityNameAr'] == null ? null : json['cityNameAr'] as String,
        cityNameFr: json['cityNameFr'] == null ? null : json['cityNameFr'] as String,
        areaId: json['areaId'] == null ? null : json['areaId'] as int,
        areaNameEn: json['areaNameEn'] as dynamic,
        areaNameAr: json['areaNameAr'] as dynamic,
        areaNameFr: json['areaNameFr'] as dynamic);
  }

  @override
  String toString() {
    return '''RegionInformation(
                address:$address,
googleAddress:$googleAddress,
lattitude:$lattitude,
longitude:$longitude,
countryId:$countryId,
countryNameEn:$countryNameEn,
countryNameAr:$countryNameAr,
countryNameFr:$countryNameFr,
provinceId:$provinceId,
provinceNameEn:$provinceNameEn,
provinceNameAr:$provinceNameAr,
provinceNameFr:$provinceNameFr,
cityId:$cityId,
cityNameEn:$cityNameEn,
cityNameAr:$cityNameAr,
cityNameFr:$cityNameFr,
areaId:$areaId,
areaNameEn:$areaNameEn,
areaNameAr:$areaNameAr,
areaNameFr:$areaNameFr
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is RegionInformation &&
        other.runtimeType == runtimeType &&
        other.address == address &&
        other.googleAddress == googleAddress &&
        other.lattitude == lattitude &&
        other.longitude == longitude &&
        other.countryId == countryId &&
        other.countryNameEn == countryNameEn &&
        other.countryNameAr == countryNameAr &&
        other.countryNameFr == countryNameFr &&
        other.provinceId == provinceId &&
        other.provinceNameEn == provinceNameEn &&
        other.provinceNameAr == provinceNameAr &&
        other.provinceNameFr == provinceNameFr &&
        other.cityId == cityId &&
        other.cityNameEn == cityNameEn &&
        other.cityNameAr == cityNameAr &&
        other.cityNameFr == cityNameFr &&
        other.areaId == areaId &&
        other.areaNameEn == areaNameEn &&
        other.areaNameAr == areaNameAr &&
        other.areaNameFr == areaNameFr;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, address, googleAddress, lattitude, longitude, countryId, countryNameEn, countryNameAr, countryNameFr, provinceId, provinceNameEn, provinceNameAr, provinceNameFr,
        cityId, cityNameEn, cityNameAr, cityNameFr, areaId, areaNameEn, areaNameAr);
  }
}

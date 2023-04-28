class Cities {
  final int? cityId;
  final int? provinceId;
  final String? provinceNameEn;
  final String? provinceNameFr;
  final String? provinceNameAr;
  final String? cityNameEn;
  final String? cityNameFr;
  final String? cityNameAr;
  final String? countryNameEn;
  final String? countryNameFr;
  final String? countryNameAr;
  final bool? isActive;
  final int? countryId;
  final String? isDeleted;
  final String? dateAdded;
  final String? dateModified;
  const Cities(
      {this.cityId,
      this.provinceId,
      this.provinceNameEn,
      this.provinceNameFr,
      this.provinceNameAr,
      this.cityNameEn,
      this.cityNameFr,
      this.cityNameAr,
      this.countryNameEn,
      this.countryNameFr,
      this.countryNameAr,
      this.isActive,
      this.countryId,
      this.isDeleted,
      this.dateAdded,
      this.dateModified});
  Cities copyWith(
      {int? cityId,
      int? provinceId,
      String? provinceNameEn,
      String? provinceNameFr,
      String? provinceNameAr,
      String? cityNameEn,
      String? cityNameFr,
      String? cityNameAr,
      String? countryNameEn,
      String? countryNameFr,
      String? countryNameAr,
      bool? isActive,
      int? countryId,
      String? isDeleted,
      String? dateAdded,
      String? dateModified}) {
    return Cities(
        cityId: cityId ?? this.cityId,
        provinceId: provinceId ?? this.provinceId,
        provinceNameEn: provinceNameEn ?? this.provinceNameEn,
        provinceNameFr: provinceNameFr ?? this.provinceNameFr,
        provinceNameAr: provinceNameAr ?? this.provinceNameAr,
        cityNameEn: cityNameEn ?? this.cityNameEn,
        cityNameFr: cityNameFr ?? this.cityNameFr,
        cityNameAr: cityNameAr ?? this.cityNameAr,
        countryNameEn: countryNameEn ?? this.countryNameEn,
        countryNameFr: countryNameFr ?? this.countryNameFr,
        countryNameAr: countryNameAr ?? this.countryNameAr,
        isActive: isActive ?? this.isActive,
        countryId: countryId ?? this.countryId,
        isDeleted: isDeleted ?? this.isDeleted,
        dateAdded: dateAdded ?? this.dateAdded,
        dateModified: dateModified ?? this.dateModified);
  }

  Map<String, Object?> toJson() {
    return {
      'cityId': cityId,
      'provinceId': provinceId,
      'provinceNameEn': provinceNameEn,
      'provinceNameFr': provinceNameFr,
      'provinceNameAr': provinceNameAr,
      'cityNameEn': cityNameEn,
      'cityNameFr': cityNameFr,
      'cityNameAr': cityNameAr,
      'countryNameEn': countryNameEn,
      'countryNameFr': countryNameFr,
      'countryNameAr': countryNameAr,
      'isActive': isActive,
      'countryId': countryId,
      'isDeleted': isDeleted,
      'dateAdded': dateAdded,
      'dateModified': dateModified
    };
  }

  static Cities fromJson(Map<String, Object?> json) {
    return Cities(
        cityId: json['cityId'] == null ? null : json['cityId'] as int,
        provinceId: json['provinceId'] == null ? null : json['provinceId'] as int,
        provinceNameEn: json['provinceNameEn'] == null ? null : json['provinceNameEn'] as String,
        provinceNameFr: json['provinceNameFr'] == null ? null : json['provinceNameFr'] as String,
        provinceNameAr: json['provinceNameAr'] == null ? null : json['provinceNameAr'] as String,
        cityNameEn: json['cityNameEn'] == null ? null : json['cityNameEn'] as String,
        cityNameFr: json['cityNameFr'] == null ? null : json['cityNameFr'] as String,
        cityNameAr: json['cityNameAr'] == null ? null : json['cityNameAr'] as String,
        countryNameEn: json['countryNameEn'] == null ? null : json['countryNameEn'] as String,
        countryNameFr: json['countryNameFr'] == null ? null : json['countryNameFr'] as String,
        countryNameAr: json['countryNameAr'] == null ? null : json['countryNameAr'] as String,
        isActive: json['isActive'] == null ? null : json['isActive'] as bool,
        countryId: json['countryId'] == null ? null : json['countryId'] as int,
        isDeleted: json['isDeleted'] == null ? null : json['isDeleted'] as String,
        dateAdded: json['dateAdded'] == null ? null : json['dateAdded'] as String,
        dateModified: json['dateModified'] == null ? null : json['dateModified'] as String);
  }

  static List<Cities> fromJsonList(dynamic json) {
    List<Cities> citiesList = [];
    for (Map<String, dynamic> element in json) {
      citiesList.add(Cities.fromJson(element));
    }
    return citiesList;
  }

  @override
  String toString() {
    return '''Cities(
                cityId:$cityId,
provinceId:$provinceId,
provinceNameEn:$provinceNameEn,
provinceNameFr:$provinceNameFr,
provinceNameAr:$provinceNameAr,
cityNameEn:$cityNameEn,
cityNameFr:$cityNameFr,
cityNameAr:$cityNameAr,
countryNameEn:$countryNameEn,
countryNameFr:$countryNameFr,
countryNameAr:$countryNameAr,
isActive:$isActive,
countryId:$countryId,
isDeleted:$isDeleted,
dateAdded:$dateAdded,
dateModified:$dateModified
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is Cities &&
        other.runtimeType == runtimeType &&
        other.cityId == cityId &&
        other.provinceId == provinceId &&
        other.provinceNameEn == provinceNameEn &&
        other.provinceNameFr == provinceNameFr &&
        other.provinceNameAr == provinceNameAr &&
        other.cityNameEn == cityNameEn &&
        other.cityNameFr == cityNameFr &&
        other.cityNameAr == cityNameAr &&
        other.countryNameEn == countryNameEn &&
        other.countryNameFr == countryNameFr &&
        other.countryNameAr == countryNameAr &&
        other.isActive == isActive &&
        other.countryId == countryId &&
        other.isDeleted == isDeleted &&
        other.dateAdded == dateAdded &&
        other.dateModified == dateModified;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, cityId, provinceId, provinceNameEn, provinceNameFr, provinceNameAr, cityNameEn, cityNameFr, cityNameAr, countryNameEn, countryNameFr, countryNameAr, isActive,
        countryId, isDeleted, dateAdded, dateModified);
  }
}

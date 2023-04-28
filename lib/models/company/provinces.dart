class Provinces {
  final int? provinceId;
  final String? provinceNameEn;
  final String? provinceNameAr;
  final String? provinceNameFr;
  final int? countryId;
  final dynamic countryNameEn;
  final dynamic countryNameAr;
  final dynamic countryNameFr;
  final dynamic isActive;
  final dynamic dateAdded;
  final dynamic dateModified;
  final dynamic createdBy;
  final dynamic modifiedBy;
  final dynamic population;
  const Provinces(
      {this.provinceId,
      this.provinceNameEn,
      this.provinceNameAr,
      this.provinceNameFr,
      this.countryId,
      this.countryNameEn,
      this.countryNameAr,
      this.countryNameFr,
      this.isActive,
      this.dateAdded,
      this.dateModified,
      this.createdBy,
      this.modifiedBy,
      this.population});
  Provinces copyWith(
      {int? provinceId,
      String? provinceNameEn,
      String? provinceNameAr,
      String? provinceNameFr,
      int? countryId,
      dynamic? countryNameEn,
      dynamic? countryNameAr,
      dynamic? countryNameFr,
      dynamic? isActive,
      dynamic? dateAdded,
      dynamic? dateModified,
      dynamic? createdBy,
      dynamic? modifiedBy,
      dynamic? population}) {
    return Provinces(
        provinceId: provinceId ?? this.provinceId,
        provinceNameEn: provinceNameEn ?? this.provinceNameEn,
        provinceNameAr: provinceNameAr ?? this.provinceNameAr,
        provinceNameFr: provinceNameFr ?? this.provinceNameFr,
        countryId: countryId ?? this.countryId,
        countryNameEn: countryNameEn ?? this.countryNameEn,
        countryNameAr: countryNameAr ?? this.countryNameAr,
        countryNameFr: countryNameFr ?? this.countryNameFr,
        isActive: isActive ?? this.isActive,
        dateAdded: dateAdded ?? this.dateAdded,
        dateModified: dateModified ?? this.dateModified,
        createdBy: createdBy ?? this.createdBy,
        modifiedBy: modifiedBy ?? this.modifiedBy,
        population: population ?? this.population);
  }

  Map<String, Object?> toJson() {
    return {
      'provinceId': provinceId,
      'provinceNameEn': provinceNameEn,
      'provinceNameAr': provinceNameAr,
      'provinceNameFr': provinceNameFr,
      'countryId': countryId,
      'countryNameEn': countryNameEn,
      'countryNameAr': countryNameAr,
      'countryNameFr': countryNameFr,
      'isActive': isActive,
      'dateAdded': dateAdded,
      'dateModified': dateModified,
      'createdBy': createdBy,
      'modifiedBy': modifiedBy,
      'population': population
    };
  }

  static Provinces fromJson(Map<String, Object?> json) {
    return Provinces(
        provinceId: json['provinceId'] == null ? null : json['provinceId'] as int,
        provinceNameEn: json['provinceNameEn'] == null ? null : json['provinceNameEn'] as String,
        provinceNameAr: json['provinceNameAr'] == null ? null : json['provinceNameAr'] as String,
        provinceNameFr: json['provinceNameFr'] == null ? null : json['provinceNameFr'] as String,
        countryId: json['countryId'] == null ? null : json['countryId'] as int,
        countryNameEn: json['countryNameEn'] as dynamic,
        countryNameAr: json['countryNameAr'] as dynamic,
        countryNameFr: json['countryNameFr'] as dynamic,
        isActive: json['isActive'] as dynamic,
        dateAdded: json['dateAdded'] as dynamic,
        dateModified: json['dateModified'] as dynamic,
        createdBy: json['createdBy'] as dynamic,
        modifiedBy: json['modifiedBy'] as dynamic,
        population: json['population'] as dynamic);
  }

  static List<Provinces> fromJsonList(dynamic json) {
    List<Provinces> provincesList = [];
    for (Map<String, dynamic> element in json) {
      provincesList.add(Provinces.fromJson(element));
    }
    return provincesList;
  }

  @override
  String toString() {
    return '''Provinces(
                provinceId:$provinceId,
provinceNameEn:$provinceNameEn,
provinceNameAr:$provinceNameAr,
provinceNameFr:$provinceNameFr,
countryId:$countryId,
countryNameEn:$countryNameEn,
countryNameAr:$countryNameAr,
countryNameFr:$countryNameFr,
isActive:$isActive,
dateAdded:$dateAdded,
dateModified:$dateModified,
createdBy:$createdBy,
modifiedBy:$modifiedBy,
population:$population
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is Provinces &&
        other.runtimeType == runtimeType &&
        other.provinceId == provinceId &&
        other.provinceNameEn == provinceNameEn &&
        other.provinceNameAr == provinceNameAr &&
        other.provinceNameFr == provinceNameFr &&
        other.countryId == countryId &&
        other.countryNameEn == countryNameEn &&
        other.countryNameAr == countryNameAr &&
        other.countryNameFr == countryNameFr &&
        other.isActive == isActive &&
        other.dateAdded == dateAdded &&
        other.dateModified == dateModified &&
        other.createdBy == createdBy &&
        other.modifiedBy == modifiedBy &&
        other.population == population;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, provinceId, provinceNameEn, provinceNameAr, provinceNameFr, countryId, countryNameEn, countryNameAr, countryNameFr, isActive, dateAdded, dateModified, createdBy,
        modifiedBy, population);
  }
}

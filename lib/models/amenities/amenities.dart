class Amenities {
  final int? id;
  final String? amenityNameEn;
  final String? amenityNameAr;
  final String? amenityNameFr;
  final int? userId;
  final bool? isActive;
  final String? stateDate;
  const Amenities({
    this.id,
    this.amenityNameEn,
    this.amenityNameAr,
    this.amenityNameFr,
    this.userId,
    this.isActive,
    this.stateDate,
  });
  Amenities copyWith({
    int? id,
    String? amenityNameEn,
    String? amenityNameAr,
    String? amenityNameFr,
    int? userId,
    bool? isActive,
    String? stateDate,
  }) {
    return Amenities(
      id: id ?? this.id,
      amenityNameEn: amenityNameEn ?? this.amenityNameEn,
      amenityNameAr: amenityNameAr ?? this.amenityNameAr,
      amenityNameFr: amenityNameFr ?? this.amenityNameFr,
      userId: userId ?? this.userId,
      isActive: isActive ?? this.isActive,
      stateDate: stateDate ?? this.stateDate,
    );
  }

  Map<String, Object?> toJson() {
    return {'id': id, 'amenityNameEn': amenityNameEn, 'amenityNameAr': amenityNameAr, 'amenityNameFr': amenityNameFr, 'userId': userId, 'isActive': isActive, 'stateDate': stateDate};
  }

  static Amenities fromJson(Map<String, Object?> json) {
    return Amenities(
      id: json['id'] == null ? null : json['id'] as int,
      amenityNameEn: json['amenityNameEn'] == null ? null : json['amenityNameEn'] as String,
      amenityNameAr: json['amenityNameAr'] == null ? null : json['amenityNameAr'] as String,
      amenityNameFr: json['amenityNameFr'] == null ? null : json['amenityNameFr'] as String,
      userId: json['userId'] == null ? null : json['userId'] as int,
      isActive: json['isActive'] == null ? null : json['isActive'] as bool,
      stateDate: json['stateDate'] == null ? null : json['stateDate'] as String,
    );
  }

  static List<Amenities> fromJsonList(dynamic json) {
    List<Amenities> amenitiesList = [];
    for (Map<String, dynamic> element in json) {
      amenitiesList.add(Amenities.fromJson(element));
    }
    return amenitiesList;
  }

  @override
  String toString() {
    return '''Amenities(
                id:$id,
                amenityNameEn:$amenityNameEn,
                amenityNameAr:$amenityNameAr,
                amenityNameFr:$amenityNameFr,
                userId:$userId,
                isActive:$isActive,
                stateDate:$stateDate
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is Amenities &&
        other.runtimeType == runtimeType &&
        other.id == id &&
        other.amenityNameEn == amenityNameEn &&
        other.amenityNameAr == amenityNameAr &&
        other.amenityNameFr == amenityNameFr &&
        other.userId == userId &&
        other.isActive == isActive &&
        other.stateDate == stateDate;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, id, amenityNameEn, amenityNameAr, amenityNameFr, userId, isActive, stateDate);
  }
}

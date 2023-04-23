class Gender {
  final int? genderId;
  final String? genderAr;
  final String? genderFr;
  final String? genderEn;
  final bool? isActive;
  final String? stateDate;
  final int? userId;
  final List<dynamic>? companyGenders;
  final List<dynamic>? quickRegisters;

  const Gender({
    this.genderId,
    this.genderAr,
    this.genderFr,
    this.genderEn,
    this.isActive,
    this.stateDate,
    this.userId,
    this.companyGenders,
    this.quickRegisters,
  });
  Gender copyWith({
    int? genderId,
    String? genderAr,
    String? genderFr,
    String? genderEn,
    bool? isActive,
    String? stateDate,
    int? userId,
    List<dynamic>? companyGenders,
    List<dynamic>? quickRegisters,
  }) {
    return Gender(
      genderId: genderId ?? this.genderId,
      genderAr: genderAr ?? this.genderAr,
      genderFr: genderFr ?? this.genderFr,
      genderEn: genderEn ?? this.genderEn,
      isActive: isActive ?? this.isActive,
      stateDate: stateDate ?? this.stateDate,
      userId: userId ?? this.userId,
      companyGenders: companyGenders ?? this.companyGenders,
      quickRegisters: quickRegisters ?? this.quickRegisters,
    );
  }

  Map<String, Object?> toJson() {
    return {
      'genderId': genderId,
      'genderAr': genderAr,
      'genderFr': genderFr,
      'genderEn': genderEn,
      'isActive': isActive,
      'stateDate': stateDate,
      'userId': userId,
      'companyGenders': companyGenders,
      'quickRegisters': quickRegisters
    };
  }

  static Gender fromJson(Map<String, Object?> json) {
    return Gender(
        genderId: json['genderId'] == null ? null : json['genderId'] as int,
        genderAr: json['genderAr'] == null ? null : json['genderAr'] as String,
        genderFr: json['genderFr'] == null ? null : json['genderFr'] as String,
        genderEn: json['genderEn'] == null ? null : json['genderEn'] as String,
        isActive: json['isActive'] == null ? null : json['isActive'] as bool,
        stateDate: json['stateDate'] == null ? null : json['stateDate'] as String,
        userId: json['userId'] == null ? null : json['userId'] as int,
        companyGenders: json['companyGenders'] == null ? null : json['companyGenders'] as List<dynamic>,
        quickRegisters: json['quickRegisters'] == null ? null : json['quickRegisters'] as List<dynamic>);
  }

  static List<Gender> fromJsonList(dynamic json) {
    List<Gender> genderList = [];
    for (Map<String, dynamic> element in json) {
      genderList.add(Gender.fromJson(element));
    }
    return genderList;
  }

  @override
  String toString() {
    return '''Gender(
                genderId:$genderId,
                genderAr:$genderAr,
                genderFr:$genderFr,
                genderEn:$genderEn,
                isActive:$isActive,
                stateDate:$stateDate,
                userId:$userId,
                companyGenders:$companyGenders,
                quickRegisters:$quickRegisters
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is Gender &&
        other.runtimeType == runtimeType &&
        other.genderId == genderId &&
        other.genderAr == genderAr &&
        other.genderFr == genderFr &&
        other.genderEn == genderEn &&
        other.isActive == isActive &&
        other.stateDate == stateDate &&
        other.userId == userId &&
        other.companyGenders == companyGenders &&
        other.quickRegisters == quickRegisters;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, genderId, genderAr, genderFr, genderEn, isActive, stateDate, userId, companyGenders, quickRegisters);
  }
}

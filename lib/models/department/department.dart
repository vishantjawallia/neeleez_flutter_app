class Department {
  final int? depId;
  final String? name;
  final String? nameAr;
  final int? companyId;
  final bool? isActive;
  final String? stateDate;
  final int? userId;
  final int? companyUserId;
  const Department({this.depId, this.name, this.nameAr, this.companyId, this.isActive, this.stateDate, this.userId, this.companyUserId});
  Department copyWith({int? depId, String? name, String? nameAr, int? companyId, bool? isActive, String? stateDate, int? userId, int? companyUserId}) {
    return Department(
        depId: depId ?? this.depId,
        name: name ?? this.name,
        nameAr: nameAr ?? this.nameAr,
        companyId: companyId ?? this.companyId,
        isActive: isActive ?? this.isActive,
        stateDate: stateDate ?? this.stateDate,
        userId: userId ?? this.userId,
        companyUserId: companyUserId ?? this.companyUserId);
  }

  Map<String, Object?> toJson() {
    return {'depId': depId, 'name': name, 'nameAr': nameAr, 'companyId': companyId, 'isActive': isActive, 'stateDate': stateDate, 'userId': userId, 'companyUserId': companyUserId};
  }

  static Department fromJson(Map<String, Object?> json) {
    return Department(
        depId: json['depId'] == null ? null : json['depId'] as int,
        name: json['name'] == null ? null : json['name'] as String,
        nameAr: json['nameAr'] == null ? null : json['nameAr'] as String,
        companyId: json['companyId'] == null ? null : json['companyId'] as int,
        isActive: json['isActive'] == null ? null : json['isActive'] as bool,
        stateDate: json['stateDate'] == null ? null : json['stateDate'] as String,
        userId: json['userId'] == null ? null : json['userId'] as int,
        companyUserId: json['companyUserId'] == null ? null : json['companyUserId'] as int);
  }

  static List<Department> fromJsonList(dynamic json) {
    List<Department> value = [];
    for (Map<String, dynamic> element in json) {
      value.add(Department.fromJson(element));
    }
    return value;
  }

  @override
  String toString() {
    return '''Department(
                depId:$depId,
name:$name,
nameAr:$nameAr,
companyId:$companyId,
isActive:$isActive,
stateDate:$stateDate,
userId:$userId,
companyUserId:$companyUserId
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is Department &&
        other.runtimeType == runtimeType &&
        other.depId == depId &&
        other.name == name &&
        other.nameAr == nameAr &&
        other.companyId == companyId &&
        other.isActive == isActive &&
        other.stateDate == stateDate &&
        other.userId == userId &&
        other.companyUserId == companyUserId;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, depId, name, nameAr, companyId, isActive, stateDate, userId, companyUserId);
  }
}

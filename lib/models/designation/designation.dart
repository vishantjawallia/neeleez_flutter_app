class Designation {
  final int? id;
  final int? companyId;
  final String? designationEn;
  final String? designationAr;
  final String? remarks;
  final String? stateDate;
  final bool? isActive;
  final int? userId;
  final int? companyUsetId;
  const Designation({this.id, this.companyId, this.designationEn, this.designationAr, this.remarks, this.stateDate, this.isActive, this.userId, this.companyUsetId});
  Designation copyWith({int? id, int? companyId, String? designationEn, String? designationAr, String? remarks, String? stateDate, bool? isActive, int? userId, int? companyUsetId}) {
    return Designation(
        id: id ?? this.id,
        companyId: companyId ?? this.companyId,
        designationEn: designationEn ?? this.designationEn,
        designationAr: designationAr ?? this.designationAr,
        remarks: remarks ?? this.remarks,
        stateDate: stateDate ?? this.stateDate,
        isActive: isActive ?? this.isActive,
        userId: userId ?? this.userId,
        companyUsetId: companyUsetId ?? this.companyUsetId);
  }

  Map<String, Object?> toJson() {
    return {
      'id': id,
      'companyId': companyId,
      'designationEn': designationEn,
      'designationAr': designationAr,
      'remarks': remarks,
      'stateDate': stateDate,
      'isActive': isActive,
      'userId': userId,
      'companyUsetId': companyUsetId
    };
  }

  static Designation fromJson(Map<String, Object?> json) {
    return Designation(
        id: json['id'] == null ? null : json['id'] as int,
        companyId: json['companyId'] == null ? null : json['companyId'] as int,
        designationEn: json['designationEn'] == null ? null : json['designationEn'] as String,
        designationAr: json['designationAr'] == null ? null : json['designationAr'] as String,
        remarks: json['remarks'] == null ? null : json['remarks'] as String,
        stateDate: json['stateDate'] == null ? null : json['stateDate'] as String,
        isActive: json['isActive'] == null ? null : json['isActive'] as bool,
        userId: json['userId'] == null ? null : json['userId'] as int,
        companyUsetId: json['companyUsetId'] == null ? null : json['companyUsetId'] as int);
  }

  static List<Designation> fromJsonList(dynamic json) {
    List<Designation> value = [];
    for (Map<String, dynamic> element in json) {
      value.add(Designation.fromJson(element));
    }
    return value;
  }

  @override
  String toString() {
    return '''Designation(
                id:$id,
companyId:$companyId,
designationEn:$designationEn,
designationAr:$designationAr,
remarks:$remarks,
stateDate:$stateDate,
isActive:$isActive,
userId:$userId,
companyUsetId:$companyUsetId
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is Designation &&
        other.runtimeType == runtimeType &&
        other.id == id &&
        other.companyId == companyId &&
        other.designationEn == designationEn &&
        other.designationAr == designationAr &&
        other.remarks == remarks &&
        other.stateDate == stateDate &&
        other.isActive == isActive &&
        other.userId == userId &&
        other.companyUsetId == companyUsetId;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, id, companyId, designationEn, designationAr, remarks, stateDate, isActive, userId, companyUsetId);
  }
}

class Designation {
  final int? id;
  final int? companyId;
  final String? designation1;
  final String? designationAr;
  final String? remarks;
  final String? stateDate;
  final bool? isActive;
  final int? userId;
  final List<dynamic>? serviceProviderAllocations;
  const Designation({this.id, this.companyId, this.designation1, this.designationAr, this.remarks, this.stateDate, this.isActive, this.userId, this.serviceProviderAllocations});
  Designation copyWith(
      {int? id, int? companyId, String? designation1, String? designationAr, String? remarks, String? stateDate, bool? isActive, int? userId, List<dynamic>? serviceProviderAllocations}) {
    return Designation(
        id: id ?? this.id,
        companyId: companyId ?? this.companyId,
        designation1: designation1 ?? this.designation1,
        designationAr: designationAr ?? this.designationAr,
        remarks: remarks ?? this.remarks,
        stateDate: stateDate ?? this.stateDate,
        isActive: isActive ?? this.isActive,
        userId: userId ?? this.userId,
        serviceProviderAllocations: serviceProviderAllocations ?? this.serviceProviderAllocations);
  }

  Map<String, Object?> toJson() {
    return {
      'id': id,
      'companyId': companyId,
      'designation1': designation1,
      'designationAr': designationAr,
      'remarks': remarks,
      'stateDate': stateDate,
      'isActive': isActive,
      'userId': userId,
      'serviceProviderAllocations': serviceProviderAllocations
    };
  }

  static Designation fromJson(Map<String, Object?> json) {
    return Designation(
        id: json['id'] == null ? null : json['id'] as int,
        companyId: json['companyId'] == null ? null : json['companyId'] as int,
        designation1: json['designation1'] == null ? null : json['designation1'] as String,
        designationAr: json['designationAr'] == null ? null : json['designationAr'] as String,
        remarks: json['remarks'] == null ? null : json['remarks'] as String,
        stateDate: json['stateDate'] == null ? null : json['stateDate'] as String,
        isActive: json['isActive'] == null ? null : json['isActive'] as bool,
        userId: json['userId'] == null ? null : json['userId'] as int,
        serviceProviderAllocations: json['serviceProviderAllocations'] == null ? null : json['serviceProviderAllocations'] as List<dynamic>);
  }

  static List<Designation> fromJsonList(dynamic json) {
    List<Designation> designationList = [];
    for (Map<String, dynamic> element in json) {
      designationList.add(Designation.fromJson(element));
    }
    return designationList;
  }

  @override
  String toString() {
    return '''Designation(
                id:$id,
companyId:$companyId,
designation1:$designation1,
designationAr:$designationAr,
remarks:$remarks,
stateDate:$stateDate,
isActive:$isActive,
userId:$userId,
serviceProviderAllocations:$serviceProviderAllocations
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is Designation &&
        other.runtimeType == runtimeType &&
        other.id == id &&
        other.companyId == companyId &&
        other.designation1 == designation1 &&
        other.designationAr == designationAr &&
        other.remarks == remarks &&
        other.stateDate == stateDate &&
        other.isActive == isActive &&
        other.userId == userId &&
        other.serviceProviderAllocations == serviceProviderAllocations;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, id, companyId, designation1, designationAr, remarks, stateDate, isActive, userId, serviceProviderAllocations);
  }
}

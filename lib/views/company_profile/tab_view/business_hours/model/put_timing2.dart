class PutTimg2 {
  final int? id;
  final int? companyId;
  final int? dowId;
  final String? dowShort;
  final String? dow;
  final bool? isHoliday;
  final bool? isOpen24Hours;
  final List<CompanyTimes>? companyTimes;
  const PutTimg2({this.id, this.companyId, this.dowId, this.dowShort, this.dow, this.isHoliday, this.isOpen24Hours, this.companyTimes});
  PutTimg2 copyWith({int? id, int? companyId, int? dowId, String? dowShort, String? dow, bool? isHoliday, bool? isOpen24Hours, List<CompanyTimes>? companyTimes}) {
    return PutTimg2(
      id: id ?? this.id,
      companyId: companyId ?? this.companyId,
      dowId: dowId ?? this.dowId,
      dowShort: dowShort ?? this.dowShort,
      dow: dow ?? this.dow,
      isHoliday: isHoliday ?? this.isHoliday,
      isOpen24Hours: isOpen24Hours ?? this.isOpen24Hours,
      companyTimes: companyTimes ?? this.companyTimes,
    );
  }

  Map<String, Object?> toJson() {
    return {
      'id': id,
      'companyId': companyId,
      'dowId': dowId,
      'dowShort': dowShort,
      'dow': dow,
      'isHoliday': isHoliday,
      'isOpen24Hours': isOpen24Hours,
      'companyTimes': companyTimes?.map<Map<String, dynamic>>((data) => data.toJson()).toList()
    };
  }

  static PutTimg2 fromJson(Map<String, Object?> json) {
    return PutTimg2(
        id: json['id'] == null ? null : json['id'] as int,
        companyId: json['companyId'] == null ? null : json['companyId'] as int,
        dowId: json['dowId'] == null ? null : json['dowId'] as int,
        dowShort: json['dowShort'] == null ? null : json['dowShort'] as String,
        dow: json['dow'] == null ? null : json['dow'] as String,
        isHoliday: json['isHoliday'] == null ? null : json['isHoliday'] as bool,
        isOpen24Hours: json['isOpen24Hours'] == null ? null : json['isOpen24Hours'] as bool,
        companyTimes: json['companyTimes'] == null ? null : (json['companyTimes'] as List).map<CompanyTimes>((data) => CompanyTimes.fromJson(data as Map<String, Object?>)).toList());
  }

  @override
  String toString() {
    return '''PutTimg2(
                id:$id,
companyId:$companyId,
dowId:$dowId,
dowShort:$dowShort,
dow:$dow,
isHoliday:$isHoliday,
isOpen24Hours:$isOpen24Hours,
companyTimes:${companyTimes.toString()}
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is PutTimg2 &&
        other.runtimeType == runtimeType &&
        other.id == id &&
        other.companyId == companyId &&
        other.dowId == dowId &&
        other.dowShort == dowShort &&
        other.dow == dow &&
        other.isHoliday == isHoliday &&
        other.isOpen24Hours == isOpen24Hours &&
        other.companyTimes == companyTimes;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, id, companyId, dowId, dowShort, dow, isHoliday, isOpen24Hours, companyTimes);
  }
}

class CompanyTimes {
  final int? id;
  final int? companyTimingId;
  final int? companyId;
  final int? startHour;
  final int? startMinute;
  final int? endHour;
  final int? endMinute;
  const CompanyTimes({this.id, this.companyTimingId, this.companyId, this.startHour, this.startMinute, this.endHour, this.endMinute});
  CompanyTimes copyWith({int? id, int? companyTimingId, int? companyId, int? startHour, int? startMinute, int? endHour, int? endMinute}) {
    return CompanyTimes(
        id: id ?? this.id,
        companyTimingId: companyTimingId ?? this.companyTimingId,
        companyId: companyId ?? this.companyId,
        startHour: startHour ?? this.startHour,
        startMinute: startMinute ?? this.startMinute,
        endHour: endHour ?? this.endHour,
        endMinute: endMinute ?? this.endMinute);
  }

  Map<String, Object?> toJson() {
    return {'id': id, 'companyTimingId': companyTimingId, 'companyId': companyId, 'startHour': startHour, 'startMinute': startMinute, 'endHour': endHour, 'endMinute': endMinute};
  }

  static CompanyTimes fromJson(Map<String, Object?> json) {
    return CompanyTimes(
        id: json['id'] == null ? null : json['id'] as int,
        companyTimingId: json['companyTimingId'] == null ? null : json['companyTimingId'] as int,
        companyId: json['companyId'] == null ? null : json['companyId'] as int,
        startHour: json['startHour'] == null ? null : json['startHour'] as int,
        startMinute: json['startMinute'] == null ? null : json['startMinute'] as int,
        endHour: json['endHour'] == null ? null : json['endHour'] as int,
        endMinute: json['endMinute'] == null ? null : json['endMinute'] as int);
  }

  @override
  String toString() {
    return '''CompanyTimes(
                id:$id,
companyTimingId:$companyTimingId,
companyId:$companyId,
startHour:$startHour,
startMinute:$startMinute,
endHour:$endHour,
endMinute:$endMinute
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is CompanyTimes &&
        other.runtimeType == runtimeType &&
        other.id == id &&
        other.companyTimingId == companyTimingId &&
        other.companyId == companyId &&
        other.startHour == startHour &&
        other.startMinute == startMinute &&
        other.endHour == endHour &&
        other.endMinute == endMinute;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, id, companyTimingId, companyId, startHour, startMinute, endHour, endMinute);
  }
}

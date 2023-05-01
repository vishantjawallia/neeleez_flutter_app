class CompanyTimings {
  final int? id;
  final String? dow;
  final String? dowShort;
  final String? defaultStartTime;
  final String? defaultEndTime;
  final bool? defaultIsHoliday;
  final bool? defaultIsOpen24Hours;
  final List<CompanyDayDetailViewModels>? companyDayDetailViewModels;
  const CompanyTimings({this.id, this.dow, this.dowShort, this.defaultStartTime, this.defaultEndTime, this.defaultIsHoliday, this.defaultIsOpen24Hours, this.companyDayDetailViewModels});
  CompanyTimings copyWith(
      {int? id,
      String? dow,
      String? dowShort,
      String? defaultStartTime,
      String? defaultEndTime,
      bool? defaultIsHoliday,
      bool? defaultIsOpen24Hours,
      List<CompanyDayDetailViewModels>? companyDayDetailViewModels}) {
    return CompanyTimings(
        id: id ?? this.id,
        dow: dow ?? this.dow,
        dowShort: dowShort ?? this.dowShort,
        defaultStartTime: defaultStartTime ?? this.defaultStartTime,
        defaultEndTime: defaultEndTime ?? this.defaultEndTime,
        defaultIsHoliday: defaultIsHoliday ?? this.defaultIsHoliday,
        defaultIsOpen24Hours: defaultIsOpen24Hours ?? this.defaultIsOpen24Hours,
        companyDayDetailViewModels: companyDayDetailViewModels ?? this.companyDayDetailViewModels);
  }

  Map<String, Object?> toJson() {
    return {
      'id': id,
      'dow': dow,
      'dowShort': dowShort,
      'defaultStartTime': defaultStartTime,
      'defaultEndTime': defaultEndTime,
      'defaultIsHoliday': defaultIsHoliday,
      'defaultIsOpen24Hours': defaultIsOpen24Hours,
      'companyDayDetailViewModels': companyDayDetailViewModels?.map<Map<String, dynamic>>((data) => data.toJson()).toList()
    };
  }

  static CompanyTimings fromJson(Map<String, Object?> json) {
    return CompanyTimings(
        id: json['id'] == null ? null : json['id'] as int,
        dow: json['dow'] == null ? null : json['dow'] as String,
        dowShort: json['dowShort'] == null ? null : json['dowShort'] as String,
        defaultStartTime: json['defaultStartTime'] == null ? null : json['defaultStartTime'] as String,
        defaultEndTime: json['defaultEndTime'] == null ? null : json['defaultEndTime'] as String,
        defaultIsHoliday: json['defaultIsHoliday'] == null ? null : json['defaultIsHoliday'] as bool,
        defaultIsOpen24Hours: json['defaultIsOpen24Hours'] == null ? null : json['defaultIsOpen24Hours'] as bool,
        companyDayDetailViewModels: json['companyDayDetailViewModels'] == null
            ? null
            : (json['companyDayDetailViewModels'] as List).map<CompanyDayDetailViewModels>((data) => CompanyDayDetailViewModels.fromJson(data as Map<String, Object?>)).toList());
  }

  static List<CompanyTimings> fromJsonList(dynamic json) {
    List<CompanyTimings> value = [];
    for (Map<String, dynamic> element in json) {
      value.add(CompanyTimings.fromJson(element));
    }
    return value;
  }

  @override
  String toString() {
    return '''CompanyTimings(
                id:$id,
dow:$dow,
dowShort:$dowShort,
defaultStartTime:$defaultStartTime,
defaultEndTime:$defaultEndTime,
defaultIsHoliday:$defaultIsHoliday,
defaultIsOpen24Hours:$defaultIsOpen24Hours,
companyDayDetailViewModels:${companyDayDetailViewModels.toString()}
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is CompanyTimings &&
        other.runtimeType == runtimeType &&
        other.id == id &&
        other.dow == dow &&
        other.dowShort == dowShort &&
        other.defaultStartTime == defaultStartTime &&
        other.defaultEndTime == defaultEndTime &&
        other.defaultIsHoliday == defaultIsHoliday &&
        other.defaultIsOpen24Hours == defaultIsOpen24Hours &&
        other.companyDayDetailViewModels == companyDayDetailViewModels;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, id, dow, dowShort, defaultStartTime, defaultEndTime, defaultIsHoliday, defaultIsOpen24Hours, companyDayDetailViewModels);
  }
}

class CompanyDayDetailViewModels {
  final int? id;
  final int? companyId;
  final int? dowId;
  final String? dowShort;
  final String? dow;
  final bool? isHoliday;
  final bool? isOpen24Hours;
  final List<CompanyTimes>? companyTimes;
  const CompanyDayDetailViewModels({this.id, this.companyId, this.dowId, this.dowShort, this.dow, this.isHoliday, this.isOpen24Hours, this.companyTimes});
  CompanyDayDetailViewModels copyWith({int? id, int? companyId, int? dowId, String? dowShort, String? dow, bool? isHoliday, bool? isOpen24Hours, List<CompanyTimes>? companyTimes}) {
    return CompanyDayDetailViewModels(
        id: id ?? this.id,
        companyId: companyId ?? this.companyId,
        dowId: dowId ?? this.dowId,
        dowShort: dowShort ?? this.dowShort,
        dow: dow ?? this.dow,
        isHoliday: isHoliday ?? this.isHoliday,
        isOpen24Hours: isOpen24Hours ?? this.isOpen24Hours,
        companyTimes: companyTimes ?? this.companyTimes);
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

  static CompanyDayDetailViewModels fromJson(Map<String, Object?> json) {
    return CompanyDayDetailViewModels(
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
    return '''CompanyDayDetailViewModels(
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
    return other is CompanyDayDetailViewModels &&
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

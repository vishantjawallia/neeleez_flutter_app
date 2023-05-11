class PutTiming {
  final int? id;
  final int? dowId;
  final String? startTime;
  final String? endTime;
  final bool? isHoliday;
  const PutTiming({this.id, this.dowId, this.startTime, this.endTime, this.isHoliday});
  PutTiming copyWith({int? id, int? dowId, String? startTime, String? endTime, bool? isHoliday}) {
    return PutTiming(id: id ?? this.id, dowId: dowId ?? this.dowId, startTime: startTime ?? this.startTime, endTime: endTime ?? this.endTime, isHoliday: isHoliday ?? this.isHoliday);
  }

  Map<String, Object?> toJson() {
    return {'id': id, 'dowId': dowId, 'startTime': startTime, 'endTime': endTime, 'isHoliday': isHoliday};
  }

  static PutTiming fromJson(Map<String, Object?> json) {
    return PutTiming(
        id: json['id'] == null ? null : json['id'] as int,
        dowId: json['dowId'] == null ? null : json['dowId'] as int,
        startTime: json['startTime'] == null ? null : json['startTime'] as String,
        endTime: json['endTime'] == null ? null : json['endTime'] as String,
        isHoliday: json['isHoliday'] == null ? null : json['isHoliday'] as bool);
  }

  @override
  String toString() {
    return '''PutTiming(
                id:$id,
dowId:$dowId,
startTime:$startTime,
endTime:$endTime,
isHoliday:$isHoliday
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is PutTiming && other.runtimeType == runtimeType && other.id == id && other.dowId == dowId && other.startTime == startTime && other.endTime == endTime && other.isHoliday == isHoliday;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, id, dowId, startTime, endTime, isHoliday);
  }
}

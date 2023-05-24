class IpListModel {
  final String? ip;
  final String? registry;
  final String? countrycode;
  final String? countryname;
  final Asn? asn;
  final bool? spam;
  final bool? tor;
  const IpListModel({this.ip, this.registry, this.countrycode, this.countryname, this.asn, this.spam, this.tor});
  IpListModel copyWith({String? ip, String? registry, String? countrycode, String? countryname, Asn? asn, bool? spam, bool? tor}) {
    return IpListModel(
        ip: ip ?? this.ip,
        registry: registry ?? this.registry,
        countrycode: countrycode ?? this.countrycode,
        countryname: countryname ?? this.countryname,
        asn: asn ?? this.asn,
        spam: spam ?? this.spam,
        tor: tor ?? this.tor);
  }

  Map<String, Object?> toJson() {
    return {'ip': ip, 'registry': registry, 'countrycode': countrycode, 'countryname': countryname, 'asn': asn?.toJson(), 'spam': spam, 'tor': tor};
  }

  static IpListModel fromJson(Map<String, Object?> json) {
    return IpListModel(
        ip: json['ip'] == null ? null : json['ip'] as String,
        registry: json['registry'] == null ? null : json['registry'] as String,
        countrycode: json['countrycode'] == null ? null : json['countrycode'] as String,
        countryname: json['countryname'] == null ? null : json['countryname'] as String,
        asn: json['asn'] == null ? null : Asn.fromJson(json['asn'] as Map<String, Object?>),
        spam: json['spam'] == null ? null : json['spam'] as bool,
        tor: json['tor'] == null ? null : json['tor'] as bool);
  }

  @override
  String toString() {
    return '''IpListModel(
                ip:$ip,
registry:$registry,
countrycode:$countrycode,
countryname:$countryname,
asn:${asn.toString()},
spam:$spam,
tor:$tor
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is IpListModel &&
        other.runtimeType == runtimeType &&
        other.ip == ip &&
        other.registry == registry &&
        other.countrycode == countrycode &&
        other.countryname == countryname &&
        other.asn == asn &&
        other.spam == spam &&
        other.tor == tor;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, ip, registry, countrycode, countryname, asn, spam, tor);
  }
}

class Asn {
  final String? code;
  final String? name;
  final String? route;
  final String? start;
  final String? end;
  final String? count;
  const Asn({this.code, this.name, this.route, this.start, this.end, this.count});
  Asn copyWith({String? code, String? name, String? route, String? start, String? end, String? count}) {
    return Asn(code: code ?? this.code, name: name ?? this.name, route: route ?? this.route, start: start ?? this.start, end: end ?? this.end, count: count ?? this.count);
  }

  Map<String, Object?> toJson() {
    return {'code': code, 'name': name, 'route': route, 'start': start, 'end': end, 'count': count};
  }

  static Asn fromJson(Map<String, Object?> json) {
    return Asn(
        code: json['code'] == null ? null : json['code'] as String,
        name: json['name'] == null ? null : json['name'] as String,
        route: json['route'] == null ? null : json['route'] as String,
        start: json['start'] == null ? null : json['start'] as String,
        end: json['end'] == null ? null : json['end'] as String,
        count: json['count'] == null ? null : json['count'] as String);
  }

  @override
  String toString() {
    return '''Asn(
                code:$code,
name:$name,
route:$route,
start:$start,
end:$end,
count:$count
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is Asn && other.runtimeType == runtimeType && other.code == code && other.name == name && other.route == route && other.start == start && other.end == end && other.count == count;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, code, name, route, start, end, count);
  }
}

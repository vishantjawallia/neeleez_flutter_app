class IpBase {
  final String? ip;
  final String? countryCode;
  final String? countryName;
  final String? regionCode;
  final String? regionName;
  final String? city;
  final String? zipCode;
  final String? timeZone;
  final double? latitude;
  final double? longitude;
  final int? metroCode;
  const IpBase({this.ip, this.countryCode, this.countryName, this.regionCode, this.regionName, this.city, this.zipCode, this.timeZone, this.latitude, this.longitude, this.metroCode});
  IpBase copyWith(
      {String? ip,
      String? countryCode,
      String? countryName,
      String? regionCode,
      String? regionName,
      String? city,
      String? zipCode,
      String? timeZone,
      double? latitude,
      double? longitude,
      int? metroCode}) {
    return IpBase(
        ip: ip ?? this.ip,
        countryCode: countryCode ?? this.countryCode,
        countryName: countryName ?? this.countryName,
        regionCode: regionCode ?? this.regionCode,
        regionName: regionName ?? this.regionName,
        city: city ?? this.city,
        zipCode: zipCode ?? this.zipCode,
        timeZone: timeZone ?? this.timeZone,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        metroCode: metroCode ?? this.metroCode);
  }

  Map<String, Object?> toJson() {
    return {
      'ip': ip,
      'country_code': countryCode,
      'country_name': countryName,
      'region_code': regionCode,
      'region_name': regionName,
      'city': city,
      'zip_code': zipCode,
      'time_zone': timeZone,
      'latitude': latitude,
      'longitude': longitude,
      'metro_code': metroCode
    };
  }

  static IpBase fromJson(Map<String, Object?> json) {
    return IpBase(
        ip: json['ip'] == null ? null : json['ip'] as String,
        countryCode: json['country_code'] == null ? null : json['country_code'] as String,
        countryName: json['country_name'] == null ? null : json['country_name'] as String,
        regionCode: json['region_code'] == null ? null : json['region_code'] as String,
        regionName: json['region_name'] == null ? null : json['region_name'] as String,
        city: json['city'] == null ? null : json['city'] as String,
        zipCode: json['zip_code'] == null ? null : json['zip_code'] as String,
        timeZone: json['time_zone'] == null ? null : json['time_zone'] as String,
        latitude: json['latitude'] == null ? null : json['latitude'] as double,
        longitude: json['longitude'] == null ? null : json['longitude'] as double,
        metroCode: json['metro_code'] == null ? null : json['metro_code'] as int);
  }

  @override
  String toString() {
    return '''IpBase(
                ip:$ip,
countryCode:$countryCode,
countryName:$countryName,
regionCode:$regionCode,
regionName:$regionName,
city:$city,
zipCode:$zipCode,
timeZone:$timeZone,
latitude:$latitude,
longitude:$longitude,
metroCode:$metroCode
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is IpBase &&
        other.runtimeType == runtimeType &&
        other.ip == ip &&
        other.countryCode == countryCode &&
        other.countryName == countryName &&
        other.regionCode == regionCode &&
        other.regionName == regionName &&
        other.city == city &&
        other.zipCode == zipCode &&
        other.timeZone == timeZone &&
        other.latitude == latitude &&
        other.longitude == longitude &&
        other.metroCode == metroCode;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, ip, countryCode, countryName, regionCode, regionName, city, zipCode, timeZone, latitude, longitude, metroCode);
  }
}

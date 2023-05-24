class IpApiModel {
  final String? status;
  final String? country;
  final String? countryCode;
  final String? region;
  final String? regionName;
  final String? city;
  final String? zip;
  final double? lat;
  final double? lon;
  final String? timezone;
  final String? isp;
  final String? org;
  final String? as;
  final String? query;
  const IpApiModel({this.status, this.country, this.countryCode, this.region, this.regionName, this.city, this.zip, this.lat, this.lon, this.timezone, this.isp, this.org, this.as, this.query});
  IpApiModel copyWith(
      {String? status,
      String? country,
      String? countryCode,
      String? region,
      String? regionName,
      String? city,
      String? zip,
      double? lat,
      double? lon,
      String? timezone,
      String? isp,
      String? org,
      String? as,
      String? query}) {
    return IpApiModel(
        status: status ?? this.status,
        country: country ?? this.country,
        countryCode: countryCode ?? this.countryCode,
        region: region ?? this.region,
        regionName: regionName ?? this.regionName,
        city: city ?? this.city,
        zip: zip ?? this.zip,
        lat: lat ?? this.lat,
        lon: lon ?? this.lon,
        timezone: timezone ?? this.timezone,
        isp: isp ?? this.isp,
        org: org ?? this.org,
        as: as ?? this.as,
        query: query ?? this.query);
  }

  Map<String, Object?> toJson() {
    return {
      'status': status,
      'country': country,
      'countryCode': countryCode,
      'region': region,
      'regionName': regionName,
      'city': city,
      'zip': zip,
      'lat': lat,
      'lon': lon,
      'timezone': timezone,
      'isp': isp,
      'org': org,
      'as': as,
      'query': query
    };
  }

  static IpApiModel fromJson(Map<String, Object?> json) {
    return IpApiModel(
        status: json['status'] == null ? null : json['status'] as String,
        country: json['country'] == null ? null : json['country'] as String,
        countryCode: json['countryCode'] == null ? null : json['countryCode'] as String,
        region: json['region'] == null ? null : json['region'] as String,
        regionName: json['regionName'] == null ? null : json['regionName'] as String,
        city: json['city'] == null ? null : json['city'] as String,
        zip: json['zip'] == null ? null : json['zip'] as String,
        lat: json['lat'] == null ? null : json['lat'] as double,
        lon: json['lon'] == null ? null : json['lon'] as double,
        timezone: json['timezone'] == null ? null : json['timezone'] as String,
        isp: json['isp'] == null ? null : json['isp'] as String,
        org: json['org'] == null ? null : json['org'] as String,
        as: json['as'] == null ? null : json['as'] as String,
        query: json['query'] == null ? null : json['query'] as String);
  }

  @override
  String toString() {
    return '''IpApiModel(
                status:$status,
country:$country,
countryCode:$countryCode,
region:$region,
regionName:$regionName,
city:$city,
zip:$zip,
lat:$lat,
lon:$lon,
timezone:$timezone,
isp:$isp,
org:$org,
as:$as,
query:$query
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is IpApiModel &&
        other.runtimeType == runtimeType &&
        other.status == status &&
        other.country == country &&
        other.countryCode == countryCode &&
        other.region == region &&
        other.regionName == regionName &&
        other.city == city &&
        other.zip == zip &&
        other.lat == lat &&
        other.lon == lon &&
        other.timezone == timezone &&
        other.isp == isp &&
        other.org == org &&
        other.as == as &&
        other.query == query;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, status, country, countryCode, region, regionName, city, zip, lat, lon, timezone, isp, org, as, query);
  }
}

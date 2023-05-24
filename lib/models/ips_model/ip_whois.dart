class IpWhois {
  final String? ip;
  final bool? success;
  final String? type;
  final String? continent;
  final String? continentCode;
  final String? country;
  final String? countryCode;
  final String? countryFlag;
  final String? countryCapital;
  final String? countryPhone;
  final String? countryNeighbours;
  final String? region;
  final String? city;
  final double? latitude;
  final double? longitude;
  final String? asn;
  final String? org;
  final String? isp;
  final String? timezone;
  final String? timezoneName;
  final int? timezoneDstOffset;
  final int? timezoneGmtOffset;
  final String? timezoneGmt;
  final String? currency;
  final String? currencyCode;
  final String? currencySymbol;
  final double? currencyRates;
  final String? currencyPlural;
  const IpWhois(
      {this.ip,
      this.success,
      this.type,
      this.continent,
      this.continentCode,
      this.country,
      this.countryCode,
      this.countryFlag,
      this.countryCapital,
      this.countryPhone,
      this.countryNeighbours,
      this.region,
      this.city,
      this.latitude,
      this.longitude,
      this.asn,
      this.org,
      this.isp,
      this.timezone,
      this.timezoneName,
      this.timezoneDstOffset,
      this.timezoneGmtOffset,
      this.timezoneGmt,
      this.currency,
      this.currencyCode,
      this.currencySymbol,
      this.currencyRates,
      this.currencyPlural});
  IpWhois copyWith(
      {String? ip,
      bool? success,
      String? type,
      String? continent,
      String? continentCode,
      String? country,
      String? countryCode,
      String? countryFlag,
      String? countryCapital,
      String? countryPhone,
      String? countryNeighbours,
      String? region,
      String? city,
      double? latitude,
      double? longitude,
      String? asn,
      String? org,
      String? isp,
      String? timezone,
      String? timezoneName,
      int? timezoneDstOffset,
      int? timezoneGmtOffset,
      String? timezoneGmt,
      String? currency,
      String? currencyCode,
      String? currencySymbol,
      double? currencyRates,
      String? currencyPlural}) {
    return IpWhois(
        ip: ip ?? this.ip,
        success: success ?? this.success,
        type: type ?? this.type,
        continent: continent ?? this.continent,
        continentCode: continentCode ?? this.continentCode,
        country: country ?? this.country,
        countryCode: countryCode ?? this.countryCode,
        countryFlag: countryFlag ?? this.countryFlag,
        countryCapital: countryCapital ?? this.countryCapital,
        countryPhone: countryPhone ?? this.countryPhone,
        countryNeighbours: countryNeighbours ?? this.countryNeighbours,
        region: region ?? this.region,
        city: city ?? this.city,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        asn: asn ?? this.asn,
        org: org ?? this.org,
        isp: isp ?? this.isp,
        timezone: timezone ?? this.timezone,
        timezoneName: timezoneName ?? this.timezoneName,
        timezoneDstOffset: timezoneDstOffset ?? this.timezoneDstOffset,
        timezoneGmtOffset: timezoneGmtOffset ?? this.timezoneGmtOffset,
        timezoneGmt: timezoneGmt ?? this.timezoneGmt,
        currency: currency ?? this.currency,
        currencyCode: currencyCode ?? this.currencyCode,
        currencySymbol: currencySymbol ?? this.currencySymbol,
        currencyRates: currencyRates ?? this.currencyRates,
        currencyPlural: currencyPlural ?? this.currencyPlural);
  }

  Map<String, Object?> toJson() {
    return {
      'ip': ip,
      'success': success,
      'type': type,
      'continent': continent,
      'continent_code': continentCode,
      'country': country,
      'country_code': countryCode,
      'country_flag': countryFlag,
      'country_capital': countryCapital,
      'country_phone': countryPhone,
      'country_neighbours': countryNeighbours,
      'region': region,
      'city': city,
      'latitude': latitude,
      'longitude': longitude,
      'asn': asn,
      'org': org,
      'isp': isp,
      'timezone': timezone,
      'timezone_name': timezoneName,
      'timezone_dstOffset': timezoneDstOffset,
      'timezone_gmtOffset': timezoneGmtOffset,
      'timezone_gmt': timezoneGmt,
      'currency': currency,
      'currency_code': currencyCode,
      'currency_symbol': currencySymbol,
      'currency_rates': currencyRates,
      'currency_plural': currencyPlural
    };
  }

  static IpWhois fromJson(Map<String, Object?> json) {
    return IpWhois(
        ip: json['ip'] == null ? null : json['ip'] as String,
        success: json['success'] == null ? null : json['success'] as bool,
        type: json['type'] == null ? null : json['type'] as String,
        continent: json['continent'] == null ? null : json['continent'] as String,
        continentCode: json['continent_code'] == null ? null : json['continent_code'] as String,
        country: json['country'] == null ? null : json['country'] as String,
        countryCode: json['country_code'] == null ? null : json['country_code'] as String,
        countryFlag: json['country_flag'] == null ? null : json['country_flag'] as String,
        countryCapital: json['country_capital'] == null ? null : json['country_capital'] as String,
        countryPhone: json['country_phone'] == null ? null : json['country_phone'] as String,
        countryNeighbours: json['country_neighbours'] == null ? null : json['country_neighbours'] as String,
        region: json['region'] == null ? null : json['region'] as String,
        city: json['city'] == null ? null : json['city'] as String,
        latitude: json['latitude'] == null ? null : json['latitude'] as double,
        longitude: json['longitude'] == null ? null : json['longitude'] as double,
        asn: json['asn'] == null ? null : json['asn'] as String,
        org: json['org'] == null ? null : json['org'] as String,
        isp: json['isp'] == null ? null : json['isp'] as String,
        timezone: json['timezone'] == null ? null : json['timezone'] as String,
        timezoneName: json['timezone_name'] == null ? null : json['timezone_name'] as String,
        timezoneDstOffset: json['timezone_dstOffset'] == null ? null : json['timezone_dstOffset'] as int,
        timezoneGmtOffset: json['timezone_gmtOffset'] == null ? null : json['timezone_gmtOffset'] as int,
        timezoneGmt: json['timezone_gmt'] == null ? null : json['timezone_gmt'] as String,
        currency: json['currency'] == null ? null : json['currency'] as String,
        currencyCode: json['currency_code'] == null ? null : json['currency_code'] as String,
        currencySymbol: json['currency_symbol'] == null ? null : json['currency_symbol'] as String,
        currencyRates: json['currency_rates'] == null ? null : json['currency_rates'] as double,
        currencyPlural: json['currency_plural'] == null ? null : json['currency_plural'] as String);
  }

  @override
  String toString() {
    return '''IpWhois(
                ip:$ip,
success:$success,
type:$type,
continent:$continent,
continentCode:$continentCode,
country:$country,
countryCode:$countryCode,
countryFlag:$countryFlag,
countryCapital:$countryCapital,
countryPhone:$countryPhone,
countryNeighbours:$countryNeighbours,
region:$region,
city:$city,
latitude:$latitude,
longitude:$longitude,
asn:$asn,
org:$org,
isp:$isp,
timezone:$timezone,
timezoneName:$timezoneName,
timezoneDstOffset:$timezoneDstOffset,
timezoneGmtOffset:$timezoneGmtOffset,
timezoneGmt:$timezoneGmt,
currency:$currency,
currencyCode:$currencyCode,
currencySymbol:$currencySymbol,
currencyRates:$currencyRates,
currencyPlural:$currencyPlural
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is IpWhois &&
        other.runtimeType == runtimeType &&
        other.ip == ip &&
        other.success == success &&
        other.type == type &&
        other.continent == continent &&
        other.continentCode == continentCode &&
        other.country == country &&
        other.countryCode == countryCode &&
        other.countryFlag == countryFlag &&
        other.countryCapital == countryCapital &&
        other.countryPhone == countryPhone &&
        other.countryNeighbours == countryNeighbours &&
        other.region == region &&
        other.city == city &&
        other.latitude == latitude &&
        other.longitude == longitude &&
        other.asn == asn &&
        other.org == org &&
        other.isp == isp &&
        other.timezone == timezone &&
        other.timezoneName == timezoneName &&
        other.timezoneDstOffset == timezoneDstOffset &&
        other.timezoneGmtOffset == timezoneGmtOffset &&
        other.timezoneGmt == timezoneGmt &&
        other.currency == currency &&
        other.currencyCode == currencyCode &&
        other.currencySymbol == currencySymbol &&
        other.currencyRates == currencyRates &&
        other.currencyPlural == currencyPlural;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, ip, success, type, continent, continentCode, country, countryCode, countryFlag, countryCapital, countryPhone, countryNeighbours, region, city, latitude, longitude,
        asn, org, isp, timezone);
  }
}

class CountryInfo {
  String? ip;
  bool? success;
  String? type;
  String? continent;
  String? continentCode;
  String? country;
  String? countryCode;
  String? countryFlag;
  String? countryCapital;
  String? countryPhone;
  String? countryNeighbours;
  String? region;
  String? city;
  double? latitude;
  double? longitude;
  String? asn;
  String? org;
  String? isp;
  String? timezone;
  String? timezoneName;
  int? timezoneDstOffset;
  int? timezoneGmtOffset;
  String? timezoneGmt;
  String? currency;
  String? currencyCode;
  String? currencySymbol;
  double? currencyRates;
  String? currencyPlural;

  CountryInfo(
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

  CountryInfo.fromJson(Map<String, dynamic> json) {
    ip = json['ip'];
    success = json['success'];
    type = json['type'];
    continent = json['continent'];
    continentCode = json['continent_code'];
    country = json['country'];
    countryCode = json['country_code'];
    countryFlag = json['country_flag'];
    countryCapital = json['country_capital'];
    countryPhone = json['country_phone'];
    countryNeighbours = json['country_neighbours'];
    region = json['region'];
    city = json['city'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    asn = json['asn'];
    org = json['org'];
    isp = json['isp'];
    timezone = json['timezone'];
    timezoneName = json['timezone_name'];
    timezoneDstOffset = json['timezone_dstOffset'];
    timezoneGmtOffset = json['timezone_gmtOffset'];
    timezoneGmt = json['timezone_gmt'];
    currency = json['currency'];
    currencyCode = json['currency_code'];
    currencySymbol = json['currency_symbol'];
    currencyRates = json['currency_rates'];
    currencyPlural = json['currency_plural'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ip'] = ip;
    data['success'] = success;
    data['type'] = type;
    data['continent'] = continent;
    data['continent_code'] = continentCode;
    data['country'] = country;
    data['country_code'] = countryCode;
    data['country_flag'] = countryFlag;
    data['country_capital'] = countryCapital;
    data['country_phone'] = countryPhone;
    data['country_neighbours'] = countryNeighbours;
    data['region'] = region;
    data['city'] = city;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['asn'] = asn;
    data['org'] = org;
    data['isp'] = isp;
    data['timezone'] = timezone;
    data['timezone_name'] = timezoneName;
    data['timezone_dstOffset'] = timezoneDstOffset;
    data['timezone_gmtOffset'] = timezoneGmtOffset;
    data['timezone_gmt'] = timezoneGmt;
    data['currency'] = currency;
    data['currency_code'] = currencyCode;
    data['currency_symbol'] = currencySymbol;
    data['currency_rates'] = currencyRates;
    data['currency_plural'] = currencyPlural;
    return data;
  }
}

class IpInfo {
final String? ip;
final String? hostname;
final String? city;
final String? region;
final String? country;
final String? loc;
final String? org;
final String? postal;
final String? timezone;
const IpInfo({this.ip , this.hostname , this.city , this.region , this.country , this.loc , this.org , this.postal , this.timezone });
IpInfo copyWith({String? ip, String? hostname, String? city, String? region, String? country, String? loc, String? org, String? postal, String? timezone}){
return IpInfo(
            ip:ip ?? this.ip,
hostname:hostname ?? this.hostname,
city:city ?? this.city,
region:region ?? this.region,
country:country ?? this.country,
loc:loc ?? this.loc,
org:org ?? this.org,
postal:postal ?? this.postal,
timezone:timezone ?? this.timezone
        );
        }
        
Map<String,Object?> toJson(){
    return {
            'ip': ip,
'hostname': hostname,
'city': city,
'region': region,
'country': country,
'loc': loc,
'org': org,
'postal': postal,
'timezone': timezone
    };
}

static IpInfo fromJson(Map<String , Object?> json){
    return IpInfo(
            ip:json['ip'] == null ? null : json['ip'] as String,
hostname:json['hostname'] == null ? null : json['hostname'] as String,
city:json['city'] == null ? null : json['city'] as String,
region:json['region'] == null ? null : json['region'] as String,
country:json['country'] == null ? null : json['country'] as String,
loc:json['loc'] == null ? null : json['loc'] as String,
org:json['org'] == null ? null : json['org'] as String,
postal:json['postal'] == null ? null : json['postal'] as String,
timezone:json['timezone'] == null ? null : json['timezone'] as String
    );
}

@override
String toString(){
    return '''IpInfo(
                ip:$ip,
hostname:$hostname,
city:$city,
region:$region,
country:$country,
loc:$loc,
org:$org,
postal:$postal,
timezone:$timezone
    ) ''';
}

@override
bool operator ==(Object other){
    return other is IpInfo && 
        other.runtimeType == runtimeType &&
        other.ip == ip && 
other.hostname == hostname && 
other.city == city && 
other.region == region && 
other.country == country && 
other.loc == loc && 
other.org == org && 
other.postal == postal && 
other.timezone == timezone;
}
      
@override
int get hashCode {
    return Object.hash(
                runtimeType,
                ip, 
hostname, 
city, 
region, 
country, 
loc, 
org, 
postal, 
timezone
    );
}
    
}
      
      
  
     
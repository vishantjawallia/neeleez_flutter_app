class CompanyProfile {
  final int? id;
  final double? distance;
  final int? reviews;
  final int? rating;
  final bool? isPromoAvailable;
  final CompanyInfo? companyInfo;
  final CompanyAddress? companyAddress;
  final CompanySocialMedia? companySocialMedia;
  final dynamic companyContact;
  final dynamic companyPackage;
  final List<ServiceTypes>? serviceTypes;
  final List<dynamic>? amenities;
  final List<dynamic>? companyTiming;
  final List<dynamic>? companyImages;
  const CompanyProfile(
      {this.id,
      this.distance,
      this.reviews,
      this.rating,
      this.isPromoAvailable,
      this.companyInfo,
      this.companyAddress,
      this.companySocialMedia,
      this.companyContact,
      this.companyPackage,
      this.serviceTypes,
      this.amenities,
      this.companyTiming,
      this.companyImages});
  CompanyProfile copyWith(
      {int? id,
      double? distance,
      int? reviews,
      int? rating,
      bool? isPromoAvailable,
      CompanyInfo? companyInfo,
      CompanyAddress? companyAddress,
      CompanySocialMedia? companySocialMedia,
      dynamic? companyContact,
      dynamic? companyPackage,
      List<ServiceTypes>? serviceTypes,
      List<dynamic>? amenities,
      List<dynamic>? companyTiming,
      List<dynamic>? companyImages}) {
    return CompanyProfile(
        id: id ?? this.id,
        distance: distance ?? this.distance,
        reviews: reviews ?? this.reviews,
        rating: rating ?? this.rating,
        isPromoAvailable: isPromoAvailable ?? this.isPromoAvailable,
        companyInfo: companyInfo ?? this.companyInfo,
        companyAddress: companyAddress ?? this.companyAddress,
        companySocialMedia: companySocialMedia ?? this.companySocialMedia,
        companyContact: companyContact ?? this.companyContact,
        companyPackage: companyPackage ?? this.companyPackage,
        serviceTypes: serviceTypes ?? this.serviceTypes,
        amenities: amenities ?? this.amenities,
        companyTiming: companyTiming ?? this.companyTiming,
        companyImages: companyImages ?? this.companyImages);
  }

  Map<String, Object?> toJson() {
    return {
      'id': id,
      'distance': distance,
      'reviews': reviews,
      'rating': rating,
      'isPromoAvailable': isPromoAvailable,
      'companyInfo': companyInfo?.toJson(),
      'companyAddress': companyAddress?.toJson(),
      'companySocialMedia': companySocialMedia?.toJson(),
      'companyContact': companyContact,
      'companyPackage': companyPackage,
      'serviceTypes': serviceTypes?.map<Map<String, dynamic>>((data) => data.toJson()).toList(),
      'amenities': amenities,
      'companyTiming': companyTiming,
      'companyImages': companyImages
    };
  }

  static CompanyProfile fromJson(Map<String, Object?> json) {
    return CompanyProfile(
        id: json['id'] == null ? null : json['id'] as int,
        distance: json['distance'] == null ? null : json['distance'] as double,
        reviews: json['reviews'] == null ? null : json['reviews'] as int,
        rating: json['rating'] == null ? null : json['rating'] as int,
        isPromoAvailable: json['isPromoAvailable'] == null ? null : json['isPromoAvailable'] as bool,
        companyInfo: json['companyInfo'] == null ? null : CompanyInfo.fromJson(json['companyInfo'] as Map<String, Object?>),
        companyAddress: json['companyAddress'] == null ? null : CompanyAddress.fromJson(json['companyAddress'] as Map<String, Object?>),
        companySocialMedia: json['companySocialMedia'] == null ? null : CompanySocialMedia.fromJson(json['companySocialMedia'] as Map<String, Object?>),
        companyContact: json['companyContact'] as dynamic,
        companyPackage: json['companyPackage'] as dynamic,
        serviceTypes: json['serviceTypes'] == null ? null : (json['serviceTypes'] as List).map<ServiceTypes>((data) => ServiceTypes.fromJson(data as Map<String, Object?>)).toList(),
        amenities: json['amenities'] == null ? null : json['amenities'] as List<dynamic>,
        companyTiming: json['companyTiming'] == null ? null : json['companyTiming'] as List<dynamic>,
        companyImages: json['companyImages'] == null ? null : json['companyImages'] as List<dynamic>);
  }

  @override
  String toString() {
    return '''CompanyProfile(
                id:$id,
distance:$distance,
reviews:$reviews,
rating:$rating,
isPromoAvailable:$isPromoAvailable,
companyInfo:${companyInfo.toString()},
companyAddress:${companyAddress.toString()},
companySocialMedia:${companySocialMedia.toString()},
companyContact:$companyContact,
companyPackage:$companyPackage,
serviceTypes:${serviceTypes.toString()},
amenities:$amenities,
companyTiming:$companyTiming,
companyImages:$companyImages
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is CompanyProfile &&
        other.runtimeType == runtimeType &&
        other.id == id &&
        other.distance == distance &&
        other.reviews == reviews &&
        other.rating == rating &&
        other.isPromoAvailable == isPromoAvailable &&
        other.companyInfo == companyInfo &&
        other.companyAddress == companyAddress &&
        other.companySocialMedia == companySocialMedia &&
        other.companyContact == companyContact &&
        other.companyPackage == companyPackage &&
        other.serviceTypes == serviceTypes &&
        other.amenities == amenities &&
        other.companyTiming == companyTiming &&
        other.companyImages == companyImages;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, id, distance, reviews, rating, isPromoAvailable, companyInfo, companyAddress, companySocialMedia, companyContact, companyPackage, serviceTypes, amenities,
        companyTiming, companyImages);
  }
}

class ServiceTypes {
  final int? id;
  final int? countryId;
  final int? businessServiceId;
  final String? businessTypeNameEn;
  final String? businessTypeNameAr;
  final String? businessTypeNameFr;
  final String? businessService;
  final String? businessServiceAr;
  final dynamic iconImage;
  final dynamic isActive;
  final int? userId;
  const ServiceTypes(
      {this.id,
      this.countryId,
      this.businessServiceId,
      this.businessTypeNameEn,
      this.businessTypeNameAr,
      this.businessTypeNameFr,
      this.businessService,
      this.businessServiceAr,
      this.iconImage,
      this.isActive,
      this.userId});
  ServiceTypes copyWith(
      {int? id,
      int? countryId,
      int? businessServiceId,
      String? businessTypeNameEn,
      String? businessTypeNameAr,
      String? businessTypeNameFr,
      String? businessService,
      String? businessServiceAr,
      dynamic? iconImage,
      dynamic? isActive,
      int? userId}) {
    return ServiceTypes(
        id: id ?? this.id,
        countryId: countryId ?? this.countryId,
        businessServiceId: businessServiceId ?? this.businessServiceId,
        businessTypeNameEn: businessTypeNameEn ?? this.businessTypeNameEn,
        businessTypeNameAr: businessTypeNameAr ?? this.businessTypeNameAr,
        businessTypeNameFr: businessTypeNameFr ?? this.businessTypeNameFr,
        businessService: businessService ?? this.businessService,
        businessServiceAr: businessServiceAr ?? this.businessServiceAr,
        iconImage: iconImage ?? this.iconImage,
        isActive: isActive ?? this.isActive,
        userId: userId ?? this.userId);
  }

  Map<String, Object?> toJson() {
    return {
      'id': id,
      'countryId': countryId,
      'businessServiceId': businessServiceId,
      'businessTypeNameEn': businessTypeNameEn,
      'businessTypeNameAr': businessTypeNameAr,
      'businessTypeNameFr': businessTypeNameFr,
      'businessService': businessService,
      'businessServiceAr': businessServiceAr,
      'iconImage': iconImage,
      'isActive': isActive,
      'userId': userId
    };
  }

  static ServiceTypes fromJson(Map<String, Object?> json) {
    return ServiceTypes(
        id: json['id'] == null ? null : json['id'] as int,
        countryId: json['countryId'] == null ? null : json['countryId'] as int,
        businessServiceId: json['businessServiceId'] == null ? null : json['businessServiceId'] as int,
        businessTypeNameEn: json['businessTypeNameEn'] == null ? null : json['businessTypeNameEn'] as String,
        businessTypeNameAr: json['businessTypeNameAr'] == null ? null : json['businessTypeNameAr'] as String,
        businessTypeNameFr: json['businessTypeNameFr'] == null ? null : json['businessTypeNameFr'] as String,
        businessService: json['businessService'] == null ? null : json['businessService'] as String,
        businessServiceAr: json['businessServiceAr'] == null ? null : json['businessServiceAr'] as String,
        iconImage: json['iconImage'] as dynamic,
        isActive: json['isActive'] as dynamic,
        userId: json['userId'] == null ? null : json['userId'] as int);
  }

  @override
  String toString() {
    return '''ServiceTypes(
                id:$id,
countryId:$countryId,
businessServiceId:$businessServiceId,
businessTypeNameEn:$businessTypeNameEn,
businessTypeNameAr:$businessTypeNameAr,
businessTypeNameFr:$businessTypeNameFr,
businessService:$businessService,
businessServiceAr:$businessServiceAr,
iconImage:$iconImage,
isActive:$isActive,
userId:$userId
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is ServiceTypes &&
        other.runtimeType == runtimeType &&
        other.id == id &&
        other.countryId == countryId &&
        other.businessServiceId == businessServiceId &&
        other.businessTypeNameEn == businessTypeNameEn &&
        other.businessTypeNameAr == businessTypeNameAr &&
        other.businessTypeNameFr == businessTypeNameFr &&
        other.businessService == businessService &&
        other.businessServiceAr == businessServiceAr &&
        other.iconImage == iconImage &&
        other.isActive == isActive &&
        other.userId == userId;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, id, countryId, businessServiceId, businessTypeNameEn, businessTypeNameAr, businessTypeNameFr, businessService, businessServiceAr, iconImage, isActive, userId);
  }
}

class CompanySocialMedia {
  final dynamic facebook;
  final dynamic instagram;
  final dynamic linkedIn;
  final dynamic twitter;
  const CompanySocialMedia({this.facebook, this.instagram, this.linkedIn, this.twitter});
  CompanySocialMedia copyWith({dynamic? facebook, dynamic? instagram, dynamic? linkedIn, dynamic? twitter}) {
    return CompanySocialMedia(facebook: facebook ?? this.facebook, instagram: instagram ?? this.instagram, linkedIn: linkedIn ?? this.linkedIn, twitter: twitter ?? this.twitter);
  }

  Map<String, Object?> toJson() {
    return {'facebook': facebook, 'instagram': instagram, 'linkedIn': linkedIn, 'twitter': twitter};
  }

  static CompanySocialMedia fromJson(Map<String, Object?> json) {
    return CompanySocialMedia(facebook: json['facebook'] as dynamic, instagram: json['instagram'] as dynamic, linkedIn: json['linkedIn'] as dynamic, twitter: json['twitter'] as dynamic);
  }

  @override
  String toString() {
    return '''CompanySocialMedia(
                facebook:$facebook,
instagram:$instagram,
linkedIn:$linkedIn,
twitter:$twitter
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is CompanySocialMedia && other.runtimeType == runtimeType && other.facebook == facebook && other.instagram == instagram && other.linkedIn == linkedIn && other.twitter == twitter;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, facebook, instagram, linkedIn, twitter);
  }
}

class CompanyAddress {
  final String? address;
  final String? googleAddress;
  final double? lattitude;
  final double? longitude;
  final int? countryId;
  final String? countryNameEn;
  final String? countryNameAr;
  final String? countryNameFr;
  final int? provinceId;
  final String? provinceNameEn;
  final String? provinceNameAr;
  final String? provinceNameFr;
  final int? cityId;
  final String? cityNameEn;
  final String? cityNameAr;
  final String? cityNameFr;
  final int? areaId;
  final dynamic areaNameEn;
  final dynamic areaNameAr;
  final dynamic areaNameFr;
  const CompanyAddress(
      {this.address,
      this.googleAddress,
      this.lattitude,
      this.longitude,
      this.countryId,
      this.countryNameEn,
      this.countryNameAr,
      this.countryNameFr,
      this.provinceId,
      this.provinceNameEn,
      this.provinceNameAr,
      this.provinceNameFr,
      this.cityId,
      this.cityNameEn,
      this.cityNameAr,
      this.cityNameFr,
      this.areaId,
      this.areaNameEn,
      this.areaNameAr,
      this.areaNameFr});
  CompanyAddress copyWith(
      {String? address,
      String? googleAddress,
      double? lattitude,
      double? longitude,
      int? countryId,
      String? countryNameEn,
      String? countryNameAr,
      String? countryNameFr,
      int? provinceId,
      String? provinceNameEn,
      String? provinceNameAr,
      String? provinceNameFr,
      int? cityId,
      String? cityNameEn,
      String? cityNameAr,
      String? cityNameFr,
      int? areaId,
      dynamic? areaNameEn,
      dynamic? areaNameAr,
      dynamic? areaNameFr}) {
    return CompanyAddress(
        address: address ?? this.address,
        googleAddress: googleAddress ?? this.googleAddress,
        lattitude: lattitude ?? this.lattitude,
        longitude: longitude ?? this.longitude,
        countryId: countryId ?? this.countryId,
        countryNameEn: countryNameEn ?? this.countryNameEn,
        countryNameAr: countryNameAr ?? this.countryNameAr,
        countryNameFr: countryNameFr ?? this.countryNameFr,
        provinceId: provinceId ?? this.provinceId,
        provinceNameEn: provinceNameEn ?? this.provinceNameEn,
        provinceNameAr: provinceNameAr ?? this.provinceNameAr,
        provinceNameFr: provinceNameFr ?? this.provinceNameFr,
        cityId: cityId ?? this.cityId,
        cityNameEn: cityNameEn ?? this.cityNameEn,
        cityNameAr: cityNameAr ?? this.cityNameAr,
        cityNameFr: cityNameFr ?? this.cityNameFr,
        areaId: areaId ?? this.areaId,
        areaNameEn: areaNameEn ?? this.areaNameEn,
        areaNameAr: areaNameAr ?? this.areaNameAr,
        areaNameFr: areaNameFr ?? this.areaNameFr);
  }

  Map<String, Object?> toJson() {
    return {
      'address': address,
      'googleAddress': googleAddress,
      'lattitude': lattitude,
      'longitude': longitude,
      'countryId': countryId,
      'countryNameEn': countryNameEn,
      'countryNameAr': countryNameAr,
      'countryNameFr': countryNameFr,
      'provinceId': provinceId,
      'provinceNameEn': provinceNameEn,
      'provinceNameAr': provinceNameAr,
      'provinceNameFr': provinceNameFr,
      'cityId': cityId,
      'cityNameEn': cityNameEn,
      'cityNameAr': cityNameAr,
      'cityNameFr': cityNameFr,
      'areaId': areaId,
      'areaNameEn': areaNameEn,
      'areaNameAr': areaNameAr,
      'areaNameFr': areaNameFr
    };
  }

  static CompanyAddress fromJson(Map<String, Object?> json) {
    return CompanyAddress(
        address: json['address'] == null ? null : json['address'] as String,
        googleAddress: json['googleAddress'] == null ? null : json['googleAddress'] as String,
        lattitude: json['lattitude'] == null ? null : json['lattitude'] as double,
        longitude: json['longitude'] == null ? null : json['longitude'] as double,
        countryId: json['countryId'] == null ? null : json['countryId'] as int,
        countryNameEn: json['countryNameEn'] == null ? null : json['countryNameEn'] as String,
        countryNameAr: json['countryNameAr'] == null ? null : json['countryNameAr'] as String,
        countryNameFr: json['countryNameFr'] == null ? null : json['countryNameFr'] as String,
        provinceId: json['provinceId'] == null ? null : json['provinceId'] as int,
        provinceNameEn: json['provinceNameEn'] == null ? null : json['provinceNameEn'] as String,
        provinceNameAr: json['provinceNameAr'] == null ? null : json['provinceNameAr'] as String,
        provinceNameFr: json['provinceNameFr'] == null ? null : json['provinceNameFr'] as String,
        cityId: json['cityId'] == null ? null : json['cityId'] as int,
        cityNameEn: json['cityNameEn'] == null ? null : json['cityNameEn'] as String,
        cityNameAr: json['cityNameAr'] == null ? null : json['cityNameAr'] as String,
        cityNameFr: json['cityNameFr'] == null ? null : json['cityNameFr'] as String,
        areaId: json['areaId'] == null ? null : json['areaId'] as int,
        areaNameEn: json['areaNameEn'] as dynamic,
        areaNameAr: json['areaNameAr'] as dynamic,
        areaNameFr: json['areaNameFr'] as dynamic);
  }

  @override
  String toString() {
    return '''CompanyAddress(
                address:$address,
googleAddress:$googleAddress,
lattitude:$lattitude,
longitude:$longitude,
countryId:$countryId,
countryNameEn:$countryNameEn,
countryNameAr:$countryNameAr,
countryNameFr:$countryNameFr,
provinceId:$provinceId,
provinceNameEn:$provinceNameEn,
provinceNameAr:$provinceNameAr,
provinceNameFr:$provinceNameFr,
cityId:$cityId,
cityNameEn:$cityNameEn,
cityNameAr:$cityNameAr,
cityNameFr:$cityNameFr,
areaId:$areaId,
areaNameEn:$areaNameEn,
areaNameAr:$areaNameAr,
areaNameFr:$areaNameFr
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is CompanyAddress &&
        other.runtimeType == runtimeType &&
        other.address == address &&
        other.googleAddress == googleAddress &&
        other.lattitude == lattitude &&
        other.longitude == longitude &&
        other.countryId == countryId &&
        other.countryNameEn == countryNameEn &&
        other.countryNameAr == countryNameAr &&
        other.countryNameFr == countryNameFr &&
        other.provinceId == provinceId &&
        other.provinceNameEn == provinceNameEn &&
        other.provinceNameAr == provinceNameAr &&
        other.provinceNameFr == provinceNameFr &&
        other.cityId == cityId &&
        other.cityNameEn == cityNameEn &&
        other.cityNameAr == cityNameAr &&
        other.cityNameFr == cityNameFr &&
        other.areaId == areaId &&
        other.areaNameEn == areaNameEn &&
        other.areaNameAr == areaNameAr &&
        other.areaNameFr == areaNameFr;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, address, googleAddress, lattitude, longitude, countryId, countryNameEn, countryNameAr, countryNameFr, provinceId, provinceNameEn, provinceNameAr, provinceNameFr,
        cityId, cityNameEn, cityNameAr, cityNameFr, areaId, areaNameEn, areaNameAr);
  }
}

class CompanyInfo {
  final dynamic logo;
  final bool? isFreeLancer;
  final String? companyNumber;
  final String? nameEn;
  final dynamic nameAr;
  final dynamic nameFr;
  final dynamic tagLine;
  final String? edate;
  final int? genderId;
  final String? mobile;
  final String? whatsapp;
  final String? tel1;
  final String? email;
  final dynamic url;
  final dynamic tel2;
  final dynamic aboutUs;
  final dynamic taxNumber;
  final bool? isEmailVerified;
  final bool? appMobileVerified;
  final bool? webMobileVerified;
  const CompanyInfo(
      {this.logo,
      this.isFreeLancer,
      this.companyNumber,
      this.nameEn,
      this.nameAr,
      this.nameFr,
      this.tagLine,
      this.edate,
      this.genderId,
      this.mobile,
      this.whatsapp,
      this.tel1,
      this.email,
      this.url,
      this.tel2,
      this.aboutUs,
      this.taxNumber,
      this.isEmailVerified,
      this.appMobileVerified,
      this.webMobileVerified});
  CompanyInfo copyWith(
      {dynamic? logo,
      bool? isFreeLancer,
      String? companyNumber,
      String? nameEn,
      dynamic? nameAr,
      dynamic? nameFr,
      dynamic? tagLine,
      String? edate,
      int? genderId,
      String? mobile,
      String? whatsapp,
      String? tel1,
      String? email,
      dynamic? url,
      dynamic? tel2,
      dynamic? aboutUs,
      dynamic? taxNumber,
      bool? isEmailVerified,
      bool? appMobileVerified,
      bool? webMobileVerified}) {
    return CompanyInfo(
        logo: logo ?? this.logo,
        isFreeLancer: isFreeLancer ?? this.isFreeLancer,
        companyNumber: companyNumber ?? this.companyNumber,
        nameEn: nameEn ?? this.nameEn,
        nameAr: nameAr ?? this.nameAr,
        nameFr: nameFr ?? this.nameFr,
        tagLine: tagLine ?? this.tagLine,
        edate: edate ?? this.edate,
        genderId: genderId ?? this.genderId,
        mobile: mobile ?? this.mobile,
        whatsapp: whatsapp ?? this.whatsapp,
        tel1: tel1 ?? this.tel1,
        email: email ?? this.email,
        url: url ?? this.url,
        tel2: tel2 ?? this.tel2,
        aboutUs: aboutUs ?? this.aboutUs,
        taxNumber: taxNumber ?? this.taxNumber,
        isEmailVerified: isEmailVerified ?? this.isEmailVerified,
        appMobileVerified: appMobileVerified ?? this.appMobileVerified,
        webMobileVerified: webMobileVerified ?? this.webMobileVerified);
  }

  Map<String, Object?> toJson() {
    return {
      'logo': logo,
      'isFreeLancer': isFreeLancer,
      'companyNumber': companyNumber,
      'nameEn': nameEn,
      'nameAr': nameAr,
      'nameFr': nameFr,
      'tagLine': tagLine,
      'edate': edate,
      'genderId': genderId,
      'mobile': mobile,
      'whatsapp': whatsapp,
      'tel1': tel1,
      'email': email,
      'url': url,
      'tel2': tel2,
      'aboutUs': aboutUs,
      'taxNumber': taxNumber,
      'isEmailVerified': isEmailVerified,
      'appMobileVerified': appMobileVerified,
      'webMobileVerified': webMobileVerified
    };
  }

  static CompanyInfo fromJson(Map<String, Object?> json) {
    return CompanyInfo(
        logo: json['logo'] as dynamic,
        isFreeLancer: json['isFreeLancer'] == null ? null : json['isFreeLancer'] as bool,
        companyNumber: json['companyNumber'] == null ? null : json['companyNumber'] as String,
        nameEn: json['nameEn'] == null ? null : json['nameEn'] as String,
        nameAr: json['nameAr'] as dynamic,
        nameFr: json['nameFr'] as dynamic,
        tagLine: json['tagLine'] as dynamic,
        edate: json['edate'] == null ? null : json['edate'] as String,
        genderId: json['genderId'] == null ? null : json['genderId'] as int,
        mobile: json['mobile'] == null ? null : json['mobile'] as String,
        whatsapp: json['whatsapp'] == null ? null : json['whatsapp'] as String,
        tel1: json['tel1'] == null ? null : json['tel1'] as String,
        email: json['email'] == null ? null : json['email'] as String,
        url: json['url'] as dynamic,
        tel2: json['tel2'] as dynamic,
        aboutUs: json['aboutUs'] as dynamic,
        taxNumber: json['taxNumber'] as dynamic,
        isEmailVerified: json['isEmailVerified'] == null ? null : json['isEmailVerified'] as bool,
        appMobileVerified: json['appMobileVerified'] == null ? null : json['appMobileVerified'] as bool,
        webMobileVerified: json['webMobileVerified'] == null ? null : json['webMobileVerified'] as bool);
  }

  @override
  String toString() {
    return '''CompanyInfo(
                logo:$logo,
isFreeLancer:$isFreeLancer,
companyNumber:$companyNumber,
nameEn:$nameEn,
nameAr:$nameAr,
nameFr:$nameFr,
tagLine:$tagLine,
edate:$edate,
genderId:$genderId,
mobile:$mobile,
whatsapp:$whatsapp,
tel1:$tel1,
email:$email,
url:$url,
tel2:$tel2,
aboutUs:$aboutUs,
taxNumber:$taxNumber,
isEmailVerified:$isEmailVerified,
appMobileVerified:$appMobileVerified,
webMobileVerified:$webMobileVerified
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is CompanyInfo &&
        other.runtimeType == runtimeType &&
        other.logo == logo &&
        other.isFreeLancer == isFreeLancer &&
        other.companyNumber == companyNumber &&
        other.nameEn == nameEn &&
        other.nameAr == nameAr &&
        other.nameFr == nameFr &&
        other.tagLine == tagLine &&
        other.edate == edate &&
        other.genderId == genderId &&
        other.mobile == mobile &&
        other.whatsapp == whatsapp &&
        other.tel1 == tel1 &&
        other.email == email &&
        other.url == url &&
        other.tel2 == tel2 &&
        other.aboutUs == aboutUs &&
        other.taxNumber == taxNumber &&
        other.isEmailVerified == isEmailVerified &&
        other.appMobileVerified == appMobileVerified &&
        other.webMobileVerified == webMobileVerified;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, logo, isFreeLancer, companyNumber, nameEn, nameAr, nameFr, tagLine, edate, genderId, mobile, whatsapp, tel1, email, url, tel2, aboutUs, taxNumber, isEmailVerified,
        appMobileVerified);
  }
}

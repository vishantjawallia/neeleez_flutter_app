class GeneralInformation {
  final String? logo;
  final String? companyNumber;
  final String? nameEn;
  final String? nameAr;
  final dynamic nameFr;
  final String? tagLine;
  final String? edate;
  final int? genderId;
  final dynamic gender;
  final String? mobile;
  final String? whatsapp;
  final String? tel1;
  final String? email;
  final String? url;
  final String? aboutUs;
  final String? taxNumber;
  final bool? isEmailVerified;
  final bool? appMobileVerified;
  final bool? webMobileVerified;
  final bool? isPromoAvailable;
  final bool? isFreeLancer;
  final SocialMediaInfo? socialMediaInfo;
  final List<BusinessTypesViewModel>? businessTypesViewModel;
  final List<AmenitiesViewModels>? amenitiesViewModels;
  const GeneralInformation(
      {this.logo,
      this.companyNumber,
      this.nameEn,
      this.nameAr,
      this.nameFr,
      this.tagLine,
      this.edate,
      this.genderId,
      this.gender,
      this.mobile,
      this.whatsapp,
      this.tel1,
      this.email,
      this.url,
      this.aboutUs,
      this.taxNumber,
      this.isEmailVerified,
      this.appMobileVerified,
      this.webMobileVerified,
      this.isPromoAvailable,
      this.isFreeLancer,
      this.socialMediaInfo,
      this.businessTypesViewModel,
      this.amenitiesViewModels});
  GeneralInformation copyWith(
      {String? logo,
      String? companyNumber,
      String? nameEn,
      String? nameAr,
      dynamic? nameFr,
      String? tagLine,
      String? edate,
      int? genderId,
      dynamic? gender,
      String? mobile,
      String? whatsapp,
      String? tel1,
      String? email,
      String? url,
      String? aboutUs,
      String? taxNumber,
      bool? isEmailVerified,
      bool? appMobileVerified,
      bool? webMobileVerified,
      bool? isPromoAvailable,
      bool? isFreeLancer,
      SocialMediaInfo? socialMediaInfo,
      List<BusinessTypesViewModel>? businessTypesViewModel,
      List<AmenitiesViewModels>? amenitiesViewModels}) {
    return GeneralInformation(
        logo: logo ?? this.logo,
        companyNumber: companyNumber ?? this.companyNumber,
        nameEn: nameEn ?? this.nameEn,
        nameAr: nameAr ?? this.nameAr,
        nameFr: nameFr ?? this.nameFr,
        tagLine: tagLine ?? this.tagLine,
        edate: edate ?? this.edate,
        genderId: genderId ?? this.genderId,
        gender: gender ?? this.gender,
        mobile: mobile ?? this.mobile,
        whatsapp: whatsapp ?? this.whatsapp,
        tel1: tel1 ?? this.tel1,
        email: email ?? this.email,
        url: url ?? this.url,
        aboutUs: aboutUs ?? this.aboutUs,
        taxNumber: taxNumber ?? this.taxNumber,
        isEmailVerified: isEmailVerified ?? this.isEmailVerified,
        appMobileVerified: appMobileVerified ?? this.appMobileVerified,
        webMobileVerified: webMobileVerified ?? this.webMobileVerified,
        isPromoAvailable: isPromoAvailable ?? this.isPromoAvailable,
        isFreeLancer: isFreeLancer ?? this.isFreeLancer,
        socialMediaInfo: socialMediaInfo ?? this.socialMediaInfo,
        businessTypesViewModel: businessTypesViewModel ?? this.businessTypesViewModel,
        amenitiesViewModels: amenitiesViewModels ?? this.amenitiesViewModels);
  }

  Map<String, Object?> toJson() {
    return {
      'logo': logo,
      'companyNumber': companyNumber,
      'nameEn': nameEn,
      'nameAr': nameAr,
      'nameFr': nameFr,
      'tagLine': tagLine,
      'edate': edate,
      'genderId': genderId,
      'gender': gender,
      'mobile': mobile,
      'whatsapp': whatsapp,
      'tel1': tel1,
      'email': email,
      'url': url,
      'aboutUs': aboutUs,
      'taxNumber': taxNumber,
      'isEmailVerified': isEmailVerified,
      'appMobileVerified': appMobileVerified,
      'webMobileVerified': webMobileVerified,
      'isPromoAvailable': isPromoAvailable,
      'isFreeLancer': isFreeLancer,
      'socialMediaInfo': socialMediaInfo?.toJson(),
      'businessTypesViewModel': businessTypesViewModel?.map<Map<String, dynamic>>((data) => data.toJson()).toList(),
      'amenitiesViewModels': amenitiesViewModels?.map<Map<String, dynamic>>((data) => data.toJson()).toList(),
    };
  }

  static GeneralInformation fromJson(Map<String, Object?> json) {
    return GeneralInformation(
      logo: json['logo'] == null ? null : json['logo'] as String,
      companyNumber: json['companyNumber'] == null ? null : json['companyNumber'] as String,
      nameEn: json['nameEn'] == null ? null : json['nameEn'] as String,
      nameAr: json['nameAr'] == null ? null : json['nameAr'] as String,
      nameFr: json['nameFr'] as dynamic,
      tagLine: json['tagLine'] == null ? null : json['tagLine'] as String,
      edate: json['edate'] == null ? null : json['edate'] as String,
      genderId: json['genderId'] == null ? null : json['genderId'] as int,
      gender: json['gender'] as dynamic,
      mobile: json['mobile'] == null ? null : json['mobile'] as String,
      whatsapp: json['whatsapp'] == null ? null : json['whatsapp'] as String,
      tel1: json['tel1'] == null ? null : json['tel1'] as String,
      email: json['email'] == null ? null : json['email'] as String,
      url: json['url'] == null ? null : json['url'] as String,
      aboutUs: json['aboutUs'] == null ? null : json['aboutUs'] as String,
      taxNumber: json['taxNumber'] == null ? null : json['taxNumber'] as String,
      isEmailVerified: json['isEmailVerified'] == null ? null : json['isEmailVerified'] as bool,
      appMobileVerified: json['appMobileVerified'] == null ? null : json['appMobileVerified'] as bool,
      webMobileVerified: json['webMobileVerified'] == null ? null : json['webMobileVerified'] as bool,
      isPromoAvailable: json['isPromoAvailable'] == null ? null : json['isPromoAvailable'] as bool,
      isFreeLancer: json['isFreeLancer'] == null ? null : json['isFreeLancer'] as bool,
      socialMediaInfo: json['socialMediaInfo'] == null ? null : SocialMediaInfo.fromJson(json['socialMediaInfo'] as Map<String, Object?>),
      businessTypesViewModel: json['businessTypesViewModel'] == null
          ? null
          : (json['businessTypesViewModel'] as List).map<BusinessTypesViewModel>((data) => BusinessTypesViewModel.fromJson(data as Map<String, Object?>)).toList(),
      amenitiesViewModels:
          json['amenitiesViewModels'] == null ? null : (json['amenitiesViewModels'] as List).map<AmenitiesViewModels>((data) => AmenitiesViewModels.fromJson(data as Map<String, Object?>)).toList(),
    );
  }

  @override
  String toString() {
    return '''GeneralInformation(
                logo:$logo,
companyNumber:$companyNumber,
nameEn:$nameEn,
nameAr:$nameAr,
nameFr:$nameFr,
tagLine:$tagLine,
edate:$edate,
genderId:$genderId,
gender:$gender,
mobile:$mobile,
whatsapp:$whatsapp,
tel1:$tel1,
email:$email,
url:$url,
aboutUs:$aboutUs,
taxNumber:$taxNumber,
isEmailVerified:$isEmailVerified,
appMobileVerified:$appMobileVerified,
webMobileVerified:$webMobileVerified,
isPromoAvailable:$isPromoAvailable,
isFreeLancer:$isFreeLancer,
socialMediaInfo:${socialMediaInfo.toString()},
businessTypesViewModel:$businessTypesViewModel,
amenitiesViewModels:${amenitiesViewModels.toString()}
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is GeneralInformation &&
        other.runtimeType == runtimeType &&
        other.logo == logo &&
        other.companyNumber == companyNumber &&
        other.nameEn == nameEn &&
        other.nameAr == nameAr &&
        other.nameFr == nameFr &&
        other.tagLine == tagLine &&
        other.edate == edate &&
        other.genderId == genderId &&
        other.gender == gender &&
        other.mobile == mobile &&
        other.whatsapp == whatsapp &&
        other.tel1 == tel1 &&
        other.email == email &&
        other.url == url &&
        other.aboutUs == aboutUs &&
        other.taxNumber == taxNumber &&
        other.isEmailVerified == isEmailVerified &&
        other.appMobileVerified == appMobileVerified &&
        other.webMobileVerified == webMobileVerified &&
        other.isPromoAvailable == isPromoAvailable &&
        other.isFreeLancer == isFreeLancer &&
        other.socialMediaInfo == socialMediaInfo &&
        other.businessTypesViewModel == businessTypesViewModel &&
        other.amenitiesViewModels == amenitiesViewModels;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, logo, companyNumber, nameEn, nameAr, nameFr, tagLine, edate, genderId, gender, mobile, whatsapp, tel1, email, url, aboutUs, taxNumber, isEmailVerified,
        appMobileVerified, webMobileVerified);
  }
}

class AmenitiesViewModels {
  final int? id;
  final String? amenityNameEn;
  final String? amenityNameAr;
  final String? amenityNameFr;
  final String? iconImage;
  final int? userId;
  final dynamic isActive;
  final dynamic stateDate;
  const AmenitiesViewModels({this.id, this.amenityNameEn, this.amenityNameAr, this.amenityNameFr, this.iconImage, this.userId, this.isActive, this.stateDate});
  AmenitiesViewModels copyWith({int? id, String? amenityNameEn, String? amenityNameAr, String? amenityNameFr, String? iconImage, int? userId, dynamic? isActive, dynamic? stateDate}) {
    return AmenitiesViewModels(
        id: id ?? this.id,
        amenityNameEn: amenityNameEn ?? this.amenityNameEn,
        amenityNameAr: amenityNameAr ?? this.amenityNameAr,
        amenityNameFr: amenityNameFr ?? this.amenityNameFr,
        iconImage: iconImage ?? this.iconImage,
        userId: userId ?? this.userId,
        isActive: isActive ?? this.isActive,
        stateDate: stateDate ?? this.stateDate);
  }

  Map<String, Object?> toJson() {
    return {
      'id': id,
      'amenityNameEn': amenityNameEn,
      'amenityNameAr': amenityNameAr,
      'amenityNameFr': amenityNameFr,
      'iconImage': iconImage,
      'userId': userId,
      'isActive': isActive,
      'stateDate': stateDate
    };
  }

  static AmenitiesViewModels fromJson(Map<String, Object?> json) {
    return AmenitiesViewModels(
        id: json['id'] == null ? null : json['id'] as int,
        amenityNameEn: json['amenityNameEn'] == null ? null : json['amenityNameEn'] as String,
        amenityNameAr: json['amenityNameAr'] == null ? null : json['amenityNameAr'] as String,
        amenityNameFr: json['amenityNameFr'] == null ? null : json['amenityNameFr'] as String,
        iconImage: json['iconImage'] == null ? null : json['iconImage'] as String,
        userId: json['userId'] == null ? null : json['userId'] as int,
        isActive: json['isActive'] as dynamic,
        stateDate: json['stateDate'] as dynamic);
  }

  @override
  String toString() {
    return '''AmenitiesViewModels(
                id:$id,
amenityNameEn:$amenityNameEn,
amenityNameAr:$amenityNameAr,
amenityNameFr:$amenityNameFr,
iconImage:$iconImage,
userId:$userId,
isActive:$isActive,
stateDate:$stateDate
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is AmenitiesViewModels &&
        other.runtimeType == runtimeType &&
        other.id == id &&
        other.amenityNameEn == amenityNameEn &&
        other.amenityNameAr == amenityNameAr &&
        other.amenityNameFr == amenityNameFr &&
        other.iconImage == iconImage &&
        other.userId == userId &&
        other.isActive == isActive &&
        other.stateDate == stateDate;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, id, amenityNameEn, amenityNameAr, amenityNameFr, iconImage, userId, isActive, stateDate);
  }
}

class SocialMediaInfo {
  final String? facebook;
  final String? instagram;
  final String? twitter;
  final String? linkedIn;
  const SocialMediaInfo({this.facebook, this.instagram, this.twitter, this.linkedIn});
  SocialMediaInfo copyWith({String? facebook, String? instagram, String? twitter, String? linkedIn}) {
    return SocialMediaInfo(facebook: facebook ?? this.facebook, instagram: instagram ?? this.instagram, twitter: twitter ?? this.twitter, linkedIn: linkedIn ?? this.linkedIn);
  }

  Map<String, Object?> toJson() {
    return {'facebook': facebook, 'instagram': instagram, 'twitter': twitter, 'linkedIn': linkedIn};
  }

  static SocialMediaInfo fromJson(Map<String, Object?> json) {
    return SocialMediaInfo(
        facebook: json['facebook'] == null ? null : json['facebook'] as String,
        instagram: json['instagram'] == null ? null : json['instagram'] as String,
        twitter: json['twitter'] == null ? null : json['twitter'] as String,
        linkedIn: json['linkedIn'] == null ? null : json['linkedIn'] as String);
  }

  @override
  String toString() {
    return '''SocialMediaInfo(
                facebook:$facebook,
instagram:$instagram,
twitter:$twitter,
linkedIn:$linkedIn
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is SocialMediaInfo && other.runtimeType == runtimeType && other.facebook == facebook && other.instagram == instagram && other.twitter == twitter && other.linkedIn == linkedIn;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, facebook, instagram, twitter, linkedIn);
  }
}

class BusinessTypesViewModel {
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
  const BusinessTypesViewModel(
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
  BusinessTypesViewModel copyWith(
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
    return BusinessTypesViewModel(
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

  static BusinessTypesViewModel fromJson(Map<String, Object?> json) {
    return BusinessTypesViewModel(
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
    return '''BusinessTypesViewModel(
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
    return other is BusinessTypesViewModel &&
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

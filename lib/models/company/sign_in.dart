class SignIn {
  final int? isRegistered;
  final bool? isRegisteredBySalesTeam;
  final String? companyLogo;
  final bool? isFreeLancer;
  final int? companyId;
  final int? businessServiceId;
  final String? companyNumber;
  final String? companyNameEn;
  final String? companyNameAr;
  final int? genderId;
  final String? genderEn;
  final String? genderAr;
  final String? genderFr;
  final String? mobile;
  final String? whatsapp;
  final String? tel1;
  final String? email;
  final int? areaId;
  final String? areaEn;
  final String? areaAr;
  final String? areaFr;
  final int? cityId;
  final String? cityEn;
  final String? cityAr;
  final String? cityFr;
  final int? provinceId;
  final String? provinceEn;
  final String? provinceAr;
  final String? provinceFr;
  final int? countryId;
  final String? countryEn;
  final String? countryAr;
  final String? countryFr;
  final int? lattitude;
  final int? longitude;
  final String? address;
  final String? googleAddress;
  final bool? isEmailVerified;
  final bool? appMobileVerified;
  final bool? webMobileVerified;
  final int? teamUserId;
  final CurrentPackageDetail? currentPackageDetail;
  const SignIn(
      {this.isRegistered,
      this.isRegisteredBySalesTeam,
      this.companyLogo,
      this.isFreeLancer,
      this.companyId,
      this.businessServiceId,
      this.companyNumber,
      this.companyNameEn,
      this.companyNameAr,
      this.genderId,
      this.genderEn,
      this.genderAr,
      this.genderFr,
      this.mobile,
      this.whatsapp,
      this.tel1,
      this.email,
      this.areaId,
      this.areaEn,
      this.areaAr,
      this.areaFr,
      this.cityId,
      this.cityEn,
      this.cityAr,
      this.cityFr,
      this.provinceId,
      this.provinceEn,
      this.provinceAr,
      this.provinceFr,
      this.countryId,
      this.countryEn,
      this.countryAr,
      this.countryFr,
      this.lattitude,
      this.longitude,
      this.address,
      this.googleAddress,
      this.isEmailVerified,
      this.appMobileVerified,
      this.webMobileVerified,
      this.teamUserId,
      this.currentPackageDetail});
  SignIn copyWith(
      {int? isRegistered,
      bool? isRegisteredBySalesTeam,
      String? companyLogo,
      bool? isFreeLancer,
      int? companyId,
      int? businessServiceId,
      String? companyNumber,
      String? companyNameEn,
      String? companyNameAr,
      int? genderId,
      String? genderEn,
      String? genderAr,
      String? genderFr,
      String? mobile,
      String? whatsapp,
      String? tel1,
      String? email,
      int? areaId,
      String? areaEn,
      String? areaAr,
      String? areaFr,
      int? cityId,
      String? cityEn,
      String? cityAr,
      String? cityFr,
      int? provinceId,
      String? provinceEn,
      String? provinceAr,
      String? provinceFr,
      int? countryId,
      String? countryEn,
      String? countryAr,
      String? countryFr,
      int? lattitude,
      int? longitude,
      String? address,
      String? googleAddress,
      bool? isEmailVerified,
      bool? appMobileVerified,
      bool? webMobileVerified,
      int? teamUserId,
      CurrentPackageDetail? currentPackageDetail}) {
    return SignIn(
      isRegistered: isRegistered ?? this.isRegistered,
      isRegisteredBySalesTeam: isRegisteredBySalesTeam ?? this.isRegisteredBySalesTeam,
      companyLogo: companyLogo ?? this.companyLogo,
      isFreeLancer: isFreeLancer ?? this.isFreeLancer,
      companyId: companyId ?? this.companyId,
      businessServiceId: businessServiceId ?? this.businessServiceId,
      companyNumber: companyNumber ?? this.companyNumber,
      companyNameEn: companyNameEn ?? this.companyNameEn,
      companyNameAr: companyNameAr ?? this.companyNameAr,
      genderId: genderId ?? this.genderId,
      genderEn: genderEn ?? this.genderEn,
      genderAr: genderAr ?? this.genderAr,
      genderFr: genderFr ?? this.genderFr,
      mobile: mobile ?? this.mobile,
      whatsapp: whatsapp ?? this.whatsapp,
      tel1: tel1 ?? this.tel1,
      email: email ?? this.email,
      areaId: areaId ?? this.areaId,
      areaEn: areaEn ?? this.areaEn,
      areaAr: areaAr ?? this.areaAr,
      areaFr: areaFr ?? this.areaFr,
      cityId: cityId ?? this.cityId,
      cityEn: cityEn ?? this.cityEn,
      cityAr: cityAr ?? this.cityAr,
      cityFr: cityFr ?? this.cityFr,
      provinceId: provinceId ?? this.provinceId,
      provinceEn: provinceEn ?? this.provinceEn,
      provinceAr: provinceAr ?? this.provinceAr,
      provinceFr: provinceFr ?? this.provinceFr,
      countryId: countryId ?? this.countryId,
      countryEn: countryEn ?? this.countryEn,
      countryAr: countryAr ?? this.countryAr,
      countryFr: countryFr ?? this.countryFr,
      lattitude: lattitude ?? this.lattitude,
      longitude: longitude ?? this.longitude,
      address: address ?? this.address,
      googleAddress: googleAddress ?? this.googleAddress,
      isEmailVerified: isEmailVerified ?? this.isEmailVerified,
      appMobileVerified: appMobileVerified ?? this.appMobileVerified,
      webMobileVerified: webMobileVerified ?? this.webMobileVerified,
      teamUserId: teamUserId ?? this.teamUserId,
      currentPackageDetail: currentPackageDetail ?? this.currentPackageDetail,
    );
  }

  Map<String, Object?> toJson() {
    return {
      'isRegistered': isRegistered,
      'isRegisteredBySalesTeam': isRegisteredBySalesTeam,
      'companyLogo': companyLogo,
      'isFreeLancer': isFreeLancer,
      'companyId': companyId,
      'businessServiceId': businessServiceId,
      'companyNumber': companyNumber,
      'companyNameEn': companyNameEn,
      'companyNameAr': companyNameAr,
      'genderId': genderId,
      'genderEn': genderEn,
      'genderAr': genderAr,
      'genderFr': genderFr,
      'mobile': mobile,
      'whatsapp': whatsapp,
      'tel1': tel1,
      'email': email,
      'areaId': areaId,
      'areaEn': areaEn,
      'areaAr': areaAr,
      'areaFr': areaFr,
      'cityId': cityId,
      'cityEn': cityEn,
      'cityAr': cityAr,
      'cityFr': cityFr,
      'provinceId': provinceId,
      'provinceEn': provinceEn,
      'provinceAr': provinceAr,
      'provinceFr': provinceFr,
      'countryId': countryId,
      'countryEn': countryEn,
      'countryAr': countryAr,
      'countryFr': countryFr,
      'lattitude': lattitude,
      'longitude': longitude,
      'address': address,
      'googleAddress': googleAddress,
      'isEmailVerified': isEmailVerified,
      'appMobileVerified': appMobileVerified,
      'webMobileVerified': webMobileVerified,
      'teamUserId': teamUserId,
      'currentPackageDetail': currentPackageDetail?.toJson()
    };
  }

  static SignIn fromJson(Map<String, Object?> json) {
    return SignIn(
        isRegistered: json['isRegistered'] == null ? null : json['isRegistered'] as int,
        isRegisteredBySalesTeam: json['isRegisteredBySalesTeam'] == null ? null : json['isRegisteredBySalesTeam'] as bool,
        companyLogo: json['companyLogo'] == null ? null : json['companyLogo'] as String,
        isFreeLancer: json['isFreeLancer'] == null ? null : json['isFreeLancer'] as bool,
        companyId: json['companyId'] == null ? null : json['companyId'] as int,
        businessServiceId: json['businessServiceId'] == null ? null : json['businessServiceId'] as int,
        companyNumber: json['companyNumber'] == null ? null : json['companyNumber'] as String,
        companyNameEn: json['companyNameEn'] == null ? null : json['companyNameEn'] as String,
        companyNameAr: json['companyNameAr'] == null ? null : json['companyNameAr'] as String,
        genderId: json['genderId'] == null ? null : json['genderId'] as int,
        genderEn: json['genderEn'] == null ? null : json['genderEn'] as String,
        genderAr: json['genderAr'] == null ? null : json['genderAr'] as String,
        genderFr: json['genderFr'] == null ? null : json['genderFr'] as String,
        mobile: json['mobile'] == null ? null : json['mobile'] as String,
        whatsapp: json['whatsapp'] == null ? null : json['whatsapp'] as String,
        tel1: json['tel1'] == null ? null : json['tel1'] as String,
        email: json['email'] == null ? null : json['email'] as String,
        areaId: json['areaId'] == null ? null : json['areaId'] as int,
        areaEn: json['areaEn'] == null ? null : json['areaEn'] as String,
        areaAr: json['areaAr'] == null ? null : json['areaAr'] as String,
        areaFr: json['areaFr'] == null ? null : json['areaFr'] as String,
        cityId: json['cityId'] == null ? null : json['cityId'] as int,
        cityEn: json['cityEn'] == null ? null : json['cityEn'] as String,
        cityAr: json['cityAr'] == null ? null : json['cityAr'] as String,
        cityFr: json['cityFr'] == null ? null : json['cityFr'] as String,
        provinceId: json['provinceId'] == null ? null : json['provinceId'] as int,
        provinceEn: json['provinceEn'] == null ? null : json['provinceEn'] as String,
        provinceAr: json['provinceAr'] == null ? null : json['provinceAr'] as String,
        provinceFr: json['provinceFr'] == null ? null : json['provinceFr'] as String,
        countryId: json['countryId'] == null ? null : json['countryId'] as int,
        countryEn: json['countryEn'] == null ? null : json['countryEn'] as String,
        countryAr: json['countryAr'] == null ? null : json['countryAr'] as String,
        countryFr: json['countryFr'] == null ? null : json['countryFr'] as String,
        lattitude: json['lattitude'] == null ? null : json['lattitude'] as int,
        longitude: json['longitude'] == null ? null : json['longitude'] as int,
        address: json['address'] == null ? null : json['address'] as String,
        googleAddress: json['googleAddress'] == null ? null : json['googleAddress'] as String,
        isEmailVerified: json['isEmailVerified'] == null ? null : json['isEmailVerified'] as bool,
        appMobileVerified: json['appMobileVerified'] == null ? null : json['appMobileVerified'] as bool,
        webMobileVerified: json['webMobileVerified'] == null ? null : json['webMobileVerified'] as bool,
        teamUserId: json['teamUserId'] == null ? null : json['teamUserId'] as int,
        currentPackageDetail: json['currentPackageDetail'] == null ? null : CurrentPackageDetail.fromJson(json['currentPackageDetail'] as Map<String, Object?>));
  }

  @override
  String toString() {
    return '''SignIn(
                isRegistered:$isRegistered,
isRegisteredBySalesTeam:$isRegisteredBySalesTeam,
companyLogo:$companyLogo,
isFreeLancer:$isFreeLancer,
companyId:$companyId,
businessServiceId:$businessServiceId,
companyNumber:$companyNumber,
companyNameEn:$companyNameEn,
companyNameAr:$companyNameAr,
genderId:$genderId,
genderEn:$genderEn,
genderAr:$genderAr,
genderFr:$genderFr,
mobile:$mobile,
whatsapp:$whatsapp,
tel1:$tel1,
email:$email,
areaId:$areaId,
areaEn:$areaEn,
areaAr:$areaAr,
areaFr:$areaFr,
cityId:$cityId,
cityEn:$cityEn,
cityAr:$cityAr,
cityFr:$cityFr,
provinceId:$provinceId,
provinceEn:$provinceEn,
provinceAr:$provinceAr,
provinceFr:$provinceFr,
countryId:$countryId,
countryEn:$countryEn,
countryAr:$countryAr,
countryFr:$countryFr,
lattitude:$lattitude,
longitude:$longitude,
address:$address,
googleAddress:$googleAddress,
isEmailVerified:$isEmailVerified,
appMobileVerified:$appMobileVerified,
webMobileVerified:$webMobileVerified,
teamUserId:$teamUserId,
currentPackageDetail:${currentPackageDetail.toString()}
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is SignIn &&
        other.runtimeType == runtimeType &&
        other.isRegistered == isRegistered &&
        other.isRegisteredBySalesTeam == isRegisteredBySalesTeam &&
        other.companyLogo == companyLogo &&
        other.isFreeLancer == isFreeLancer &&
        other.companyId == companyId &&
        other.businessServiceId == businessServiceId &&
        other.companyNumber == companyNumber &&
        other.companyNameEn == companyNameEn &&
        other.companyNameAr == companyNameAr &&
        other.genderId == genderId &&
        other.genderEn == genderEn &&
        other.genderAr == genderAr &&
        other.genderFr == genderFr &&
        other.mobile == mobile &&
        other.whatsapp == whatsapp &&
        other.tel1 == tel1 &&
        other.email == email &&
        other.areaId == areaId &&
        other.areaEn == areaEn &&
        other.areaAr == areaAr &&
        other.areaFr == areaFr &&
        other.cityId == cityId &&
        other.cityEn == cityEn &&
        other.cityAr == cityAr &&
        other.cityFr == cityFr &&
        other.provinceId == provinceId &&
        other.provinceEn == provinceEn &&
        other.provinceAr == provinceAr &&
        other.provinceFr == provinceFr &&
        other.countryId == countryId &&
        other.countryEn == countryEn &&
        other.countryAr == countryAr &&
        other.countryFr == countryFr &&
        other.lattitude == lattitude &&
        other.longitude == longitude &&
        other.address == address &&
        other.googleAddress == googleAddress &&
        other.isEmailVerified == isEmailVerified &&
        other.appMobileVerified == appMobileVerified &&
        other.webMobileVerified == webMobileVerified &&
        other.teamUserId == teamUserId &&
        other.currentPackageDetail == currentPackageDetail;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, isRegistered, isRegisteredBySalesTeam, companyLogo, isFreeLancer, companyId, businessServiceId, companyNumber, companyNameEn, companyNameAr, genderId, genderEn,
        genderAr, genderFr, mobile, whatsapp, tel1, email, areaId, areaEn);
  }
}

class CurrentPackageDetail {
  final int? packageId;
  final int? countryId;
  final String? nameAr;
  final String? nameFr;
  final String? nameEn;
  final String? remarkEn;
  final String? remarkAr;
  final String? remarkFr;
  final String? effectiveDate;
  final String? expiryDate;
  final int? packagePrice;
  final String? currencyAsymbol;
  final String? currencyEsymbol;
  final String? currencyShortSymbol;
  final int? mediaGallerySize;
  final bool? isActive;
  final bool? isPaid;
  const CurrentPackageDetail(
      {this.packageId,
      this.countryId,
      this.nameAr,
      this.nameFr,
      this.nameEn,
      this.remarkEn,
      this.remarkAr,
      this.remarkFr,
      this.effectiveDate,
      this.expiryDate,
      this.packagePrice,
      this.currencyAsymbol,
      this.currencyEsymbol,
      this.currencyShortSymbol,
      this.mediaGallerySize,
      this.isActive,
      this.isPaid});
  CurrentPackageDetail copyWith(
      {int? packageId,
      int? countryId,
      String? nameAr,
      String? nameFr,
      String? nameEn,
      String? remarkEn,
      String? remarkAr,
      String? remarkFr,
      String? effectiveDate,
      String? expiryDate,
      int? packagePrice,
      String? currencyAsymbol,
      String? currencyEsymbol,
      String? currencyShortSymbol,
      int? mediaGallerySize,
      bool? isActive,
      bool? isPaid}) {
    return CurrentPackageDetail(
        packageId: packageId ?? this.packageId,
        countryId: countryId ?? this.countryId,
        nameAr: nameAr ?? this.nameAr,
        nameFr: nameFr ?? this.nameFr,
        nameEn: nameEn ?? this.nameEn,
        remarkEn: remarkEn ?? this.remarkEn,
        remarkAr: remarkAr ?? this.remarkAr,
        remarkFr: remarkFr ?? this.remarkFr,
        effectiveDate: effectiveDate ?? this.effectiveDate,
        expiryDate: expiryDate ?? this.expiryDate,
        packagePrice: packagePrice ?? this.packagePrice,
        currencyAsymbol: currencyAsymbol ?? this.currencyAsymbol,
        currencyEsymbol: currencyEsymbol ?? this.currencyEsymbol,
        currencyShortSymbol: currencyShortSymbol ?? this.currencyShortSymbol,
        mediaGallerySize: mediaGallerySize ?? this.mediaGallerySize,
        isActive: isActive ?? this.isActive,
        isPaid: isPaid ?? this.isPaid);
  }

  Map<String, Object?> toJson() {
    return {
      'packageId': packageId,
      'countryId': countryId,
      'nameAr': nameAr,
      'nameFr': nameFr,
      'nameEn': nameEn,
      'remarkEn': remarkEn,
      'remarkAr': remarkAr,
      'remarkFr': remarkFr,
      'effectiveDate': effectiveDate,
      'expiryDate': expiryDate,
      'packagePrice': packagePrice,
      'currencyAsymbol': currencyAsymbol,
      'currencyEsymbol': currencyEsymbol,
      'currencyShortSymbol': currencyShortSymbol,
      'mediaGallerySize': mediaGallerySize,
      'isActive': isActive,
      'isPaid': isPaid
    };
  }

  static CurrentPackageDetail fromJson(Map<String, Object?> json) {
    return CurrentPackageDetail(
        packageId: json['packageId'] == null ? null : json['packageId'] as int,
        countryId: json['countryId'] == null ? null : json['countryId'] as int,
        nameAr: json['nameAr'] == null ? null : json['nameAr'] as String,
        nameFr: json['nameFr'] == null ? null : json['nameFr'] as String,
        nameEn: json['nameEn'] == null ? null : json['nameEn'] as String,
        remarkEn: json['remarkEn'] == null ? null : json['remarkEn'] as String,
        remarkAr: json['remarkAr'] == null ? null : json['remarkAr'] as String,
        remarkFr: json['remarkFr'] == null ? null : json['remarkFr'] as String,
        effectiveDate: json['effectiveDate'] == null ? null : json['effectiveDate'] as String,
        expiryDate: json['expiryDate'] == null ? null : json['expiryDate'] as String,
        packagePrice: json['packagePrice'] == null ? null : json['packagePrice'] as int,
        currencyAsymbol: json['currencyAsymbol'] == null ? null : json['currencyAsymbol'] as String,
        currencyEsymbol: json['currencyEsymbol'] == null ? null : json['currencyEsymbol'] as String,
        currencyShortSymbol: json['currencyShortSymbol'] == null ? null : json['currencyShortSymbol'] as String,
        mediaGallerySize: json['mediaGallerySize'] == null ? null : json['mediaGallerySize'] as int,
        isActive: json['isActive'] == null ? null : json['isActive'] as bool,
        isPaid: json['isPaid'] == null ? null : json['isPaid'] as bool);
  }

  @override
  String toString() {
    return '''CurrentPackageDetail(
                packageId:$packageId,
countryId:$countryId,
nameAr:$nameAr,
nameFr:$nameFr,
nameEn:$nameEn,
remarkEn:$remarkEn,
remarkAr:$remarkAr,
remarkFr:$remarkFr,
effectiveDate:$effectiveDate,
expiryDate:$expiryDate,
packagePrice:$packagePrice,
currencyAsymbol:$currencyAsymbol,
currencyEsymbol:$currencyEsymbol,
currencyShortSymbol:$currencyShortSymbol,
mediaGallerySize:$mediaGallerySize,
isActive:$isActive,
isPaid:$isPaid
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is CurrentPackageDetail &&
        other.runtimeType == runtimeType &&
        other.packageId == packageId &&
        other.countryId == countryId &&
        other.nameAr == nameAr &&
        other.nameFr == nameFr &&
        other.nameEn == nameEn &&
        other.remarkEn == remarkEn &&
        other.remarkAr == remarkAr &&
        other.remarkFr == remarkFr &&
        other.effectiveDate == effectiveDate &&
        other.expiryDate == expiryDate &&
        other.packagePrice == packagePrice &&
        other.currencyAsymbol == currencyAsymbol &&
        other.currencyEsymbol == currencyEsymbol &&
        other.currencyShortSymbol == currencyShortSymbol &&
        other.mediaGallerySize == mediaGallerySize &&
        other.isActive == isActive &&
        other.isPaid == isPaid;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, packageId, countryId, nameAr, nameFr, nameEn, remarkEn, remarkAr, remarkFr, effectiveDate, expiryDate, packagePrice, currencyAsymbol, currencyEsymbol,
        currencyShortSymbol, mediaGallerySize, isActive, isPaid);
  }
}

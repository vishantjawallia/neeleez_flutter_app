class UserData {
  final bool? isRegistered;
  final bool? isRegisteredBySalesTeam;
  final dynamic companyLogo;
  final bool? isFreeLancer;
  final double? companyId;
  final int? businessServiceId;
  final String? companyNameEn;
  final dynamic companyNameAr;
  final String? mobile;
  final String? whatsApp;
  final String? tel1;
  final String? email;
  final double? lattitude;
  final double? longitude;
  final String? address;
  final int? countryId;
  final int? cityId;
  final int? areaId;
  final bool? isEmailVerified;
  final String? googleAddress;
  final int? teamUserId;
  final int? salesTeamId;
  final String? registrationDate;
  final bool? isDeactivated;
  final bool? isDeleted;
  final dynamic companyDeletionHistory;
  final int? packageId;
  final bool? isPaid;
  const UserData(
      {this.isRegistered,
      this.isRegisteredBySalesTeam,
      this.companyLogo,
      this.isFreeLancer,
      this.companyId,
      this.businessServiceId,
      this.companyNameEn,
      this.companyNameAr,
      this.mobile,
      this.whatsApp,
      this.tel1,
      this.email,
      this.lattitude,
      this.longitude,
      this.address,
      this.countryId,
      this.cityId,
      this.areaId,
      this.isEmailVerified,
      this.googleAddress,
      this.teamUserId,
      this.salesTeamId,
      this.registrationDate,
      this.isDeactivated,
      this.isDeleted,
      this.companyDeletionHistory,
      this.packageId,
      this.isPaid});
  UserData copyWith(
      {bool? isRegistered,
      bool? isRegisteredBySalesTeam,
      dynamic? companyLogo,
      bool? isFreeLancer,
      double? companyId,
      int? businessServiceId,
      String? companyNameEn,
      dynamic? companyNameAr,
      String? mobile,
      String? whatsApp,
      String? tel1,
      String? email,
      double? lattitude,
      double? longitude,
      String? address,
      int? countryId,
      int? cityId,
      int? areaId,
      bool? isEmailVerified,
      String? googleAddress,
      int? teamUserId,
      int? salesTeamId,
      String? registrationDate,
      bool? isDeactivated,
      bool? isDeleted,
      dynamic? companyDeletionHistory,
      int? packageId,
      bool? isPaid}) {
    return UserData(
        isRegistered: isRegistered ?? this.isRegistered,
        isRegisteredBySalesTeam: isRegisteredBySalesTeam ?? this.isRegisteredBySalesTeam,
        companyLogo: companyLogo ?? this.companyLogo,
        isFreeLancer: isFreeLancer ?? this.isFreeLancer,
        companyId: companyId ?? this.companyId,
        businessServiceId: businessServiceId ?? this.businessServiceId,
        companyNameEn: companyNameEn ?? this.companyNameEn,
        companyNameAr: companyNameAr ?? this.companyNameAr,
        mobile: mobile ?? this.mobile,
        whatsApp: whatsApp ?? this.whatsApp,
        tel1: tel1 ?? this.tel1,
        email: email ?? this.email,
        lattitude: lattitude ?? this.lattitude,
        longitude: longitude ?? this.longitude,
        address: address ?? this.address,
        countryId: countryId ?? this.countryId,
        cityId: cityId ?? this.cityId,
        areaId: areaId ?? this.areaId,
        isEmailVerified: isEmailVerified ?? this.isEmailVerified,
        googleAddress: googleAddress ?? this.googleAddress,
        teamUserId: teamUserId ?? this.teamUserId,
        salesTeamId: salesTeamId ?? this.salesTeamId,
        registrationDate: registrationDate ?? this.registrationDate,
        isDeactivated: isDeactivated ?? this.isDeactivated,
        isDeleted: isDeleted ?? this.isDeleted,
        companyDeletionHistory: companyDeletionHistory ?? this.companyDeletionHistory,
        packageId: packageId ?? this.packageId,
        isPaid: isPaid ?? this.isPaid);
  }

  Map<String, Object?> toJson() {
    return {
      'isRegistered': isRegistered,
      'isRegisteredBySalesTeam': isRegisteredBySalesTeam,
      'companyLogo': companyLogo,
      'isFreeLancer': isFreeLancer,
      'companyId': companyId,
      'businessServiceId': businessServiceId,
      'companyNameEn': companyNameEn,
      'companyNameAr': companyNameAr,
      'mobile': mobile,
      'whatsApp': whatsApp,
      'tel1': tel1,
      'email': email,
      'lattitude': lattitude,
      'longitude': longitude,
      'address': address,
      'countryId': countryId,
      'cityId': cityId,
      'areaId': areaId,
      'isEmailVerified': isEmailVerified,
      'googleAddress': googleAddress,
      'teamUserId': teamUserId,
      'salesTeamId': salesTeamId,
      'registrationDate': registrationDate,
      'isDeactivated': isDeactivated,
      'isDeleted': isDeleted,
      'companyDeletionHistory': companyDeletionHistory,
      'packageId': packageId,
      'isPaid': isPaid
    };
  }

  static UserData fromJson(Map<String, Object?> json) {
    return UserData(
        isRegistered: json['isRegistered'] == null ? null : json['isRegistered'] as bool,
        isRegisteredBySalesTeam: json['isRegisteredBySalesTeam'] == null ? null : json['isRegisteredBySalesTeam'] as bool,
        companyLogo: json['companyLogo'] as dynamic,
        isFreeLancer: json['isFreeLancer'] == null ? null : json['isFreeLancer'] as bool,
        companyId: json['companyId'] == null ? null : json['companyId'] as double,
        businessServiceId: json['businessServiceId'] == null ? null : json['businessServiceId'] as int,
        companyNameEn: json['companyNameEn'] == null ? null : json['companyNameEn'] as String,
        companyNameAr: json['companyNameAr'] as dynamic,
        mobile: json['mobile'] == null ? null : json['mobile'] as String,
        whatsApp: json['whatsApp'] == null ? null : json['whatsApp'] as String,
        tel1: json['tel1'] == null ? null : json['tel1'] as String,
        email: json['email'] == null ? null : json['email'] as String,
        lattitude: json['lattitude'] == null ? null : json['lattitude'] as double,
        longitude: json['longitude'] == null ? null : json['longitude'] as double,
        address: json['address'] == null ? null : json['address'] as String,
        countryId: json['countryId'] == null ? null : json['countryId'] as int,
        cityId: json['cityId'] == null ? null : json['cityId'] as int,
        areaId: json['areaId'] == null ? null : json['areaId'] as int,
        isEmailVerified: json['isEmailVerified'] == null ? null : json['isEmailVerified'] as bool,
        googleAddress: json['googleAddress'] == null ? null : json['googleAddress'] as String,
        teamUserId: json['teamUserId'] == null ? null : json['teamUserId'] as int,
        salesTeamId: json['salesTeamId'] == null ? null : json['salesTeamId'] as int,
        registrationDate: json['registrationDate'] == null ? null : json['registrationDate'] as String,
        isDeactivated: json['isDeactivated'] == null ? null : json['isDeactivated'] as bool,
        isDeleted: json['isDeleted'] == null ? null : json['isDeleted'] as bool,
        companyDeletionHistory: json['companyDeletionHistory'] as dynamic,
        packageId: json['packageId'] == null ? null : json['packageId'] as int,
        isPaid: json['isPaid'] == null ? null : json['isPaid'] as bool);
  }

  @override
  String toString() {
    return '''UserData(
                isRegistered:$isRegistered,
isRegisteredBySalesTeam:$isRegisteredBySalesTeam,
companyLogo:$companyLogo,
isFreeLancer:$isFreeLancer,
companyId:$companyId,
businessServiceId:$businessServiceId,
companyNameEn:$companyNameEn,
companyNameAr:$companyNameAr,
mobile:$mobile,
whatsApp:$whatsApp,
tel1:$tel1,
email:$email,
lattitude:$lattitude,
longitude:$longitude,
address:$address,
countryId:$countryId,
cityId:$cityId,
areaId:$areaId,
isEmailVerified:$isEmailVerified,
googleAddress:$googleAddress,
teamUserId:$teamUserId,
salesTeamId:$salesTeamId,
registrationDate:$registrationDate,
isDeactivated:$isDeactivated,
isDeleted:$isDeleted,
companyDeletionHistory:$companyDeletionHistory,
packageId:$packageId,
isPaid:$isPaid
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is UserData &&
        other.runtimeType == runtimeType &&
        other.isRegistered == isRegistered &&
        other.isRegisteredBySalesTeam == isRegisteredBySalesTeam &&
        other.companyLogo == companyLogo &&
        other.isFreeLancer == isFreeLancer &&
        other.companyId == companyId &&
        other.businessServiceId == businessServiceId &&
        other.companyNameEn == companyNameEn &&
        other.companyNameAr == companyNameAr &&
        other.mobile == mobile &&
        other.whatsApp == whatsApp &&
        other.tel1 == tel1 &&
        other.email == email &&
        other.lattitude == lattitude &&
        other.longitude == longitude &&
        other.address == address &&
        other.countryId == countryId &&
        other.cityId == cityId &&
        other.areaId == areaId &&
        other.isEmailVerified == isEmailVerified &&
        other.googleAddress == googleAddress &&
        other.teamUserId == teamUserId &&
        other.salesTeamId == salesTeamId &&
        other.registrationDate == registrationDate &&
        other.isDeactivated == isDeactivated &&
        other.isDeleted == isDeleted &&
        other.companyDeletionHistory == companyDeletionHistory &&
        other.packageId == packageId &&
        other.isPaid == isPaid;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, isRegistered, isRegisteredBySalesTeam, companyLogo, isFreeLancer, companyId, businessServiceId, companyNameEn, companyNameAr, mobile, whatsApp, tel1, email,
        lattitude, longitude, address, countryId, cityId, areaId, isEmailVerified);
  }
}

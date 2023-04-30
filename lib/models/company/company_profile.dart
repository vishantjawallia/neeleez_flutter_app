class CompanyProfile {
  final int? id;
  final double? distance;
  final int? reviews;
  final double? rating;
  final bool? isPromoAvailable;
  final CompanyInfo? companyInfo;
  final CompanyAddress? companyAddress;
  final CompanySocialMedia? companySocialMedia;
  final CompanyContact? companyContact;
  final CompanyPackage? companyPackage;
  final List<dynamic>? serviceTypes;
  final List<Amenities>? amenities;
  final List<CompanyTiming>? companyTiming;
  final List<CompanyImages>? companyImages;
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
      double? rating,
      bool? isPromoAvailable,
      CompanyInfo? companyInfo,
      CompanyAddress? companyAddress,
      CompanySocialMedia? companySocialMedia,
      CompanyContact? companyContact,
      CompanyPackage? companyPackage,
      List<dynamic>? serviceTypes,
      List<Amenities>? amenities,
      List<CompanyTiming>? companyTiming,
      List<CompanyImages>? companyImages}) {
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
      'companyContact': companyContact?.toJson(),
      'companyPackage': companyPackage?.toJson(),
      'serviceTypes': serviceTypes,
      'amenities': amenities?.map<Map<String, dynamic>>((data) => data.toJson()).toList(),
      'companyTiming': companyTiming?.map<Map<String, dynamic>>((data) => data.toJson()).toList(),
      'companyImages': companyImages?.map<Map<String, dynamic>>((data) => data.toJson()).toList()
    };
  }

  static CompanyProfile fromJson(Map<String, Object?> json) {
    return CompanyProfile(
        id: json['id'] == null ? null : json['id'] as int,
        distance: json['distance'] == null ? null : json['distance'] as double,
        reviews: json['reviews'] == null ? null : json['reviews'] as int,
        rating: json['rating'] == null ? null : json['rating'] as double,
        isPromoAvailable: json['isPromoAvailable'] == null ? null : json['isPromoAvailable'] as bool,
        companyInfo: json['companyInfo'] == null ? null : CompanyInfo.fromJson(json['companyInfo'] as Map<String, Object?>),
        companyAddress: json['companyAddress'] == null ? null : CompanyAddress.fromJson(json['companyAddress'] as Map<String, Object?>),
        companySocialMedia: json['companySocialMedia'] == null ? null : CompanySocialMedia.fromJson(json['companySocialMedia'] as Map<String, Object?>),
        companyContact: json['companyContact'] == null ? null : CompanyContact.fromJson(json['companyContact'] as Map<String, Object?>),
        companyPackage: json['companyPackage'] == null ? null : CompanyPackage.fromJson(json['companyPackage'] as Map<String, Object?>),
        serviceTypes: json['serviceTypes'] == null ? null : json['serviceTypes'] as List<dynamic>,
        amenities: json['amenities'] == null ? null : (json['amenities'] as List).map<Amenities>((data) => Amenities.fromJson(data as Map<String, Object?>)).toList(),
        companyTiming: json['companyTiming'] == null ? null : (json['companyTiming'] as List).map<CompanyTiming>((data) => CompanyTiming.fromJson(data as Map<String, Object?>)).toList(),
        companyImages: json['companyImages'] == null ? null : (json['companyImages'] as List).map<CompanyImages>((data) => CompanyImages.fromJson(data as Map<String, Object?>)).toList());
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
companyContact:${companyContact.toString()},
companyPackage:${companyPackage.toString()},
serviceTypes:$serviceTypes,
amenities:${amenities.toString()},
companyTiming:${companyTiming.toString()},
companyImages:${companyImages.toString()}
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

class CompanyImages {
  final int? imageId;
  final String? image;
  final String? imageCategory;
  final dynamic imageCategoryAr;
  final int? imageCategoryId;
  final bool? isMainImage;
  final bool? isProfile;
  final bool? isTimeline;
  final bool? isFeatured;
  final bool? isGallery;
  final bool? isOffer;
  final int? priority;
  final int? size;
  final String? stateDate;
  const CompanyImages(
      {this.imageId,
      this.image,
      this.imageCategory,
      this.imageCategoryAr,
      this.imageCategoryId,
      this.isMainImage,
      this.isProfile,
      this.isTimeline,
      this.isFeatured,
      this.isGallery,
      this.isOffer,
      this.priority,
      this.size,
      this.stateDate});
  CompanyImages copyWith(
      {int? imageId,
      String? image,
      String? imageCategory,
      dynamic? imageCategoryAr,
      int? imageCategoryId,
      bool? isMainImage,
      bool? isProfile,
      bool? isTimeline,
      bool? isFeatured,
      bool? isGallery,
      bool? isOffer,
      int? priority,
      int? size,
      String? stateDate}) {
    return CompanyImages(
        imageId: imageId ?? this.imageId,
        image: image ?? this.image,
        imageCategory: imageCategory ?? this.imageCategory,
        imageCategoryAr: imageCategoryAr ?? this.imageCategoryAr,
        imageCategoryId: imageCategoryId ?? this.imageCategoryId,
        isMainImage: isMainImage ?? this.isMainImage,
        isProfile: isProfile ?? this.isProfile,
        isTimeline: isTimeline ?? this.isTimeline,
        isFeatured: isFeatured ?? this.isFeatured,
        isGallery: isGallery ?? this.isGallery,
        isOffer: isOffer ?? this.isOffer,
        priority: priority ?? this.priority,
        size: size ?? this.size,
        stateDate: stateDate ?? this.stateDate);
  }

  Map<String, Object?> toJson() {
    return {
      'imageId': imageId,
      'image': image,
      'imageCategory': imageCategory,
      'imageCategoryAr': imageCategoryAr,
      'imageCategoryId': imageCategoryId,
      'isMainImage': isMainImage,
      'isProfile': isProfile,
      'isTimeline': isTimeline,
      'isFeatured': isFeatured,
      'isGallery': isGallery,
      'isOffer': isOffer,
      'priority': priority,
      'size': size,
      'stateDate': stateDate
    };
  }

  static CompanyImages fromJson(Map<String, Object?> json) {
    return CompanyImages(
        imageId: json['imageId'] == null ? null : json['imageId'] as int,
        image: json['image'] == null ? null : json['image'] as String,
        imageCategory: json['imageCategory'] == null ? null : json['imageCategory'] as String,
        imageCategoryAr: json['imageCategoryAr'] as dynamic,
        imageCategoryId: json['imageCategoryId'] == null ? null : json['imageCategoryId'] as int,
        isMainImage: json['isMainImage'] == null ? null : json['isMainImage'] as bool,
        isProfile: json['isProfile'] == null ? null : json['isProfile'] as bool,
        isTimeline: json['isTimeline'] == null ? null : json['isTimeline'] as bool,
        isFeatured: json['isFeatured'] == null ? null : json['isFeatured'] as bool,
        isGallery: json['isGallery'] == null ? null : json['isGallery'] as bool,
        isOffer: json['isOffer'] == null ? null : json['isOffer'] as bool,
        priority: json['priority'] == null ? null : json['priority'] as int,
        size: json['size'] == null ? null : json['size'] as int,
        stateDate: json['stateDate'] == null ? null : json['stateDate'] as String);
  }

  @override
  String toString() {
    return '''CompanyImages(
                imageId:$imageId,
image:$image,
imageCategory:$imageCategory,
imageCategoryAr:$imageCategoryAr,
imageCategoryId:$imageCategoryId,
isMainImage:$isMainImage,
isProfile:$isProfile,
isTimeline:$isTimeline,
isFeatured:$isFeatured,
isGallery:$isGallery,
isOffer:$isOffer,
priority:$priority,
size:$size,
stateDate:$stateDate
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is CompanyImages &&
        other.runtimeType == runtimeType &&
        other.imageId == imageId &&
        other.image == image &&
        other.imageCategory == imageCategory &&
        other.imageCategoryAr == imageCategoryAr &&
        other.imageCategoryId == imageCategoryId &&
        other.isMainImage == isMainImage &&
        other.isProfile == isProfile &&
        other.isTimeline == isTimeline &&
        other.isFeatured == isFeatured &&
        other.isGallery == isGallery &&
        other.isOffer == isOffer &&
        other.priority == priority &&
        other.size == size &&
        other.stateDate == stateDate;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, imageId, image, imageCategory, imageCategoryAr, imageCategoryId, isMainImage, isProfile, isTimeline, isFeatured, isGallery, isOffer, priority, size, stateDate);
  }
}

class CompanyTiming {
  final int? id;
  final int? companyId;
  final int? dowId;
  final String? dowShort;
  final String? dow;
  final bool? isHoliday;
  final bool? isOpen24Hours;
  final List<CompanyTimes>? companyTimes;
  const CompanyTiming({this.id, this.companyId, this.dowId, this.dowShort, this.dow, this.isHoliday, this.isOpen24Hours, this.companyTimes});
  CompanyTiming copyWith({int? id, int? companyId, int? dowId, String? dowShort, String? dow, bool? isHoliday, bool? isOpen24Hours, List<CompanyTimes>? companyTimes}) {
    return CompanyTiming(
        id: id ?? this.id,
        companyId: companyId ?? this.companyId,
        dowId: dowId ?? this.dowId,
        dowShort: dowShort ?? this.dowShort,
        dow: dow ?? this.dow,
        isHoliday: isHoliday ?? this.isHoliday,
        isOpen24Hours: isOpen24Hours ?? this.isOpen24Hours,
        companyTimes: companyTimes ?? this.companyTimes);
  }

  Map<String, Object?> toJson() {
    return {
      'id': id,
      'companyId': companyId,
      'dowId': dowId,
      'dowShort': dowShort,
      'dow': dow,
      'isHoliday': isHoliday,
      'isOpen24Hours': isOpen24Hours,
      'companyTimes': companyTimes?.map<Map<String, dynamic>>((data) => data.toJson()).toList()
    };
  }

  static CompanyTiming fromJson(Map<String, Object?> json) {
    return CompanyTiming(
        id: json['id'] == null ? null : json['id'] as int,
        companyId: json['companyId'] == null ? null : json['companyId'] as int,
        dowId: json['dowId'] == null ? null : json['dowId'] as int,
        dowShort: json['dowShort'] == null ? null : json['dowShort'] as String,
        dow: json['dow'] == null ? null : json['dow'] as String,
        isHoliday: json['isHoliday'] == null ? null : json['isHoliday'] as bool,
        isOpen24Hours: json['isOpen24Hours'] == null ? null : json['isOpen24Hours'] as bool,
        companyTimes: json['companyTimes'] == null ? null : (json['companyTimes'] as List).map<CompanyTimes>((data) => CompanyTimes.fromJson(data as Map<String, Object?>)).toList());
  }

  @override
  String toString() {
    return '''CompanyTiming(
                id:$id,
companyId:$companyId,
dowId:$dowId,
dowShort:$dowShort,
dow:$dow,
isHoliday:$isHoliday,
isOpen24Hours:$isOpen24Hours,
companyTimes:${companyTimes.toString()}
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is CompanyTiming &&
        other.runtimeType == runtimeType &&
        other.id == id &&
        other.companyId == companyId &&
        other.dowId == dowId &&
        other.dowShort == dowShort &&
        other.dow == dow &&
        other.isHoliday == isHoliday &&
        other.isOpen24Hours == isOpen24Hours &&
        other.companyTimes == companyTimes;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, id, companyId, dowId, dowShort, dow, isHoliday, isOpen24Hours, companyTimes);
  }
}

class CompanyTimes {
  final int? id;
  final int? companyTimingId;
  final int? companyId;
  final int? startHour;
  final int? startMinute;
  final int? endHour;
  final int? endMinute;
  const CompanyTimes({this.id, this.companyTimingId, this.companyId, this.startHour, this.startMinute, this.endHour, this.endMinute});
  CompanyTimes copyWith({int? id, int? companyTimingId, int? companyId, int? startHour, int? startMinute, int? endHour, int? endMinute}) {
    return CompanyTimes(
        id: id ?? this.id,
        companyTimingId: companyTimingId ?? this.companyTimingId,
        companyId: companyId ?? this.companyId,
        startHour: startHour ?? this.startHour,
        startMinute: startMinute ?? this.startMinute,
        endHour: endHour ?? this.endHour,
        endMinute: endMinute ?? this.endMinute);
  }

  Map<String, Object?> toJson() {
    return {'id': id, 'companyTimingId': companyTimingId, 'companyId': companyId, 'startHour': startHour, 'startMinute': startMinute, 'endHour': endHour, 'endMinute': endMinute};
  }

  static CompanyTimes fromJson(Map<String, Object?> json) {
    return CompanyTimes(
        id: json['id'] == null ? null : json['id'] as int,
        companyTimingId: json['companyTimingId'] == null ? null : json['companyTimingId'] as int,
        companyId: json['companyId'] == null ? null : json['companyId'] as int,
        startHour: json['startHour'] == null ? null : json['startHour'] as int,
        startMinute: json['startMinute'] == null ? null : json['startMinute'] as int,
        endHour: json['endHour'] == null ? null : json['endHour'] as int,
        endMinute: json['endMinute'] == null ? null : json['endMinute'] as int);
  }

  @override
  String toString() {
    return '''CompanyTimes(
                id:$id,
companyTimingId:$companyTimingId,
companyId:$companyId,
startHour:$startHour,
startMinute:$startMinute,
endHour:$endHour,
endMinute:$endMinute
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is CompanyTimes &&
        other.runtimeType == runtimeType &&
        other.id == id &&
        other.companyTimingId == companyTimingId &&
        other.companyId == companyId &&
        other.startHour == startHour &&
        other.startMinute == startMinute &&
        other.endHour == endHour &&
        other.endMinute == endMinute;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, id, companyTimingId, companyId, startHour, startMinute, endHour, endMinute);
  }
}

class Amenities {
  final int? id;
  final String? amenityNameEn;
  final String? amenityNameAr;
  final String? amenityNameFr;
  final String? iconImage;
  final int? userId;
  final dynamic isActive;
  final dynamic stateDate;
  const Amenities({this.id, this.amenityNameEn, this.amenityNameAr, this.amenityNameFr, this.iconImage, this.userId, this.isActive, this.stateDate});
  Amenities copyWith({int? id, String? amenityNameEn, String? amenityNameAr, String? amenityNameFr, String? iconImage, int? userId, dynamic? isActive, dynamic? stateDate}) {
    return Amenities(
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

  static Amenities fromJson(Map<String, Object?> json) {
    return Amenities(
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
    return '''Amenities(
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
    return other is Amenities &&
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

class CompanyPackage {
  final int? packageId;
  final int? countryId;
  final String? packageNameEn;
  final String? packageNameAr;
  final String? packageNameFr;
  final String? remarkEn;
  final String? remarkAr;
  final String? remarkFr;
  final String? effectiveDateTime;
  final String? expiryDateTime;
  final double? packagePrice;
  final String? currencyAsymbol;
  final String? currencyEsymbol;
  final String? currencyShortSymbol;
  const CompanyPackage(
      {this.packageId,
      this.countryId,
      this.packageNameEn,
      this.packageNameAr,
      this.packageNameFr,
      this.remarkEn,
      this.remarkAr,
      this.remarkFr,
      this.effectiveDateTime,
      this.expiryDateTime,
      this.packagePrice,
      this.currencyAsymbol,
      this.currencyEsymbol,
      this.currencyShortSymbol});
  CompanyPackage copyWith(
      {int? packageId,
      int? countryId,
      String? packageNameEn,
      String? packageNameAr,
      String? packageNameFr,
      String? remarkEn,
      String? remarkAr,
      String? remarkFr,
      String? effectiveDateTime,
      String? expiryDateTime,
      double? packagePrice,
      String? currencyAsymbol,
      String? currencyEsymbol,
      String? currencyShortSymbol}) {
    return CompanyPackage(
        packageId: packageId ?? this.packageId,
        countryId: countryId ?? this.countryId,
        packageNameEn: packageNameEn ?? this.packageNameEn,
        packageNameAr: packageNameAr ?? this.packageNameAr,
        packageNameFr: packageNameFr ?? this.packageNameFr,
        remarkEn: remarkEn ?? this.remarkEn,
        remarkAr: remarkAr ?? this.remarkAr,
        remarkFr: remarkFr ?? this.remarkFr,
        effectiveDateTime: effectiveDateTime ?? this.effectiveDateTime,
        expiryDateTime: expiryDateTime ?? this.expiryDateTime,
        packagePrice: packagePrice ?? this.packagePrice,
        currencyAsymbol: currencyAsymbol ?? this.currencyAsymbol,
        currencyEsymbol: currencyEsymbol ?? this.currencyEsymbol,
        currencyShortSymbol: currencyShortSymbol ?? this.currencyShortSymbol);
  }

  Map<String, Object?> toJson() {
    return {
      'packageId': packageId,
      'countryId': countryId,
      'packageNameEn': packageNameEn,
      'packageNameAr': packageNameAr,
      'packageNameFr': packageNameFr,
      'remarkEn': remarkEn,
      'remarkAr': remarkAr,
      'remarkFr': remarkFr,
      'effectiveDateTime': effectiveDateTime,
      'expiryDateTime': expiryDateTime,
      'packagePrice': packagePrice,
      'currencyAsymbol': currencyAsymbol,
      'currencyEsymbol': currencyEsymbol,
      'currencyShortSymbol': currencyShortSymbol
    };
  }

  static CompanyPackage fromJson(Map<String, Object?> json) {
    return CompanyPackage(
        packageId: json['packageId'] == null ? null : json['packageId'] as int,
        countryId: json['countryId'] == null ? null : json['countryId'] as int,
        packageNameEn: json['packageNameEn'] == null ? null : json['packageNameEn'] as String,
        packageNameAr: json['packageNameAr'] == null ? null : json['packageNameAr'] as String,
        packageNameFr: json['packageNameFr'] == null ? null : json['packageNameFr'] as String,
        remarkEn: json['remarkEn'] == null ? null : json['remarkEn'] as String,
        remarkAr: json['remarkAr'] == null ? null : json['remarkAr'] as String,
        remarkFr: json['remarkFr'] == null ? null : json['remarkFr'] as String,
        effectiveDateTime: json['effectiveDateTime'] == null ? null : json['effectiveDateTime'] as String,
        expiryDateTime: json['expiryDateTime'] == null ? null : json['expiryDateTime'] as String,
        packagePrice: json['packagePrice'] == null ? null : json['packagePrice'] as double,
        currencyAsymbol: json['currencyAsymbol'] == null ? null : json['currencyAsymbol'] as String,
        currencyEsymbol: json['currencyEsymbol'] == null ? null : json['currencyEsymbol'] as String,
        currencyShortSymbol: json['currencyShortSymbol'] == null ? null : json['currencyShortSymbol'] as String);
  }

  @override
  String toString() {
    return '''CompanyPackage(
                packageId:$packageId,
countryId:$countryId,
packageNameEn:$packageNameEn,
packageNameAr:$packageNameAr,
packageNameFr:$packageNameFr,
remarkEn:$remarkEn,
remarkAr:$remarkAr,
remarkFr:$remarkFr,
effectiveDateTime:$effectiveDateTime,
expiryDateTime:$expiryDateTime,
packagePrice:$packagePrice,
currencyAsymbol:$currencyAsymbol,
currencyEsymbol:$currencyEsymbol,
currencyShortSymbol:$currencyShortSymbol
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is CompanyPackage &&
        other.runtimeType == runtimeType &&
        other.packageId == packageId &&
        other.countryId == countryId &&
        other.packageNameEn == packageNameEn &&
        other.packageNameAr == packageNameAr &&
        other.packageNameFr == packageNameFr &&
        other.remarkEn == remarkEn &&
        other.remarkAr == remarkAr &&
        other.remarkFr == remarkFr &&
        other.effectiveDateTime == effectiveDateTime &&
        other.expiryDateTime == expiryDateTime &&
        other.packagePrice == packagePrice &&
        other.currencyAsymbol == currencyAsymbol &&
        other.currencyEsymbol == currencyEsymbol &&
        other.currencyShortSymbol == currencyShortSymbol;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, packageId, countryId, packageNameEn, packageNameAr, packageNameFr, remarkEn, remarkAr, remarkFr, effectiveDateTime, expiryDateTime, packagePrice, currencyAsymbol,
        currencyEsymbol, currencyShortSymbol);
  }
}

class CompanyContact {
  final int? id;
  final String? nameEn;
  final String? nameAr;
  final String? email;
  final String? mobile;
  final String? whatsApp;
  final String? tel;
  final String? designation;
  final String? department;
  final int? designationId;
  final int? departmentId;
  const CompanyContact({this.id, this.nameEn, this.nameAr, this.email, this.mobile, this.whatsApp, this.tel, this.designation, this.department, this.designationId, this.departmentId});
  CompanyContact copyWith(
      {int? id, String? nameEn, String? nameAr, String? email, String? mobile, String? whatsApp, String? tel, String? designation, String? department, int? designationId, int? departmentId}) {
    return CompanyContact(
        id: id ?? this.id,
        nameEn: nameEn ?? this.nameEn,
        nameAr: nameAr ?? this.nameAr,
        email: email ?? this.email,
        mobile: mobile ?? this.mobile,
        whatsApp: whatsApp ?? this.whatsApp,
        tel: tel ?? this.tel,
        designation: designation ?? this.designation,
        department: department ?? this.department,
        designationId: designationId ?? this.designationId,
        departmentId: departmentId ?? this.departmentId);
  }

  Map<String, Object?> toJson() {
    return {
      'id': id,
      'nameEn': nameEn,
      'nameAr': nameAr,
      'email': email,
      'mobile': mobile,
      'whatsApp': whatsApp,
      'tel': tel,
      'designation': designation,
      'department': department,
      'designationId': designationId,
      'departmentId': departmentId
    };
  }

  static CompanyContact fromJson(Map<String, Object?> json) {
    return CompanyContact(
        id: json['id'] == null ? null : json['id'] as int,
        nameEn: json['nameEn'] == null ? null : json['nameEn'] as String,
        nameAr: json['nameAr'] == null ? null : json['nameAr'] as String,
        email: json['email'] == null ? null : json['email'] as String,
        mobile: json['mobile'] == null ? null : json['mobile'] as String,
        whatsApp: json['whatsApp'] == null ? null : json['whatsApp'] as String,
        tel: json['tel'] == null ? null : json['tel'] as String,
        designation: json['designation'] == null ? null : json['designation'] as String,
        department: json['department'] == null ? null : json['department'] as String,
        designationId: json['designationId'] == null ? null : json['designationId'] as int,
        departmentId: json['departmentId'] == null ? null : json['departmentId'] as int);
  }

  @override
  String toString() {
    return '''CompanyContact(
                id:$id,
nameEn:$nameEn,
nameAr:$nameAr,
email:$email,
mobile:$mobile,
whatsApp:$whatsApp,
tel:$tel,
designation:$designation,
department:$department,
designationId:$designationId,
departmentId:$departmentId
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is CompanyContact &&
        other.runtimeType == runtimeType &&
        other.id == id &&
        other.nameEn == nameEn &&
        other.nameAr == nameAr &&
        other.email == email &&
        other.mobile == mobile &&
        other.whatsApp == whatsApp &&
        other.tel == tel &&
        other.designation == designation &&
        other.department == department &&
        other.designationId == designationId &&
        other.departmentId == departmentId;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, id, nameEn, nameAr, email, mobile, whatsApp, tel, designation, department, designationId, departmentId);
  }
}

class CompanySocialMedia {
  final String? facebook;
  final String? instagram;
  final String? linkedIn;
  final String? twitter;
  const CompanySocialMedia({this.facebook, this.instagram, this.linkedIn, this.twitter});
  CompanySocialMedia copyWith({String? facebook, String? instagram, String? linkedIn, String? twitter}) {
    return CompanySocialMedia(facebook: facebook ?? this.facebook, instagram: instagram ?? this.instagram, linkedIn: linkedIn ?? this.linkedIn, twitter: twitter ?? this.twitter);
  }

  Map<String, Object?> toJson() {
    return {'facebook': facebook, 'instagram': instagram, 'linkedIn': linkedIn, 'twitter': twitter};
  }

  static CompanySocialMedia fromJson(Map<String, Object?> json) {
    return CompanySocialMedia(
        facebook: json['facebook'] == null ? null : json['facebook'] as String,
        instagram: json['instagram'] == null ? null : json['instagram'] as String,
        linkedIn: json['linkedIn'] == null ? null : json['linkedIn'] as String,
        twitter: json['twitter'] == null ? null : json['twitter'] as String);
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
  final String? logo;
  final bool? isFreeLancer;
  final String? companyNumber;
  final String? nameEn;
  final String? nameAr;
  final dynamic nameFr;
  final String? tagLine;
  final String? edate;
  final int? genderId;
  final String? mobile;
  final String? whatsapp;
  final String? tel1;
  final String? email;
  final String? url;
  final String? tel2;
  final String? aboutUs;
  final String? taxNumber;
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
      {String? logo,
      bool? isFreeLancer,
      String? companyNumber,
      String? nameEn,
      String? nameAr,
      dynamic? nameFr,
      String? tagLine,
      String? edate,
      int? genderId,
      String? mobile,
      String? whatsapp,
      String? tel1,
      String? email,
      String? url,
      String? tel2,
      String? aboutUs,
      String? taxNumber,
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
        logo: json['logo'] == null ? null : json['logo'] as String,
        isFreeLancer: json['isFreeLancer'] == null ? null : json['isFreeLancer'] as bool,
        companyNumber: json['companyNumber'] == null ? null : json['companyNumber'] as String,
        nameEn: json['nameEn'] == null ? null : json['nameEn'] as String,
        nameAr: json['nameAr'] == null ? null : json['nameAr'] as String,
        nameFr: json['nameFr'] as dynamic,
        tagLine: json['tagLine'] == null ? null : json['tagLine'] as String,
        edate: json['edate'] == null ? null : json['edate'] as String,
        genderId: json['genderId'] == null ? null : json['genderId'] as int,
        mobile: json['mobile'] == null ? null : json['mobile'] as String,
        whatsapp: json['whatsapp'] == null ? null : json['whatsapp'] as String,
        tel1: json['tel1'] == null ? null : json['tel1'] as String,
        email: json['email'] == null ? null : json['email'] as String,
        url: json['url'] == null ? null : json['url'] as String,
        tel2: json['tel2'] == null ? null : json['tel2'] as String,
        aboutUs: json['aboutUs'] == null ? null : json['aboutUs'] as String,
        taxNumber: json['taxNumber'] == null ? null : json['taxNumber'] as String,
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

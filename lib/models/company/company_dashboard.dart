class CompanyDashBoard {
  final PackageDetail? packageDetail;
  final Click? click;
  final Offer? offer;
  final bool? isMasterUser;
  final int? points;
  final String? trialStartDate;
  final int? trialDays;
  final bool? isForceSignOut;
  final int? staffCountAllowed;
  final String? appVersion;
  final List<ClickData>? clickData;
  final List<AppointmentData>? appointmentData;

  
  const CompanyDashBoard({
    this.packageDetail,
    this.click,
    this.offer,
    this.isMasterUser,
    this.points,
    this.trialStartDate,
    this.trialDays,
    this.isForceSignOut,
    this.staffCountAllowed,
    this.appVersion,
    this.clickData,
    this.appointmentData,
  });
  CompanyDashBoard copyWith({
    PackageDetail? packageDetail,
    Click? click,
    Offer? offer,
    bool? isMasterUser,
    int? points,
    String? trialStartDate,
    int? trialDays,
    bool? isForceSignOut,
    int? staffCountAllowed,
    String? appVersion,
    List<ClickData>? clickData,
    List<AppointmentData>? appointmentData,
  }) {
    return CompanyDashBoard(
      packageDetail: packageDetail ?? this.packageDetail,
      click: click ?? this.click,
      offer: offer ?? this.offer,
      isMasterUser: isMasterUser ?? this.isMasterUser,
      points: points ?? this.points,
      trialStartDate: trialStartDate ?? this.trialStartDate,
      trialDays: trialDays ?? this.trialDays,
      isForceSignOut: isForceSignOut ?? this.isForceSignOut,
      staffCountAllowed: staffCountAllowed ?? this.staffCountAllowed,
      appVersion: appVersion ?? this.appVersion,
      clickData: clickData ?? this.clickData,
      appointmentData: appointmentData ?? this.appointmentData,
    );
  }

  Map<String, Object?> toJson() {
    return {
      'packageDetail': packageDetail?.toJson(),
      'click': click?.toJson(),
      'offer': offer?.toJson(),
      'isMasterUser': isMasterUser,
      'points': points,
      'trialStartDate': trialStartDate,
      'trialDays': trialDays,
      'isForceSignOut': isForceSignOut,
      'staffCountAllowed': staffCountAllowed,
      'appVersion': appVersion,
      'clickData': clickData?.map<Map<String, dynamic>>((data) => data.toJson()).toList(),
      'appointmentData': appointmentData?.map<Map<String, dynamic>>((data) => data.toJson()).toList()
    };
  }

  static CompanyDashBoard fromJson(Map<String, Object?> json) {
    return CompanyDashBoard(
      packageDetail: json['packageDetail'] == null ? null : PackageDetail.fromJson(json['packageDetail'] as Map<String, Object?>),
      click: json['click'] == null ? null : Click.fromJson(json['click'] as Map<String, Object?>),
      offer: json['offer'] == null ? null : Offer.fromJson(json['offer'] as Map<String, Object?>),
      isMasterUser: json['isMasterUser'] == null ? null : json['isMasterUser'] as bool,
      points: json['points'] == null ? null : json['points'] as int,
      trialStartDate: json['trialStartDate'] == null ? null : json['trialStartDate'] as String,
      trialDays: json['trialDays'] == null ? null : json['trialDays'] as int,
      isForceSignOut: json['isForceSignOut'] == null ? null : json['isForceSignOut'] as bool,
      staffCountAllowed: json['staffCountAllowed'] == null ? null : json['staffCountAllowed'] as int,
      appVersion: json['appVersion'] == null ? null : json['appVersion'] as String,
      clickData: json['clickData'] == null ? null : (json['clickData'] as List).map<ClickData>((data) => ClickData.fromJson(data as Map<String, Object?>)).toList(),
      appointmentData: json['appointmentData'] == null ? null : (json['appointmentData'] as List).map<AppointmentData>((data) => AppointmentData.fromJson(data as Map<String, Object?>)).toList(),
    );
  }

  @override
  String toString() {
    return '''CompanyDashBoard(
                packageDetail:${packageDetail.toString()},
                click:${click.toString()},
                offer:${offer.toString()},
                isMasterUser:$isMasterUser,
                points:$points,
                trialStartDate:$trialStartDate,
                trialDays:$trialDays,
                isForceSignOut:$isForceSignOut,
                staffCountAllowed:$staffCountAllowed,
                appVersion:$appVersion,
                clickData:${clickData.toString()},
                appointmentData:${appointmentData.toString()}
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is CompanyDashBoard &&
        other.runtimeType == runtimeType &&
        other.packageDetail == packageDetail &&
        other.click == click &&
        other.offer == offer &&
        other.isMasterUser == isMasterUser &&
        other.points == points &&
        other.trialStartDate == trialStartDate &&
        other.trialDays == trialDays &&
        other.isForceSignOut == isForceSignOut &&
        other.staffCountAllowed == staffCountAllowed &&
        other.appVersion == appVersion &&
        other.clickData == clickData &&
        other.appointmentData == appointmentData;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, packageDetail, click, offer, isMasterUser, points, trialStartDate, trialDays, isForceSignOut, staffCountAllowed, appVersion, clickData, appointmentData);
  }
}

class AppointmentData {
  final int? count;
  final String? dayofWeek;
  final String? appointmentDate;
  const AppointmentData({
    this.count,
    this.dayofWeek,
    this.appointmentDate,
  });
  AppointmentData copyWith({
    int? count,
    String? dayofWeek,
    String? appointmentDate,
  }) {
    return AppointmentData(
      count: count ?? this.count,
      dayofWeek: dayofWeek ?? this.dayofWeek,
      appointmentDate: appointmentDate ?? this.appointmentDate,
    );
  }

  Map<String, Object?> toJson() {
    return {'count': count, 'dayofWeek': dayofWeek, 'appointmentDate': appointmentDate};
  }

  static AppointmentData fromJson(Map<String, Object?> json) {
    return AppointmentData(
      count: json['count'] == null ? null : json['count'] as int,
      dayofWeek: json['dayofWeek'] == null ? null : json['dayofWeek'] as String,
      appointmentDate: json['appointmentDate'] == null ? null : json['appointmentDate'] as String,
    );
  }

  @override
  String toString() {
    return '''AppointmentData(
              count:$count,
              dayofWeek:$dayofWeek,
              appointmentDate:$appointmentDate
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is AppointmentData && other.runtimeType == runtimeType && other.count == count && other.dayofWeek == dayofWeek && other.appointmentDate == appointmentDate;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, count, dayofWeek, appointmentDate);
  }
}

class ClickData {
  final int? count;
  final String? dayofWeek;
  final String? clickDate;
  const ClickData({this.count, this.dayofWeek, this.clickDate});
  ClickData copyWith({
    int? count,
    String? dayofWeek,
    String? clickDate,
  }) {
    return ClickData(
      count: count ?? this.count,
      dayofWeek: dayofWeek ?? this.dayofWeek,
      clickDate: clickDate ?? this.clickDate,
    );
  }

  Map<String, Object?> toJson() {
    return {'count': count, 'dayofWeek': dayofWeek, 'clickDate': clickDate};
  }

  static ClickData fromJson(Map<String, Object?> json) {
    return ClickData(
      count: json['count'] == null ? null : json['count'] as int,
      dayofWeek: json['dayofWeek'] == null ? null : json['dayofWeek'] as String,
      clickDate: json['clickDate'] == null ? null : json['clickDate'] as String,
    );
  }

  @override
  String toString() {
    return '''ClickData(
            count:$count,
            dayofWeek:$dayofWeek,
            clickDate:$clickDate
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is ClickData && other.runtimeType == runtimeType && other.count == count && other.dayofWeek == dayofWeek && other.clickDate == clickDate;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, count, dayofWeek, clickDate);
  }
}

class Offer {
  final int? offersToday;
  final int? offersMonth;
  final int? offersTotal;
  const Offer({
    this.offersToday,
    this.offersMonth,
    this.offersTotal,
  });
  Offer copyWith({
    int? offersToday,
    int? offersMonth,
    int? offersTotal,
  }) {
    return Offer(
      offersToday: offersToday ?? this.offersToday,
      offersMonth: offersMonth ?? this.offersMonth,
      offersTotal: offersTotal ?? this.offersTotal,
    );
  }

  Map<String, Object?> toJson() {
    return {'offersToday': offersToday, 'offersMonth': offersMonth, 'offersTotal': offersTotal};
  }

  static Offer fromJson(Map<String, Object?> json) {
    return Offer(
      offersToday: json['offersToday'] == null ? null : json['offersToday'] as int,
      offersMonth: json['offersMonth'] == null ? null : json['offersMonth'] as int,
      offersTotal: json['offersTotal'] == null ? null : json['offersTotal'] as int,
    );
  }

  @override
  String toString() {
    return '''Offer(
              offersToday:$offersToday,
              offersMonth:$offersMonth,
              offersTotal:$offersTotal
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is Offer && other.runtimeType == runtimeType && other.offersToday == offersToday && other.offersMonth == offersMonth && other.offersTotal == offersTotal;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, offersToday, offersMonth, offersTotal);
  }
}

class Click {
  final int? clicksToday;
  final int? clicksMonth;
  final int? clicksTotal;
  const Click({this.clicksToday, this.clicksMonth, this.clicksTotal});
  Click copyWith({
    int? clicksToday,
    int? clicksMonth,
    int? clicksTotal,
  }) {
    return Click(
      clicksToday: clicksToday ?? this.clicksToday,
      clicksMonth: clicksMonth ?? this.clicksMonth,
      clicksTotal: clicksTotal ?? this.clicksTotal,
    );
  }

  Map<String, Object?> toJson() {
    return {'clicksToday': clicksToday, 'clicksMonth': clicksMonth, 'clicksTotal': clicksTotal};
  }

  static Click fromJson(Map<String, Object?> json) {
    return Click(
        clicksToday: json['clicksToday'] == null ? null : json['clicksToday'] as int,
        clicksMonth: json['clicksMonth'] == null ? null : json['clicksMonth'] as int,
        clicksTotal: json['clicksTotal'] == null ? null : json['clicksTotal'] as int);
  }

  @override
  String toString() {
    return '''Click(
                clicksToday:$clicksToday,
clicksMonth:$clicksMonth,
clicksTotal:$clicksTotal
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is Click && other.runtimeType == runtimeType && other.clicksToday == clicksToday && other.clicksMonth == clicksMonth && other.clicksTotal == clicksTotal;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, clicksToday, clicksMonth, clicksTotal);
  }
}

class PackageDetail {
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

  const PackageDetail({
    this.packageId,
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
    this.isPaid,
  });
  PackageDetail copyWith({
    int? packageId,
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
    bool? isPaid,
  }) {
    return PackageDetail(
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

  static PackageDetail fromJson(Map<String, Object?> json) {
    return PackageDetail(
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
      isPaid: json['isPaid'] == null ? null : json['isPaid'] as bool,
    );
  }

  @override
  String toString() {
    return '''PackageDetail(
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
    return other is PackageDetail &&
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

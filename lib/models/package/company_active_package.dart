class CompanyActivePackage {
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
  const CompanyActivePackage(
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
  CompanyActivePackage copyWith(
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
    return CompanyActivePackage(
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

  static CompanyActivePackage fromJson(Map<String, Object?> json) {
    return CompanyActivePackage(
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
    return '''CompanyActivePackage(
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
    return other is CompanyActivePackage &&
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

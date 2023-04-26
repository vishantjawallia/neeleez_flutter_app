class PackageInformation {
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
  final int? packagePrice;
  final String? currencyAsymbol;
  final String? currencyEsymbol;
  final String? currencyShortSymbol;
  const PackageInformation(
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
  PackageInformation copyWith(
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
      int? packagePrice,
      String? currencyAsymbol,
      String? currencyEsymbol,
      String? currencyShortSymbol}) {
    return PackageInformation(
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

  static PackageInformation fromJson(Map<String, Object?> json) {
    return PackageInformation(
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
        packagePrice: json['packagePrice'] == null ? null : json['packagePrice'] as int,
        currencyAsymbol: json['currencyAsymbol'] == null ? null : json['currencyAsymbol'] as String,
        currencyEsymbol: json['currencyEsymbol'] == null ? null : json['currencyEsymbol'] as String,
        currencyShortSymbol: json['currencyShortSymbol'] == null ? null : json['currencyShortSymbol'] as String);
  }

  @override
  String toString() {
    return '''PackageInformation(
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
    return other is PackageInformation &&
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

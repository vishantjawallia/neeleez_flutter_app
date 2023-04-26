class Companies {
  final int? id;
  final String? regionName;
  final dynamic regionNameAr;
  final String? nameEn;
  final String? nameFr;
  final String? nameAr;
  final String? iconImage;
  final String? iconImage2;
  final String? isoCode2;
  final String? isoCode3;
  final String? countryCode;
  final String? mobileMask;
  final String? mobileMaskFormat;
  final int? currencyId;
  final String? currencySymbol;
  final String? currencyASymbol;
  final String? currencyName;
  final int? currencyDecimals;
  final bool? isSymbolBefore;
  final bool? isServiceAvailable;
  final int? postcodeRequired;
  final bool? isActive;
  final bool? isAvailable;
  final int? isDeleted;
  final int? baseCharges;
  final int? mobileNumberLength;
  final String? pickerListAr;
  final String? pickerListEn;
  final String? pickerListFr;
  final int? numberDecimalDigits;
  final String? numberGroupSeparator;
  final String? numberDecimalSeparator;
  const Companies(
      {this.id,
      this.regionName,
      this.regionNameAr,
      this.nameEn,
      this.nameFr,
      this.nameAr,
      this.iconImage,
      this.iconImage2,
      this.isoCode2,
      this.isoCode3,
      this.countryCode,
      this.mobileMask,
      this.mobileMaskFormat,
      this.currencyId,
      this.currencySymbol,
      this.currencyASymbol,
      this.currencyName,
      this.currencyDecimals,
      this.isSymbolBefore,
      this.isServiceAvailable,
      this.postcodeRequired,
      this.isActive,
      this.isAvailable,
      this.isDeleted,
      this.baseCharges,
      this.mobileNumberLength,
      this.pickerListAr,
      this.pickerListEn,
      this.pickerListFr,
      this.numberDecimalDigits,
      this.numberGroupSeparator,
      this.numberDecimalSeparator});
  Companies copyWith(
      {int? id,
      String? regionName,
      dynamic? regionNameAr,
      String? nameEn,
      String? nameFr,
      String? nameAr,
      String? iconImage,
      String? iconImage2,
      String? isoCode2,
      String? isoCode3,
      String? countryCode,
      String? mobileMask,
      String? mobileMaskFormat,
      int? currencyId,
      String? currencySymbol,
      String? currencyASymbol,
      String? currencyName,
      int? currencyDecimals,
      bool? isSymbolBefore,
      bool? isServiceAvailable,
      int? postcodeRequired,
      bool? isActive,
      bool? isAvailable,
      int? isDeleted,
      int? baseCharges,
      int? mobileNumberLength,
      String? pickerListAr,
      String? pickerListEn,
      String? pickerListFr,
      int? numberDecimalDigits,
      String? numberGroupSeparator,
      String? numberDecimalSeparator}) {
    return Companies(
        id: id ?? this.id,
        regionName: regionName ?? this.regionName,
        regionNameAr: regionNameAr ?? this.regionNameAr,
        nameEn: nameEn ?? this.nameEn,
        nameFr: nameFr ?? this.nameFr,
        nameAr: nameAr ?? this.nameAr,
        iconImage: iconImage ?? this.iconImage,
        iconImage2: iconImage2 ?? this.iconImage2,
        isoCode2: isoCode2 ?? this.isoCode2,
        isoCode3: isoCode3 ?? this.isoCode3,
        countryCode: countryCode ?? this.countryCode,
        mobileMask: mobileMask ?? this.mobileMask,
        mobileMaskFormat: mobileMaskFormat ?? this.mobileMaskFormat,
        currencyId: currencyId ?? this.currencyId,
        currencySymbol: currencySymbol ?? this.currencySymbol,
        currencyASymbol: currencyASymbol ?? this.currencyASymbol,
        currencyName: currencyName ?? this.currencyName,
        currencyDecimals: currencyDecimals ?? this.currencyDecimals,
        isSymbolBefore: isSymbolBefore ?? this.isSymbolBefore,
        isServiceAvailable: isServiceAvailable ?? this.isServiceAvailable,
        postcodeRequired: postcodeRequired ?? this.postcodeRequired,
        isActive: isActive ?? this.isActive,
        isAvailable: isAvailable ?? this.isAvailable,
        isDeleted: isDeleted ?? this.isDeleted,
        baseCharges: baseCharges ?? this.baseCharges,
        mobileNumberLength: mobileNumberLength ?? this.mobileNumberLength,
        pickerListAr: pickerListAr ?? this.pickerListAr,
        pickerListEn: pickerListEn ?? this.pickerListEn,
        pickerListFr: pickerListFr ?? this.pickerListFr,
        numberDecimalDigits: numberDecimalDigits ?? this.numberDecimalDigits,
        numberGroupSeparator: numberGroupSeparator ?? this.numberGroupSeparator,
        numberDecimalSeparator: numberDecimalSeparator ?? this.numberDecimalSeparator);
  }

  Map<String, Object?> toJson() {
    return {
      'id': id,
      'regionName': regionName,
      'regionNameAr': regionNameAr,
      'nameEn': nameEn,
      'nameFr': nameFr,
      'nameAr': nameAr,
      'iconImage': iconImage,
      'iconImage2': iconImage2,
      'isoCode2': isoCode2,
      'isoCode3': isoCode3,
      'countryCode': countryCode,
      'mobileMask': mobileMask,
      'mobileMaskFormat': mobileMaskFormat,
      'currencyId': currencyId,
      'currencySymbol': currencySymbol,
      'currencyASymbol': currencyASymbol,
      'currencyName': currencyName,
      'currencyDecimals': currencyDecimals,
      'isSymbolBefore': isSymbolBefore,
      'isServiceAvailable': isServiceAvailable,
      'postcodeRequired': postcodeRequired,
      'isActive': isActive,
      'isAvailable': isAvailable,
      'isDeleted': isDeleted,
      'baseCharges': baseCharges,
      'mobileNumberLength': mobileNumberLength,
      'pickerListAr': pickerListAr,
      'pickerListEn': pickerListEn,
      'pickerListFr': pickerListFr,
      'numberDecimalDigits': numberDecimalDigits,
      'numberGroupSeparator': numberGroupSeparator,
      'numberDecimalSeparator': numberDecimalSeparator
    };
  }

  static Companies fromJson(Map<String, Object?> json) {
    return Companies(
        id: json['id'] == null ? null : json['id'] as int,
        regionName: json['regionName'] == null ? null : json['regionName'] as String,
        regionNameAr: json['regionNameAr'] as dynamic,
        nameEn: json['nameEn'] == null ? null : json['nameEn'] as String,
        nameFr: json['nameFr'] == null ? null : json['nameFr'] as String,
        nameAr: json['nameAr'] == null ? null : json['nameAr'] as String,
        iconImage: json['iconImage'] == null ? null : json['iconImage'] as String,
        iconImage2: json['iconImage2'] == null ? null : json['iconImage2'] as String,
        isoCode2: json['isoCode2'] == null ? null : json['isoCode2'] as String,
        isoCode3: json['isoCode3'] == null ? null : json['isoCode3'] as String,
        countryCode: json['countryCode'] == null ? null : json['countryCode'] as String,
        mobileMask: json['mobileMask'] == null ? null : json['mobileMask'] as String,
        mobileMaskFormat: json['mobileMaskFormat'] == null ? null : json['mobileMaskFormat'] as String,
        currencyId: json['currencyId'] == null ? null : json['currencyId'] as int,
        currencySymbol: json['currencySymbol'] == null ? null : json['currencySymbol'] as String,
        currencyASymbol: json['currencyASymbol'] == null ? null : json['currencyASymbol'] as String,
        currencyName: json['currencyName'] == null ? null : json['currencyName'] as String,
        currencyDecimals: json['currencyDecimals'] == null ? null : json['currencyDecimals'] as int,
        isSymbolBefore: json['isSymbolBefore'] == null ? null : json['isSymbolBefore'] as bool,
        isServiceAvailable: json['isServiceAvailable'] == null ? null : json['isServiceAvailable'] as bool,
        postcodeRequired: json['postcodeRequired'] == null ? null : json['postcodeRequired'] as int,
        isActive: json['isActive'] == null ? null : json['isActive'] as bool,
        isAvailable: json['isAvailable'] == null ? null : json['isAvailable'] as bool,
        isDeleted: json['isDeleted'] == null ? null : json['isDeleted'] as int,
        baseCharges: json['baseCharges'] == null ? null : json['baseCharges'] as int,
        mobileNumberLength: json['mobileNumberLength'] == null ? null : json['mobileNumberLength'] as int,
        pickerListAr: json['pickerListAr'] == null ? null : json['pickerListAr'] as String,
        pickerListEn: json['pickerListEn'] == null ? null : json['pickerListEn'] as String,
        pickerListFr: json['pickerListFr'] == null ? null : json['pickerListFr'] as String,
        numberDecimalDigits: json['numberDecimalDigits'] == null ? null : json['numberDecimalDigits'] as int,
        numberGroupSeparator: json['numberGroupSeparator'] == null ? null : json['numberGroupSeparator'] as String,
        numberDecimalSeparator: json['numberDecimalSeparator'] == null ? null : json['numberDecimalSeparator'] as String);
  }

  static List<Companies> fromJsonList(dynamic json) {
    List<Companies> companiesList = [];

    for (Map<String, dynamic> element in json) {
      companiesList.add(Companies.fromJson(element));
    }
    return companiesList;
  }

  @override
  String toString() {
    return '''Companies(
                id:$id,
regionName:$regionName,
regionNameAr:$regionNameAr,
nameEn:$nameEn,
nameFr:$nameFr,
nameAr:$nameAr,
iconImage:$iconImage,
iconImage2:$iconImage2,
isoCode2:$isoCode2,
isoCode3:$isoCode3,
countryCode:$countryCode,
mobileMask:$mobileMask,
mobileMaskFormat:$mobileMaskFormat,
currencyId:$currencyId,
currencySymbol:$currencySymbol,
currencyASymbol:$currencyASymbol,
currencyName:$currencyName,
currencyDecimals:$currencyDecimals,
isSymbolBefore:$isSymbolBefore,
isServiceAvailable:$isServiceAvailable,
postcodeRequired:$postcodeRequired,
isActive:$isActive,
isAvailable:$isAvailable,
isDeleted:$isDeleted,
baseCharges:$baseCharges,
mobileNumberLength:$mobileNumberLength,
pickerListAr:$pickerListAr,
pickerListEn:$pickerListEn,
pickerListFr:$pickerListFr,
numberDecimalDigits:$numberDecimalDigits,
numberGroupSeparator:$numberGroupSeparator,
numberDecimalSeparator:$numberDecimalSeparator
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is Companies &&
        other.runtimeType == runtimeType &&
        other.id == id &&
        other.regionName == regionName &&
        other.regionNameAr == regionNameAr &&
        other.nameEn == nameEn &&
        other.nameFr == nameFr &&
        other.nameAr == nameAr &&
        other.iconImage == iconImage &&
        other.iconImage2 == iconImage2 &&
        other.isoCode2 == isoCode2 &&
        other.isoCode3 == isoCode3 &&
        other.countryCode == countryCode &&
        other.mobileMask == mobileMask &&
        other.mobileMaskFormat == mobileMaskFormat &&
        other.currencyId == currencyId &&
        other.currencySymbol == currencySymbol &&
        other.currencyASymbol == currencyASymbol &&
        other.currencyName == currencyName &&
        other.currencyDecimals == currencyDecimals &&
        other.isSymbolBefore == isSymbolBefore &&
        other.isServiceAvailable == isServiceAvailable &&
        other.postcodeRequired == postcodeRequired &&
        other.isActive == isActive &&
        other.isAvailable == isAvailable &&
        other.isDeleted == isDeleted &&
        other.baseCharges == baseCharges &&
        other.mobileNumberLength == mobileNumberLength &&
        other.pickerListAr == pickerListAr &&
        other.pickerListEn == pickerListEn &&
        other.pickerListFr == pickerListFr &&
        other.numberDecimalDigits == numberDecimalDigits &&
        other.numberGroupSeparator == numberGroupSeparator &&
        other.numberDecimalSeparator == numberDecimalSeparator;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, id, regionName, regionNameAr, nameEn, nameFr, nameAr, iconImage, iconImage2, isoCode2, isoCode3, countryCode, mobileMask, mobileMaskFormat, currencyId,
        currencySymbol, currencyASymbol, currencyName, currencyDecimals, isSymbolBefore);
  }
}

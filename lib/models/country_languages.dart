class CountryLanguage {
  final int? id;
  final String? name;
  final String? nameAr;
  final String? nameFr;
  final String? iconImage;
  final List<LanguageList>? languageList;
  const CountryLanguage({this.id, this.name, this.nameAr, this.nameFr, this.iconImage, this.languageList});
  CountryLanguage copyWith({int? id, String? name, String? nameAr, String? nameFr, String? iconImage, List<LanguageList>? languageList}) {
    return CountryLanguage(
        id: id ?? this.id,
        name: name ?? this.name,
        nameAr: nameAr ?? this.nameAr,
        nameFr: nameFr ?? this.nameFr,
        iconImage: iconImage ?? this.iconImage,
        languageList: languageList ?? this.languageList);
  }

  Map<String, Object?> toJson() {
    return {'id': id, 'name': name, 'nameAr': nameAr, 'nameFr': nameFr, 'iconImage': iconImage, 'languageList': languageList?.map<Map<String, dynamic>>((data) => data.toJson()).toList()};
  }

  static CountryLanguage fromJson(Map<String, Object?> json) {
    return CountryLanguage(
        id: json['id'] == null ? null : json['id'] as int,
        name: json['name'] == null ? null : json['name'] as String,
        nameAr: json['nameAr'] == null ? null : json['nameAr'] as String,
        nameFr: json['nameFr'] == null ? null : json['nameFr'] as String,
        iconImage: json['iconImage'] == null ? null : json['iconImage'] as String,
        languageList: json['languageList'] == null ? null : (json['languageList'] as List).map<LanguageList>((data) => LanguageList.fromJson(data as Map<String, Object?>)).toList());
  }

  static List<CountryLanguage> fromJsonList(dynamic json) {
    List<CountryLanguage> value = [];
    for (Map<String, dynamic> element in json) {
      value.add(CountryLanguage.fromJson(element));
    }
    return value;
  }

  @override
  String toString() {
    return '''CountryLanguage(
                id:$id,
name:$name,
nameAr:$nameAr,
nameFr:$nameFr,
iconImage:$iconImage,
languageList:${languageList.toString()}
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is CountryLanguage &&
        other.runtimeType == runtimeType &&
        other.id == id &&
        other.name == name &&
        other.nameAr == nameAr &&
        other.nameFr == nameFr &&
        other.iconImage == iconImage &&
        other.languageList == languageList;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, id, name, nameAr, nameFr, iconImage, languageList);
  }
}

class LanguageList {
  final int? id;
  final String? name;
  final String? nameAr;
  final String? nameFr;
  const LanguageList({this.id, this.name, this.nameAr, this.nameFr});
  LanguageList copyWith({int? id, String? name, String? nameAr, String? nameFr}) {
    return LanguageList(id: id ?? this.id, name: name ?? this.name, nameAr: nameAr ?? this.nameAr, nameFr: nameFr ?? this.nameFr);
  }

  Map<String, Object?> toJson() {
    return {'id': id, 'name': name, 'nameAr': nameAr, 'nameFr': nameFr};
  }

  static LanguageList fromJson(Map<String, Object?> json) {
    return LanguageList(
        id: json['id'] == null ? null : json['id'] as int,
        name: json['name'] == null ? null : json['name'] as String,
        nameAr: json['nameAr'] == null ? null : json['nameAr'] as String,
        nameFr: json['nameFr'] == null ? null : json['nameFr'] as String);
  }

  @override
  String toString() {
    return '''LanguageList(
                id:$id,
name:$name,
nameAr:$nameAr,
nameFr:$nameFr
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is LanguageList && other.runtimeType == runtimeType && other.id == id && other.name == name && other.nameAr == nameAr && other.nameFr == nameFr;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, id, name, nameAr, nameFr);
  }
}

class UserData {
  final int? isRegistered;
  final int? customerId;
  final String? firstName;
  final String? lastName;
  final int? genderId;
  final String? genderEn;
  final String? genderAr;
  final String? genderFr;
  final String? dob;
  final String? mobile;
  final String? whatsapp;
  final String? email;
  final String? password;
  final bool? notifications;
  final bool? termsAccepted;
  final bool? isEmailVerified;
  final int? countryId;
  final String? countryEn;
  final String? countryAr;
  final String? countryFr;
  final bool? isDeactivated;
  final bool? isDeleted;
  final CustomerImage? customerImage;
  final dynamic customerDeletionHistory;
  const UserData(
      {this.isRegistered,
      this.customerId,
      this.firstName,
      this.lastName,
      this.genderId,
      this.genderEn,
      this.genderAr,
      this.genderFr,
      this.dob,
      this.mobile,
      this.whatsapp,
      this.email,
      this.password,
      this.notifications,
      this.termsAccepted,
      this.isEmailVerified,
      this.countryId,
      this.countryEn,
      this.countryAr,
      this.countryFr,
      this.isDeactivated,
      this.isDeleted,
      this.customerImage,
      this.customerDeletionHistory});
  UserData copyWith(
      {int? isRegistered,
      int? customerId,
      String? firstName,
      String? lastName,
      int? genderId,
      String? genderEn,
      String? genderAr,
      String? genderFr,
      String? dob,
      String? mobile,
      String? whatsapp,
      String? email,
      String? password,
      bool? notifications,
      bool? termsAccepted,
      bool? isEmailVerified,
      int? countryId,
      String? countryEn,
      String? countryAr,
      String? countryFr,
      bool? isDeactivated,
      bool? isDeleted,
      CustomerImage? customerImage,
      dynamic? customerDeletionHistory}) {
    return UserData(
        isRegistered: isRegistered ?? this.isRegistered,
        customerId: customerId ?? this.customerId,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        genderId: genderId ?? this.genderId,
        genderEn: genderEn ?? this.genderEn,
        genderAr: genderAr ?? this.genderAr,
        genderFr: genderFr ?? this.genderFr,
        dob: dob ?? this.dob,
        mobile: mobile ?? this.mobile,
        whatsapp: whatsapp ?? this.whatsapp,
        email: email ?? this.email,
        password: password ?? this.password,
        notifications: notifications ?? this.notifications,
        termsAccepted: termsAccepted ?? this.termsAccepted,
        isEmailVerified: isEmailVerified ?? this.isEmailVerified,
        countryId: countryId ?? this.countryId,
        countryEn: countryEn ?? this.countryEn,
        countryAr: countryAr ?? this.countryAr,
        countryFr: countryFr ?? this.countryFr,
        isDeactivated: isDeactivated ?? this.isDeactivated,
        isDeleted: isDeleted ?? this.isDeleted,
        customerImage: customerImage ?? this.customerImage,
        customerDeletionHistory: customerDeletionHistory ?? this.customerDeletionHistory);
  }

  Map<String, Object?> toJson() {
    return {
      'isRegistered': isRegistered,
      'customerId': customerId,
      'firstName': firstName,
      'lastName': lastName,
      'genderId': genderId,
      'genderEn': genderEn,
      'genderAr': genderAr,
      'genderFr': genderFr,
      'dob': dob,
      'mobile': mobile,
      'whatsapp': whatsapp,
      'email': email,
      'password': password,
      'notifications': notifications,
      'termsAccepted': termsAccepted,
      'isEmailVerified': isEmailVerified,
      'countryId': countryId,
      'countryEn': countryEn,
      'countryAr': countryAr,
      'countryFr': countryFr,
      'isDeactivated': isDeactivated,
      'isDeleted': isDeleted,
      'customerImage': customerImage?.toJson(),
      'customerDeletionHistory': customerDeletionHistory
    };
  }

  static UserData fromJson(Map<String, Object?> json) {
    return UserData(
        isRegistered: json['isRegistered'] == null ? null : json['isRegistered'] as int,
        customerId: json['customerId'] == null ? null : json['customerId'] as int,
        firstName: json['firstName'] == null ? null : json['firstName'] as String,
        lastName: json['lastName'] == null ? null : json['lastName'] as String,
        genderId: json['genderId'] == null ? null : json['genderId'] as int,
        genderEn: json['genderEn'] == null ? null : json['genderEn'] as String,
        genderAr: json['genderAr'] == null ? null : json['genderAr'] as String,
        genderFr: json['genderFr'] == null ? null : json['genderFr'] as String,
        dob: json['dob'] == null ? null : json['dob'] as String,
        mobile: json['mobile'] == null ? null : json['mobile'] as String,
        whatsapp: json['whatsapp'] == null ? null : json['whatsapp'] as String,
        email: json['email'] == null ? null : json['email'] as String,
        password: json['password'] == null ? null : json['password'] as String,
        notifications: json['notifications'] == null ? null : json['notifications'] as bool,
        termsAccepted: json['termsAccepted'] == null ? null : json['termsAccepted'] as bool,
        isEmailVerified: json['isEmailVerified'] == null ? null : json['isEmailVerified'] as bool,
        countryId: json['countryId'] == null ? null : json['countryId'] as int,
        countryEn: json['countryEn'] == null ? null : json['countryEn'] as String,
        countryAr: json['countryAr'] == null ? null : json['countryAr'] as String,
        countryFr: json['countryFr'] == null ? null : json['countryFr'] as String,
        isDeactivated: json['isDeactivated'] == null ? null : json['isDeactivated'] as bool,
        isDeleted: json['isDeleted'] == null ? null : json['isDeleted'] as bool,
        customerImage: json['customerImage'] == null ? null : CustomerImage.fromJson(json['customerImage'] as Map<String, Object?>),
        customerDeletionHistory: json['customerDeletionHistory'] as dynamic);
  }

  @override
  String toString() {
    return '''UserData(
          isRegistered:$isRegistered,
          customerId:$customerId,
          firstName:$firstName,
          lastName:$lastName,
          genderId:$genderId,
          genderEn:$genderEn,
          genderAr:$genderAr,
          genderFr:$genderFr,
          dob:$dob,
          mobile:$mobile,
          whatsapp:$whatsapp,
          email:$email,
          password:$password,
          notifications:$notifications,
          termsAccepted:$termsAccepted,
          isEmailVerified:$isEmailVerified,
          countryId:$countryId,
          countryEn:$countryEn,
          countryAr:$countryAr,
          countryFr:$countryFr,
          isDeactivated:$isDeactivated,
          isDeleted:$isDeleted,
          customerImage:${customerImage.toString()},
          customerDeletionHistory:$customerDeletionHistory
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is UserData &&
        other.runtimeType == runtimeType &&
        other.isRegistered == isRegistered &&
        other.customerId == customerId &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.genderId == genderId &&
        other.genderEn == genderEn &&
        other.genderAr == genderAr &&
        other.genderFr == genderFr &&
        other.dob == dob &&
        other.mobile == mobile &&
        other.whatsapp == whatsapp &&
        other.email == email &&
        other.password == password &&
        other.notifications == notifications &&
        other.termsAccepted == termsAccepted &&
        other.isEmailVerified == isEmailVerified &&
        other.countryId == countryId &&
        other.countryEn == countryEn &&
        other.countryAr == countryAr &&
        other.countryFr == countryFr &&
        other.isDeactivated == isDeactivated &&
        other.isDeleted == isDeleted &&
        other.customerImage == customerImage &&
        other.customerDeletionHistory == customerDeletionHistory;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, isRegistered, customerId, firstName, lastName, genderId, genderEn, genderAr, genderFr, dob, mobile, whatsapp, email, password, notifications, termsAccepted,
        isEmailVerified, countryId, countryEn, countryAr);
  }
}

class CustomerImage {
  final int? id;
  final int? customerId;
  final dynamic imageFile;
  final String? guid;
  final String? imageFileName;
  final bool? isVerified;
  final bool? isActive;
  final String? stateDate;
  final int? companyUserId;
  const CustomerImage({this.id, this.customerId, this.imageFile, this.guid, this.imageFileName, this.isVerified, this.isActive, this.stateDate, this.companyUserId});
  CustomerImage copyWith({int? id, int? customerId, dynamic? imageFile, String? guid, String? imageFileName, bool? isVerified, bool? isActive, String? stateDate, int? companyUserId}) {
    return CustomerImage(
        id: id ?? this.id,
        customerId: customerId ?? this.customerId,
        imageFile: imageFile ?? this.imageFile,
        guid: guid ?? this.guid,
        imageFileName: imageFileName ?? this.imageFileName,
        isVerified: isVerified ?? this.isVerified,
        isActive: isActive ?? this.isActive,
        stateDate: stateDate ?? this.stateDate,
        companyUserId: companyUserId ?? this.companyUserId);
  }

  Map<String, Object?> toJson() {
    return {
      'id': id,
      'customerId': customerId,
      'imageFile': imageFile,
      'guid': guid,
      'imageFileName': imageFileName,
      'isVerified': isVerified,
      'isActive': isActive,
      'stateDate': stateDate,
      'companyUserId': companyUserId
    };
  }

  static CustomerImage fromJson(Map<String, Object?> json) {
    return CustomerImage(
        id: json['id'] == null ? null : json['id'] as int,
        customerId: json['customerId'] == null ? null : json['customerId'] as int,
        imageFile: json['imageFile'] as dynamic,
        guid: json['guid'] == null ? null : json['guid'] as String,
        imageFileName: json['imageFileName'] == null ? null : json['imageFileName'] as String,
        isVerified: json['isVerified'] == null ? null : json['isVerified'] as bool,
        isActive: json['isActive'] == null ? null : json['isActive'] as bool,
        stateDate: json['stateDate'] == null ? null : json['stateDate'] as String,
        companyUserId: json['companyUserId'] == null ? null : json['companyUserId'] as int);
  }

  @override
  String toString() {
    return '''CustomerImage(
                id:$id,
customerId:$customerId,
imageFile:$imageFile,
guid:$guid,
imageFileName:$imageFileName,
isVerified:$isVerified,
isActive:$isActive,
stateDate:$stateDate,
companyUserId:$companyUserId
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is CustomerImage &&
        other.runtimeType == runtimeType &&
        other.id == id &&
        other.customerId == customerId &&
        other.imageFile == imageFile &&
        other.guid == guid &&
        other.imageFileName == imageFileName &&
        other.isVerified == isVerified &&
        other.isActive == isActive &&
        other.stateDate == stateDate &&
        other.companyUserId == companyUserId;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, id, customerId, imageFile, guid, imageFileName, isVerified, isActive, stateDate, companyUserId);
  }
}

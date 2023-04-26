class CompanyProfileImage {
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
  const CompanyProfileImage(
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
  CompanyProfileImage copyWith(
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
    return CompanyProfileImage(
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

  static CompanyProfileImage fromJson(Map<String, Object?> json) {
    return CompanyProfileImage(
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

  static List<CompanyProfileImage> fromJsonList(dynamic json) {
    List<CompanyProfileImage> companyProfileImageList = [];
    for (Map<String, dynamic> element in json) {
      companyProfileImageList.add(CompanyProfileImage.fromJson(element));
    }
    return companyProfileImageList;
  }

  @override
  String toString() {
    return '''CompanyProfileImage(
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
    return other is CompanyProfileImage &&
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

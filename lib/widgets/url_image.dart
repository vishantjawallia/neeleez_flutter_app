import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:neeleez_flutter_app/config/palettes.dart';
import 'package:shimmer/shimmer.dart';

class UrlImage extends StatelessWidget {
  final String? url;
  final double? width;
  final double? height;
  const UrlImage({
    Key? key,
    this.width,
    this.height,
    this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (url == null) {
      return Container(
        child: Shimmer.fromColors(
          baseColor: Colors.grey,
          highlightColor: Colors.white,
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Palettes.white.withOpacity(0.7),
            ),
          ),
        ),
      );
    } else {
      return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Palettes.white),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(90),
          child: CachedNetworkImage(
            imageUrl: url!,
            fit: BoxFit.fill,
            progressIndicatorBuilder: (context, url, progress) {
              return const CircularProgressIndicator();
            },
          ),
        ),
      );
    }
  }
}

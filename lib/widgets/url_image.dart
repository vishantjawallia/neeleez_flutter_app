import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class UrlImage extends StatelessWidget {
  final double? width;
  final double? height;
  const UrlImage({Key? key, required this.width, required this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,

      child: CachedNetworkImage(
        imageUrl: '',
        fit: BoxFit.fill,
      ),
    );
  }


}

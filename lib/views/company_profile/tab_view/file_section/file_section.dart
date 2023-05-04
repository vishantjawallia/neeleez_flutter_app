// ignore_for_file: library_private_types_in_public_api

import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neeleez_flutter_app/config/palettes.dart';
import 'package:provider/provider.dart';

import '../../../../models/company/company_profile.dart';
import '../../../../widgets/custom_button.dart';
import 'file_section_provider.dart';

class FileSection extends StatefulWidget {
  final void Function(File? file) onUploadMedia;
  final List<CompanyImages>? companyImages;
  const FileSection({
    Key? key,
    required this.onUploadMedia,
    this.companyImages,
  }) : super(key: key);

  @override
  _FileSectionState createState() => _FileSectionState();
}

class _FileSectionState extends State<FileSection> {
  @override
  Widget build(BuildContext context) {
    final social = Provider.of<FileSectionProvider>(context);
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            _storageBox(),
            const SizedBox(height: 10),
            Text(
              'Upgrade Package For More Space',
              style: Get.textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w500, color: Palettes.black),
              textAlign: TextAlign.center,
            ),
            widget.companyImages != null
                ? ListView.builder(
                    itemCount: widget.companyImages!.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.only(top: 4, bottom: 20),
                    itemBuilder: (context, index) {
                      return Stack(
                        children: [
                          Container(
                            height: 240,
                            padding: const EdgeInsets.symmetric(horizontal: 50),
                            margin: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              border: Border.all(color: Palettes.primary),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            width: double.infinity,
                            child: CachedNetworkImage(
                              imageUrl: '${widget.companyImages![index].image}',
                              fit: BoxFit.fill,
                              progressIndicatorBuilder: (context, url, progress) {
                                return const Center(child: CircularProgressIndicator());
                              },
                              errorWidget: (context, url, error) => Container(
                                color: Palettes.grey2,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 4,
                            right: 4,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Container(
                                color: Palettes.white,
                                child: const Icon(
                                  Icons.cancel,
                                  color: Palettes.red,
                                  size: 30,
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  )
                : const SizedBox(),
            Align(
              alignment: Alignment.center,
              child: CustomButton(
                textColor: Palettes.white,
                width: 300,
                text: 'Upload File',
                backgroundColor: Palettes.primary,
                borderColor: Palettes.primary,
                onTap: () {
                  // return widget.onBusinessHoursSave!();
                },
              ),
            ),
            const SizedBox(height: 80),
          ],
        ),
      ),
    );
  }

  Material _storageBox() {
    return Material(
      color: Colors.transparent,
      elevation: 20,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
        decoration: BoxDecoration(
          color: Palettes.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: const LinearProgressIndicator(
                color: Palettes.primary,
                backgroundColor: Palettes.grey1,
                minHeight: 7,
                value: 0.020,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '253.00 KB',
                  style: Get.textTheme.titleSmall!.copyWith(fontWeight: FontWeight.w600, color: Palettes.black),
                ),
                Text(
                  '100.00 MB',
                  style: Get.textTheme.titleSmall!.copyWith(fontWeight: FontWeight.w600, color: Palettes.black),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

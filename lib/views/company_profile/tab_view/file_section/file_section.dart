// ignore_for_file: library_private_types_in_public_api, unused_local_variable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neeleez_flutter_app/config/palettes.dart';
import 'package:provider/provider.dart';

import '../../../../widgets/custom_button.dart';
import '../../company_profile_view_model.dart';
import 'file_section_provider.dart';

class FileSection extends StatefulWidget {
  // final void Function(File? file) onUploadMedia;
  // final List<CompanyImages>? companyImages;
  final CompanyProfileViewModel viewModel;
  const FileSection({
    Key? key,
    // required this.onUploadMedia,
    // this.companyImages,
    required this.viewModel,
  }) : super(key: key);

  @override
  _FileSectionState createState() => _FileSectionState();
}

class _FileSectionState extends State<FileSection> {
  @override
  Widget build(BuildContext context) {
    final fileSection = Provider.of<FileSectionProvider>(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _storageBox(),
          Text(
            'Upgrade Package For More Space',
            style: Get.textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w500, color: Palettes.black),
            textAlign: TextAlign.center,
          ),
          Flexible(
            fit: FlexFit.loose,
            child: widget.viewModel.cp!.companyImages != null
                ? ListView.builder(
                    itemCount: widget.viewModel.cp!.companyImages!.length,
                    shrinkWrap: true,
                    // physics: const NeverScrollableScrollPhysics(),
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
                              imageUrl: '${widget.viewModel.cp!.companyImages![index].image}',
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
          ),
          const SizedBox(height: 20),
          CustomButton(
            textColor: Palettes.white,
            width: 300,
            text: 'Upload File',
            backgroundColor: Palettes.primary,
            borderColor: Palettes.primary,
            onTap: () {
              fileSection.uploadFileHandler(context);
              // return widget.onBusinessHoursSave!();
            },
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Padding _storageBox() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 10),
      child: Material(
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
      ),
    );
  }
}

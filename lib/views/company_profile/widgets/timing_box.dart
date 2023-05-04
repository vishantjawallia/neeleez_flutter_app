// // import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:neeleez_flutter_app/models/company/timing.dart';

// import '../../../config/palettes.dart';

// class TimingBox extends StatelessWidget {
//   final List<TimingBoxItem>? items;
//   final CompanyDayDetailViewModels? obj;
//   final List<int>? closedTimingList;

//   final void Function(bool? value)? onSwitchChange;
//   final String? text;
//   final bool? switchValue;
//   final void Function()? onAddTap;
//   final void Function()? onCloseTap;

//   const TimingBox({
//     Key? key,
//     required this.text,
//     required this.obj,
//     required this.closedTimingList,
//     required this.items,
//     this.onSwitchChange,
//     this.switchValue,
//     this.onAddTap,
//     this.onCloseTap,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     // log("====>$closedTimingList");
//     // log("====>${obj!.companyTimes!.length}");
//     return Container(
//       padding: const EdgeInsets.only(top: 9, bottom: 4),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           SizedBox(
//             width: 100,
//             child: Text(
//               text ?? 'Monday',
//               style: Get.textTheme.bodyLarge!.copyWith(color: Palettes.grey3),
//             ),
//           ),
//           SizedBox(
//             width: 186,
//             child: Column(
//               children: items!,
//             ),
//           ),
//           Container(
//             width: 80,
//             // width: 19.w,
//             height: 22,
//             alignment: Alignment.topRight,
//             child: Switch(
//               value: switchValue!,
//               onChanged: onSwitchChange,
//               activeColor: Palettes.primary,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class TimingBoxItem extends StatelessWidget {
//   final String? startTiming;
//   final String? endTiming;
//   final bool? icon;
//   final bool? isHoliday;
//   final void Function()? onStartTimingTap;
//   final void Function()? onEndTimingTap;
//   final void Function()? onIconTap;
//   const TimingBoxItem({
//     super.key,
//     required this.onStartTimingTap,
//     required this.onEndTimingTap,
//     required this.startTiming,
//     required this.endTiming,
//     required this.icon,
//     required this.onIconTap,
//     this.isHoliday,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return isHoliday!
//         ? Align(
//             alignment: Alignment.centerLeft,
//             child: Container(
//               margin: const EdgeInsets.symmetric(horizontal: 16),
//               height: 36,
//               width: double.infinity,
//               alignment: Alignment.center,
//               decoration: BoxDecoration(
//                 color: Palettes.grey1,
//                 borderRadius: BorderRadius.circular(6),
//               ),
//               child: Text(
//                 'Closed',
//                 style: Get.textTheme.titleLarge!.copyWith(color: Palettes.black),
//                 textAlign: TextAlign.center,
//               ),
//             ),
//           )
//         : Padding(
//             padding: const EdgeInsets.only(bottom: 6),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               // crossAxisAlignment: CrossAxisAlignment.end,
//               children: [
//                 const SizedBox(
//                   width: 10,
//                 ),
//                 InkWell(
//                   onTap: onStartTimingTap,
//                   child: Container(
//                     padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 13),
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(6),
//                       border: Border.all(color: Palettes.primary),
//                     ),
//                     child: SizedBox(
//                       width: 35,
//                       child: Text(
//                         startTiming ?? '09:00'.tr,
//                         style: Get.textTheme.bodyMedium!.copyWith(
//                           color: Palettes.black,
//                         ),
//                         textAlign: TextAlign.left,
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(width: 8),
//                 InkWell(
//                   onTap: onEndTimingTap,
//                   child: Container(
//                     padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 13),
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(6),
//                       border: Border.all(color: Palettes.primary),
//                     ),
//                     child: SizedBox(
//                       width: 35,
//                       child: Text(
//                         endTiming ?? '16:00'.tr,
//                         style: Get.textTheme.bodyMedium!.copyWith(
//                           color: Palettes.black,
//                         ),
//                         textAlign: TextAlign.left,
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(width: 5),
//                 // !icon!
//                 //     ? GestureDetector(
//                 //         onTap: onCloseTap,
//                 //         child: const RotatedBox(
//                 //           quarterTurns: 90,
//                 //           child: CircleAvatar(
//                 //             radius: 10,
//                 //             backgroundColor: Palettes.red,
//                 //             child: Icon(
//                 //               Icons.cancel,
//                 //               color: Colors.white,
//                 //               size: 15,
//                 //             ),
//                 //           ),
//                 //         ),
//                 //       )
//                 //     : GestureDetector(
//                 //         onTap: onAddTap,
//                 //         child: const CircleAvatar(
//                 //           radius: 10,
//                 //           backgroundColor: Colors.green,
//                 //           child: Icon(
//                 //             Icons.add,
//                 //             color: Colors.white,
//                 //             size: 15,
//                 //           ),
//                 //         ),
//                 //       ),
//               ],
//             ),
//           );
//   }
// }

// // ignore_for_file: library_private_types_in_public_api

// import 'package:flutter/material.dart';

// import 'package:provider/provider.dart';

// import '../../staff_profile_view_model.dart';
// import 'tab_bar_provider2.dart';

// class TabBar1 extends StatelessWidget {
//   final StaffProfileViewModel viewModel;

//   const TabBar1(
//     this.viewModel, {
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider<ChangeNotifier>(
//       lazy: true,
//       create: (context) => TabBarProvider1(),

//       builder: (context, child) {
//         return Consumer<TabBarProvider1>(
//           builder: (context, provider, child) {
//             return SingleChildScrollView(
//               scrollDirection: Axis.vertical,
//               physics: const BouncingScrollPhysics(),
//               child: Container(
//                 padding: const EdgeInsets.symmetric(horizontal: 22),
//                 child: Column(
//                   children: [
//                     Text(
//                       '${provider.i}',
//                       style: const TextStyle(
//                         color: Colors.black,
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             );
//           },
//         );
//         // );
//       },
//     );
//     // child: ;
//   }
// }

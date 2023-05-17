import 'package:flutter/material.dart';
import 'package:neeleez_flutter_app/views/staff_profile/tab_view/tab_bar1/tab_bar_provider1.dart';
import 'package:provider/provider.dart';
import '../../staff_profile_view_model.dart';
// import '../tab_bar1 copy/tab_bar_provider1.dart';

class TabBar1 extends StatelessWidget {
  final StaffProfileViewModel viewModel;

  const TabBar1(
    this.viewModel, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TabBarProviderOne>(
      create: (context) => TabBarProviderOne(),
      child: Consumer<TabBarProviderOne>(
        builder: (context, provider, child) {
          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: const BouncingScrollPhysics(),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: provider.count,
                    child: Text(
                      '${provider.i}',
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

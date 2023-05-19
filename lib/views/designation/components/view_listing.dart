import 'package:flutter/material.dart';

import '../designation_view_model.dart';
import '../widgets/search_text_input.dart';
import '../widgets/signal_list_tile.dart';
// import '../widgets/search_text_input.dart';

class ViewListing extends StatelessWidget {
  const ViewListing(this.viewModel, {super.key});

  final DesignationViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SearchTextInput(
          controller: viewModel.searchController,
          focusNode: viewModel.searchFocusNode,
        ),
        const SizedBox(
          height: 10,
        ),
        Flexible(
          fit: FlexFit.loose,
          child: viewModel.desList != null
              ? ListView.builder(
                  itemCount: viewModel.desList!.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    return SingleListTile(
                      name: viewModel.desList![index].designationEn,
                      onCrossTap: () => viewModel.onCrossTap(context, viewModel.desList![index].id!),
                      onTap: viewModel.onSingleItemTap,
                    );
                  },
                )
              : const SizedBox(),
        ),
      ],
    );
  }
}

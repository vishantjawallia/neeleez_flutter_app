import 'package:flutter/material.dart';

import '../group_view_model.dart';
import '../widgets/search_text_input.dart';
import '../widgets/signal_list_tile.dart';

class ViewListing extends StatelessWidget {
  const ViewListing(this.viewModel, {super.key});

  final GroupViewModel viewModel;

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
          child: ListView.builder(
            itemCount: 1,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              return SingleListTile(
                onCrossTap: viewModel.onCrossTap,
                onTap: viewModel.onSingleItemTap,
              );
            },
          ),
        ),
      ],
    );
  }
}

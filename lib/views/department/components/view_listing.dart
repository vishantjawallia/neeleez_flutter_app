import 'package:flutter/material.dart';

import '../department_view_model.dart';
import '../widgets/search_text_input.dart';
import '../widgets/signal_list_tile.dart';

class ViewListing extends StatelessWidget {
  const ViewListing({
    super.key,
    required this.viewModel,
  });

  final DepartmentViewModel viewModel;

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
          child: viewModel.departList != null
              ? ListView.builder(
                  itemCount: viewModel.departList!.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    return SingleListTile(
                      name: viewModel.departList![index].name,
                      onCrossTap: () => viewModel.onCrossTap(context, viewModel.departList![index].depId!),
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

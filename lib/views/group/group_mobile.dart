part of group_view;

// ignore: must_be_immutable
class _GroupMobile extends StatelessWidget {
  final GroupViewModel viewModel;

  _GroupMobile(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultLayout(
        height: 151,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _appBar(),
              Flexible(
                child: Container(
                  padding: const EdgeInsets.only(top: 30),
                  child: !viewModel.isAddNew ? ViewListing(viewModel) : AddItem(viewModel),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column _appBar() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: viewModel.backOnTap,
          child: Container(
            padding: const EdgeInsets.only(top: 18),
            alignment: Alignment.centerLeft,
            child: const Icon(
              Icons.arrow_back_ios,
              color: Palettes.white,
            ),
          ),
        ),
        Container(
          height: 58,
          padding: const EdgeInsets.only(top: 14),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Group',
                style: Get.textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.w600),
              ),
              !viewModel.isAddNew
                  ? GestureDetector(
                      onTap: viewModel.addNewTap,
                      child: const Icon(
                        Icons.add_circle_outline_rounded,
                        color: Palettes.white,
                        size: 45,
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      ],
    );
  }
}

part of select_address_view;

// ignore: must_be_immutable
class _SelectAddressTablet extends StatelessWidget {
  final SelectAddressViewModel viewModel;

  const _SelectAddressTablet(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('SelectAddressTablet')),
    );
  }
}
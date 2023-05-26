part of select_address_view;

// ignore: must_be_immutable
class _SelectAddressDesktop extends StatelessWidget {
  final SelectAddressViewModel viewModel;

  const _SelectAddressDesktop(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('SelectAddressDesktop')),
    );
  }
}
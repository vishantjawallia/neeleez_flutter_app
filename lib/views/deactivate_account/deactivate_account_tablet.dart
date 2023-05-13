part of deactivate_account_view;

// ignore: must_be_immutable
class _DeactivateAccountTablet extends StatelessWidget {
  final DeactivateAccountViewModel viewModel;

  _DeactivateAccountTablet(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('DeactivateAccountTablet')),
    );
  }
}
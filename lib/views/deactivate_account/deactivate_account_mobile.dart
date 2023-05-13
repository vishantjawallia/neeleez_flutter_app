part of deactivate_account_view;

// ignore: must_be_immutable
class _DeactivateAccountMobile extends StatelessWidget {
  final DeactivateAccountViewModel viewModel;

  _DeactivateAccountMobile(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('DeactivateAccountMobile')),
    );
  }
}
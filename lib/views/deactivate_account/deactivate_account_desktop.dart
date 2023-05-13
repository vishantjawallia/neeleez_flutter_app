part of deactivate_account_view;

// ignore: must_be_immutable
class _DeactivateAccountDesktop extends StatelessWidget {
  final DeactivateAccountViewModel viewModel;

  _DeactivateAccountDesktop(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('DeactivateAccountDesktop')),
    );
  }
}
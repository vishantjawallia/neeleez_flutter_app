part of forget_password_view;

// ignore: must_be_immutable
class _ForgetPasswordTablet extends StatelessWidget {
  final ForgetPasswordViewModel viewModel;

  const _ForgetPasswordTablet(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('ForgetPasswordTablet')),
    );
  }
}
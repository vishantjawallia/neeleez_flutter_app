part of forget_password_view;

// ignore: must_be_immutable
class _ForgetPasswordDesktop extends StatelessWidget {
  final ForgetPasswordViewModel viewModel;

  const _ForgetPasswordDesktop(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('ForgetPasswordDesktop')),
    );
  }
}
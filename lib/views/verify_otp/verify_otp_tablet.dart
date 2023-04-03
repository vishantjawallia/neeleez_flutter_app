part of verify_otp_view;

// ignore: must_be_immutable
class _VerifyOtpTablet extends StatelessWidget {
  final VerifyOtpViewModel viewModel;

  const _VerifyOtpTablet(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('VerifyOtpTablet')),
    );
  }
}
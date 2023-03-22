part of verify_otp_view;

// ignore: must_be_immutable
class _VerifyOtpDesktop extends StatelessWidget {
  final VerifyOtpViewModel viewModel;

  _VerifyOtpDesktop(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('VerifyOtpDesktop')),
    );
  }
}
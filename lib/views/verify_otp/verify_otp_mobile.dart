part of verify_otp_view;

// ignore: must_be_immutable
class _VerifyOtpMobile extends StatelessWidget {
  final VerifyOtpViewModel viewModel;

  _VerifyOtpMobile(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('VerifyOtpMobile')),
    );
  }
}
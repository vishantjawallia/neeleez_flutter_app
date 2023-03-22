part of mobile_verification_view;

// ignore: must_be_immutable
class _MobileVerificationDesktop extends StatelessWidget {
  final MobileVerificationViewModel viewModel;

  const _MobileVerificationDesktop(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('MobileVerificationDesktop')),
    );
  }
}
part of mobile_verification_view;

// ignore: must_be_immutable
class _MobileVerificationTablet extends StatelessWidget {
  final MobileVerificationViewModel viewModel;

  const _MobileVerificationTablet(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('MobileVerificationTablet')),
    );
  }
}
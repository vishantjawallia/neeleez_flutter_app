part of splash_view;

// ignore: must_be_immutable
class _SplashDesktop extends StatelessWidget {
  final SplashViewModel viewModel;

  const _SplashDesktop(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('SplashDesktop')),
    );
  }
}
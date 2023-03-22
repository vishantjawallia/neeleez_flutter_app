part of splash_view;

// ignore: must_be_immutable
class _SplashTablet extends StatelessWidget {
  final SplashViewModel viewModel;

  const _SplashTablet(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('SplashTablet')),
    );
  }
}
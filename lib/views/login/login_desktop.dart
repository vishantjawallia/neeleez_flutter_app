part of login_view;

// ignore: must_be_immutable
class _LoginDesktop extends StatelessWidget {
  final LoginViewModel viewModel;

  const _LoginDesktop(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('LoginDesktop')),
    );
  }
}
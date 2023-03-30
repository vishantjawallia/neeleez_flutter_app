part of about_view;

// ignore: must_be_immutable
class _AboutTablet extends StatelessWidget {
  final AboutViewModel viewModel;

  _AboutTablet(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('AboutTablet')),
    );
  }
}
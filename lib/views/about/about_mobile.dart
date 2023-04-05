part of about_view;

// ignore: must_be_immutable
class _AboutMobile extends StatelessWidget {
  final AboutViewModel viewModel;

  _AboutMobile(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text(
        'AboutMobile',
        style: TextStyle(
          color: Palettes.black,
        ),
      )),
    );
  }
}

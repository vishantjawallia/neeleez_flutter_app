part of service_format_view;

// ignore: must_be_immutable
class _ServiceFormatDesktop extends StatelessWidget {
  final ServiceFormatViewModel viewModel;

  _ServiceFormatDesktop(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('ServiceFormatDesktop')),
    );
  }
}
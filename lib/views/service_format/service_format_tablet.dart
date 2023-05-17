part of service_format_view;

// ignore: must_be_immutable
class _ServiceFormatTablet extends StatelessWidget {
  final ServiceFormatViewModel viewModel;

  _ServiceFormatTablet(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('ServiceFormatTablet')),
    );
  }
}
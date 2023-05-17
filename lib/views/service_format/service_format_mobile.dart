part of service_format_view;

// ignore: must_be_immutable
class _ServiceFormatMobile extends StatelessWidget {
  final ServiceFormatViewModel viewModel;

  _ServiceFormatMobile(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('ServiceFormatMobile')),
    );
  }
}
part of company_profile_view;

// ignore: must_be_immutable
class _CompanyProfileTablet extends StatelessWidget {
  final CompanyProfileViewModel viewModel;

  _CompanyProfileTablet(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('CompanyProfileTablet')),
    );
  }
}
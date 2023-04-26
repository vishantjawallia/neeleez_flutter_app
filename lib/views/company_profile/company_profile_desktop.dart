part of company_profile_view;

// ignore: must_be_immutable
class _CompanyProfileDesktop extends StatelessWidget {
  final CompanyProfileViewModel viewModel;

  const _CompanyProfileDesktop(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('CompanyProfileDesktop')),
    );
  }
}
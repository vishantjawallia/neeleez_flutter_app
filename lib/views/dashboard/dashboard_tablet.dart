part of dashboard_view;

// ignore: must_be_immutable
class _DashboardTablet extends StatelessWidget {
  final DashboardViewModel viewModel;

  const _DashboardTablet(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('DashboardTablet')),
    );
  }
}
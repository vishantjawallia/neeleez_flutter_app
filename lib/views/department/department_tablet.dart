part of department_view;

// ignore: must_be_immutable
class _DepartmentTablet extends StatelessWidget {
  final DepartmentViewModel viewModel;

  const _DepartmentTablet(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('DepartmentTablet')),
    );
  }
}
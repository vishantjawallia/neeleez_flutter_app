part of department_view;

// ignore: must_be_immutable
class _DepartmentMobile extends StatelessWidget {
  final DepartmentViewModel viewModel;

  _DepartmentMobile(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('DepartmentMobile')),
    );
  }
}
part of department_view;

// ignore: must_be_immutable
class _DepartmentDesktop extends StatelessWidget {
  final DepartmentViewModel viewModel;

  _DepartmentDesktop(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('DepartmentDesktop')),
    );
  }
}
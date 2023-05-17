part of group_view;

// ignore: must_be_immutable
class _GroupDesktop extends StatelessWidget {
  final GroupViewModel viewModel;

  _GroupDesktop(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('GroupDesktop')),
    );
  }
}
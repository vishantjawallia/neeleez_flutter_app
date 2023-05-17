part of group_view;

// ignore: must_be_immutable
class _GroupTablet extends StatelessWidget {
  final GroupViewModel viewModel;

  _GroupTablet(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('GroupTablet')),
    );
  }
}
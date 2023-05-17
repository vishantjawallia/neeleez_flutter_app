part of group_view;

// ignore: must_be_immutable
class _GroupMobile extends StatelessWidget {
  final GroupViewModel viewModel;

  _GroupMobile(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('GroupMobile')),
    );
  }
}
part of notifications_view;

// ignore: must_be_immutable
class _NotificationsTablet extends StatelessWidget {
  final NotificationsViewModel viewModel;

  _NotificationsTablet(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('NotificationsTablet')),
    );
  }
}
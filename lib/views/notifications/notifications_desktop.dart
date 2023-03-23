part of notifications_view;

// ignore: must_be_immutable
class _NotificationsDesktop extends StatelessWidget {
  final NotificationsViewModel viewModel;

  _NotificationsDesktop(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('NotificationsDesktop')),
    );
  }
}
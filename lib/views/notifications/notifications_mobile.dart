part of notifications_view;

// ignore: must_be_immutable
class _NotificationsMobile extends StatelessWidget {
  final NotificationsViewModel viewModel;

  _NotificationsMobile(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('NotificationsMobile')),
    );
  }
}
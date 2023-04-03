part of payment_history_view;

// ignore: must_be_immutable
class _PaymentHistoryDesktop extends StatelessWidget {
  final PaymentHistoryViewModel viewModel;

  _PaymentHistoryDesktop(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('PaymentHistoryDesktop')),
    );
  }
}
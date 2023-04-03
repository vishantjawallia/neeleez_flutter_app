part of payment_history_view;

// ignore: must_be_immutable
class _PaymentHistoryTablet extends StatelessWidget {
  final PaymentHistoryViewModel viewModel;

  _PaymentHistoryTablet(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('PaymentHistoryTablet')),
    );
  }
}
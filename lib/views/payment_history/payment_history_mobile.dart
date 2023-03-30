part of payment_history_view;

// ignore: must_be_immutable
class _PaymentHistoryMobile extends StatelessWidget {
  final PaymentHistoryViewModel viewModel;

  _PaymentHistoryMobile(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('PaymentHistoryMobile')),
    );
  }
}
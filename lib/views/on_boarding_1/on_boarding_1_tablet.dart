part of on_boarding_1_view;

// ignore: must_be_immutable
class _OnBoarding1Tablet extends StatelessWidget {
  final OnBoarding1ViewModel viewModel;

  const _OnBoarding1Tablet(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('OnBoarding1Tablet')),
    );
  }
}
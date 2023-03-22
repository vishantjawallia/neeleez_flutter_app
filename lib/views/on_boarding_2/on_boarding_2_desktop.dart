part of on_boarding_2_view;

// ignore: must_be_immutable
class _OnBoarding2Desktop extends StatelessWidget {
  final OnBoarding2ViewModel viewModel;

  _OnBoarding2Desktop(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('OnBoarding2Desktop')),
    );
  }
}
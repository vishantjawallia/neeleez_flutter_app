part of on_boarding_3_view;

// ignore: must_be_immutable
class _OnBoarding3Desktop extends StatelessWidget {
  final OnBoarding3ViewModel viewModel;

  _OnBoarding3Desktop(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('OnBoarding3Desktop')),
    );
  }
}
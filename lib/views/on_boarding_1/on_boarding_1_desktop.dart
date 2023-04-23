part of on_boarding_1_view;

// ignore: must_be_immutable
class _OnBoarding1Desktop extends StatelessWidget {
  final OnBoarding1ViewModel viewModel;

  const _OnBoarding1Desktop(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('OnBoarding1Desktop',style: TextStyle(
          color: Palettes.black,
        ),)),
    );
  }
}
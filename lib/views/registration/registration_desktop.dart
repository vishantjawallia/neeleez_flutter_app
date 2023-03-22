part of registration_view;

// ignore: must_be_immutable
class _RegistrationDesktop extends StatelessWidget {
  final RegistrationViewModel viewModel;

  const _RegistrationDesktop(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('RegistrationDesktop')),
    );
  }
}
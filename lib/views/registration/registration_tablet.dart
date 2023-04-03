part of registration_view;

// ignore: must_be_immutable
class _RegistrationTablet extends StatelessWidget {
  final RegistrationViewModel viewModel;

  const _RegistrationTablet(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('RegistrationTablet')),
    );
  }
}
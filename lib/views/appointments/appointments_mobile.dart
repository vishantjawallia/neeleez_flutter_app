// ignore_for_file: prefer_const_constructors_in_immutables

part of appointments_view;

// ignore: must_be_immutable
class _AppointmentsMobile extends StatelessWidget {
  final AppointmentsViewModel viewModel;

  _AppointmentsMobile(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: DefaultLayout(
          height: 160,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(22, 22, 22, 22),
            child: Column(
              children: [
                _appBar(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column _appBar() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () => Get.back(),
          child: Container(
            padding: const EdgeInsets.only(top: 8),
            alignment: Alignment.centerLeft,
            child: const Icon(
              Icons.arrow_back_ios,
              color: Palettes.white,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 18),
          child: Text(
            'Appointments',
            style: Get.textTheme.headlineMedium!.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}

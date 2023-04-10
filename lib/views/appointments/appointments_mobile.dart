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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: Column(
              children: [
                Column(
                  children: [
                    InkWell(
                      onTap: () => Get.back(),
                      child: Container(
                        padding: EdgeInsets.only(top: 8),
                        alignment: Alignment.centerLeft,
                        child: const Icon(
                          Icons.arrow_back_ios,
                          color: Palettes.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 18),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Appointments',
                            style: Get.textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.w600),
                          ),
                          const Icon(
                            Icons.delete,
                            color: Palettes.white,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                // Center(
                //     child: Text(
                //   'AppointmentsMobile',
                //   style: TextStyle(
                //     color: Palettes.black,
                //   ),
                // )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

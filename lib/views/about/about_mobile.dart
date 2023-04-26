part of about_view;

// ignore: must_be_immutable
class _AboutMobile extends StatelessWidget {
  final AboutViewModel viewModel;

  _AboutMobile(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: DefaultLayout(
          height: 153,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(22, 18, 22, 0),
            child: Column(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                      child: Text(
                        'About',
                        style: Get.textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 82.h,
                  padding: EdgeInsets.only(top: 30),
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Image.asset(
                          MyImage.logo,
                          height: 130,
                          fit: BoxFit.fill,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

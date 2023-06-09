// ignore_for_file: unused_element

part of select_address_view;

// ignore: must_be_immutable
class _SelectAddressMobile extends StatelessWidget {
  final SelectAddressViewModel viewModel;

  const _SelectAddressMobile(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultLayout(
        height: 140,
        child: Column(
          children: [
            _appBar(),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(top: 21),
                child: _buildGoogleMap(),
              ),
              // Center(
              //   child: Text(
              //     'No Notifications Yet',
              //     style: Get.textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.w600, color: Palettes.black),
              //   ),
              // ),
            ),
          ],
        ),
      ),
    );
  }

  Padding _appBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 4),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              InkWell(
                onTap: viewModel.pickHandler,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 4),
                  decoration: BoxDecoration(
                    border: Border.all(color: Palettes.white),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Pick this',
                    style: Get.textTheme.bodyMedium!,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 18),
            child: Text(
              'Select Address',
              style: Get.textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }

  /* --------------- // build google maps to used inside widget --------------- */
  Widget _buildGoogleMap() {
    return GoogleMap(
      mapType: MapType.normal,
      trafficEnabled: false,
      compassEnabled: true,
      // cameraTargetBounds: CameraTargetBounds.unbounded,
      rotateGesturesEnabled: true,
      scrollGesturesEnabled: true,
      tiltGesturesEnabled: true,
      zoomControlsEnabled: true,
      zoomGesturesEnabled: true,
      myLocationButtonEnabled: false,
      myLocationEnabled: true,
      mapToolbarEnabled: true,
      markers: Set.of((viewModel.marker != null) ? [viewModel.marker!] : []),
      initialCameraPosition: CameraPosition(
        target: viewModel.initialPosition!,
        zoom: 14,
      ),
      onCameraMove: viewModel.onCameraMove,
      // gestureRecognizers: v ,
      onMapCreated: viewModel.onMapCreated,
      // onMapCreated: (GoogleMapController controller) async {
      //   _controller = controller;
      //   await _addMarker(28.7041, 77.1025);
      //   _mapLoading = false;
      // },
      onTap:viewModel.onTap,
    );
  }
}

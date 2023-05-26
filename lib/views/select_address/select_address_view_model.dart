import 'package:neeleez_flutter_app/models/company/cities.dart';
import 'package:stacked/stacked.dart';

class SelectAddressViewModel extends BaseViewModel {
  final Cities? city;
  //
  double? lat;
  double? long;
  String? address;

  SelectAddressViewModel(this.city) {
    loadItems();
  }

  // Add ViewModel specific code here
  Future<void> loadItems() async {
    setBusy(true);
    //Write your models loading codes here

    //Let other views to render again
    setBusy(false);
    notifyListeners();
  }

  void pickHandler() {}
}

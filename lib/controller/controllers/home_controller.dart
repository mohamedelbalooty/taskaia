import 'package:get/get.dart';
import '../../utils/constants.dart';
import '../../utils/helper/database_helper.dart';
import '../../utils/helper/storage_helper.dart';

class HomeController extends GetxController {
  int selectedTab = 0;

  void onTabChanged(int currentIndex) {
    selectedTab = currentIndex;
    update();
  }

  bool isOpenedDrawer = false;

  onDrawerChange(bool isOpened) {
    isOpenedDrawer = isOpened;
    update();
  }

  final DataBaseHelper dbHelper = DataBaseHelper.dbHelper;

  @override
  void onInit() {
    super.onInit();
    StorageHelper.setBoolData(key: onboardingKey, value: true);
    // NotificationHelper.iosRequestPermission();
  }

  @override
  void onClose() {
    dbHelper.closeDatabase();
    super.onClose();
  }
}

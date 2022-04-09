import 'package:get/get.dart';
import '../../utils/helper/database_helper.dart';

class HomeController extends GetxController {
  int selectedTab = 0;

  void onTabChanged(int currentIndex) {
    selectedTab = currentIndex;
    update();
  }

  final DataBaseHelper dbHelper = DataBaseHelper.dbHelper;

  @override
  void onClose() {
    dbHelper.closeDatabase();
    super.onClose();
  }
}

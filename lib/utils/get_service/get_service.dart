import 'package:get/get.dart';
import '../helper/notification_helper.dart';
import '../helper/storage_helper.dart';

class GetService extends GetxService{

  Future<GetService> init() async{
    await StorageHelper.initStorage();
    await NotificationHelper.initNotification();
    return this;
  }
}
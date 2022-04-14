import 'package:get/get.dart';
import '../helper/storage_helper.dart';

class GetService extends GetxService{

  Future<GetService> init() async{
    await StorageHelper.initStorage();
    return this;
  }
}
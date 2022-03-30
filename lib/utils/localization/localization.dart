import 'package:get/get.dart';
import 'langs/ar.dart';
import 'langs/en.dart';

class AppLocalization extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {'ar': ar, 'en': en};
}

import 'package:get/get.dart';
import '../../controller/bindings/home_binding.dart';
import '../../controller/bindings/onboarding_binding.dart';
import '../../view/home_view/home_view.dart';
import '../../view/onboarding_view/onboarding_view.dart';
import '../get_middleware/onboarding_middleware.dart';

class Routes {
  static const String initialRoute = RoutesPath.onboardingView;

  static List<GetPage> pageRoutes = [
    GetPage(
      name: RoutesPath.onboardingView,
      page: () => const OnboardingView(),
      binding: OnboardingBinding(),
      middlewares: [
        OnboardingMiddleware(),
      ],
    ),
    GetPage(
      name: RoutesPath.homeView,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
  ];
}

class RoutesPath {
  static const String onboardingView = '/onboardingView';
  static const String homeView = '/homeView';
}

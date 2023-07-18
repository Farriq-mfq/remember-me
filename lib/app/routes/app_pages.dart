import 'package:get/get.dart';
import 'package:remember_me/app/middlewares/auth_middleware.dart';
import 'package:remember_me/app/middlewares/guest_middleware.dart';
import 'package:remember_me/app/middlewares/onboarding_middleware.dart';

import '../modules/Calender/bindings/calender_binding.dart';
import '../modules/Calender/views/calender_view.dart';
import '../modules/Onboarding/bindings/onboarding_binding.dart';
import '../modules/Onboarding/views/onboarding_view.dart';
import '../modules/Profile/bindings/profile_binding.dart';
import '../modules/Profile/views/profile_view.dart';
import '../modules/Welcome/bindings/welcome_binding.dart';
import '../modules/Welcome/views/welcome_view.dart';
import '../modules/category/bindings/category_binding.dart';
import '../modules/category/views/category_view.dart';
import '../modules/history/bindings/history_binding.dart';
import '../modules/history/views/history_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.ONBOARDING;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
      transition: Transition.noTransition,
      middlewares: [
        AuthMiddleware(),
      ],
    ),
    GetPage(
        name: _Paths.ONBOARDING,
        page: () => const OnboardingView(),
        binding: OnboardingBinding(),
        transition: Transition.noTransition,
        middlewares: [OnboardingMiddleware()]),
    GetPage(
        name: _Paths.WELCOME,
        page: () => const WelcomeView(),
        binding: WelcomeBinding(),
        transition: Transition.noTransition,
        middlewares: [
          GuestMiddleware(),
        ]),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
      transition: Transition.noTransition,
      middlewares: [
        GuestMiddleware(),
      ],
    ),
    GetPage(
        name: _Paths.REGISTER,
        page: () => const RegisterView(),
        binding: RegisterBinding(),
        transition: Transition.noTransition,
        middlewares: [
          GuestMiddleware(),
        ]),
    GetPage(
      name: _Paths.CATEGORY,
      page: () => const CategoryView(),
      binding: CategoryBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.CALENDER,
      page: () => const CalenderView(),
      binding: CalenderBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.HISTORY,
      page: () => const HistoryView(),
      binding: HistoryBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
        name: _Paths.PROFILE,
        page: () => const ProfileView(),
        binding: ProfileBinding(),
        transition: Transition.noTransition,
        middlewares: [
          AuthMiddleware(),
        ]),
  ];
}

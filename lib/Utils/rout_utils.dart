
import 'package:get/get.dart';

import '../Views/Home/home_screen.dart';
import '../Views/Roles/roles_screen.dart';
import '../Views/SelectRoles/select_roles_screen.dart';
import '../Views/ShowRoles/show_roles_screen.dart';
import '../Views/Splash/splash_screen.dart';


class NameRouts{
  static const String splash = '/splash';
  static const String home = '/home';
  static const String selectRoles = '/selectRoles';
  static const String showRoles = '/showRoles';
  static const String roles = '/roles';
}

class PageRout {
  static List<GetPage> pages = [
    GetPage(
      name: NameRouts.splash,
      page: () => SplashScreen(),
      transition: Transition.size,
      transitionDuration: const Duration(milliseconds: 500)
    ),

    GetPage(
      name: NameRouts.home,
      page: () => HomeScreen(),
      transition: Transition.size,
      transitionDuration: const Duration(milliseconds: 3000)
    ),
    GetPage(
      name: NameRouts.selectRoles,
      page: () => SelectRolesScreen(),
      transition: Transition.size,
      transitionDuration: const Duration(milliseconds: 500)
    ),
    GetPage(
      name: NameRouts.showRoles,
      page: () => ShowRolesScreen(),
      transition: Transition.size,
      transitionDuration: const Duration(milliseconds: 500)
    ),
    GetPage(
      name: NameRouts.roles,
      page: () => RolesScreen(),
      transition: Transition.size,
      transitionDuration: const Duration(milliseconds: 500)
    ),
  ];
}
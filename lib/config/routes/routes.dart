import '../../exports.dart';

class AppRoutes {
  static final List<GetPage> pages = [
    GetPage(
      name: AppLinks.splash_screen,
      page: () => splash_screen(),
    ),
    GetPage(
      name: AppLinks.home_screen,
      page: () => home_screen(),
    ),
  ];
}

class AppLinks {
  static const splash_screen = '/splash_screen';
  static const home_screen = '/home_screen';
}

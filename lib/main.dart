import 'package:flutter_bloc/flutter_bloc.dart' hide Transition;

import 'exports.dart';
import 'view/screens/home_screen/controller/category_controller_cubit.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(BlocProvider<category_controller_Cubit>(
    create: (context) => category_controller_Cubit(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      title: "Test APP",
      theme: lightTheme,
      themeMode: ThemeMode.light,
      initialRoute: AppLinks.splash_screen,
      defaultTransition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 500),
      getPages: AppRoutes.pages,
    );
  }
}

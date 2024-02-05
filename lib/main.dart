import 'package:e_shop/provider/app_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:e_shop/Routes/app_navigation.dart';
import 'package:e_shop/Routes/app_navigation_routes.dart';
import 'package:e_shop/Routes/route_generator.dart';
import 'package:e_shop/utlis/theme/theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppProvider(),
      child: ScreenUtilInit(
        designSize: const Size(420, 950),
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'E Shop App',
            navigatorKey: AppNavigation.navigationKey,
            initialRoute: AppNavRoutes.initialRoute,
            onGenerateRoute: RouteGenerator.generateRoute,
            themeMode: ThemeMode.system,
            theme: EAppTheme.lightTheme,
            darkTheme: EAppTheme.darkTheme,
          );
        },
      ),
    );
  }
}

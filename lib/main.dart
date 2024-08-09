import 'package:crystal_test/controller/ui_controller.dart';
import 'package:crystal_test/utils/colors.dart';
import 'package:crystal_test/view/navigation_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UiController>(create: (_) => UiController())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Crystal Test',
        theme: ThemeData(
          scaffoldBackgroundColor: ColorResource.white,
          appBarTheme: AppBarTheme(
            backgroundColor: ColorResource.white,
          ),
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepPurple,
          ),
          useMaterial3: true,
        ),
        home: NavigationPage(),
      ),
    );
  }
}

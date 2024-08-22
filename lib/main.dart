import 'package:assignment_app/feature/home/ui/home.dart';
import 'package:assignment_app/helper/shared_prefernce_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPrefernceHelper.customSharedPreferences.initPrefs();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      title: 'Flutter Demo',
      home: Home(),
    );
  }
}

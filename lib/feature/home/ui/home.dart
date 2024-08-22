import 'package:assignment_app/feature/history/ui/history.dart';
import 'package:assignment_app/feature/home/model/home_model.dart';
import 'package:assignment_app/feature/home/viewmodel/home_view_model.dart';
import 'package:assignment_app/widget/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;
  static const List<Widget> screens = <Widget>[
    MainScreen(),
    History(),
    Text('Profile Page', style: TextStyle(fontSize: 24)),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavBarHome(
        onIndexChanged: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
      ),
      body: SafeArea(child: screens[selectedIndex]),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  HomeViewModel homeViewModel = Get.put(HomeViewModel());
  @override
  void initState() {
    super.initState();
    homeViewModel.getImageData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Obx(
          () {
            if (homeViewModel.homeData.value == null) {
              return const Center(
                child: SizedBox(
                    height: 50, width: 50, child: CircularProgressIndicator()),
              );
            } else {
              return SingleChildScrollView(
                child: Column(children: [
                  Image.network(homeViewModel.homeData.value?.message ?? ''),
                  const SizedBox(
                    height: 40,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        // homeViewModel.homeData.value = null;
                        homeViewModel.getImageData();
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black, elevation: 0),
                      child: const Text(
                        'Fetch Image',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ))
                ]),
              );
            }
          },
        ));
  }
}

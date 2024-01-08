import 'package:flutter/material.dart';
import 'package:shalimar/Home_Screen/customer_activities_screen.dart';
import 'package:shalimar/Home_Screen/customer_attendance_screen.dart';
import 'package:shalimar/Home_Screen/customer_home_screen.dart';
import 'package:shalimar/Home_Screen/customer_setting_screen.dart';
import 'package:shalimar/Home_Screen/customer_support_screen.dart';
import 'package:shalimar/utils/colors.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isSwitch = false;

  late PageController _pageController;
  int _page = 0;

  void navigationTapped(int page) {
    _pageController.jumpToPage(page);
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  void onPageChanged(int page) {
    setState(() {
      this._page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: onPageChanged,
        children: <Widget>[
          CustomerHomeScreen(),
          CustomerAttendanceScreen(),
          CustomerActivityScreen(),
          CustomerSupportScreen(),
          CustomerSettingScreen(),

        ],
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(15),
          topLeft: Radius.circular(15),
        ),
        child: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Colors.white,
            primaryColor: Theme.of(context).colorScheme.secondary,
            textTheme: Theme.of(context).textTheme.copyWith(
                  bodySmall: TextStyle(color: blackTextColor),
                ),
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: primaryColor,
            selectedLabelStyle: TextStyle(color: primaryColor),
            unselectedItemColor: blackTextColor,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.waving_hand),
                label: 'Attendance',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.fact_check_outlined),
                label: 'Activities',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.support_agent),
                label: 'Support',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Settings',
              ),
            ],
            onTap: navigationTapped,
            currentIndex: _page,
          ),
        ),
      ),
    );
  }
}

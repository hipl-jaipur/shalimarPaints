import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shalimar/Home_Screen/customer_attendance_screen.dart';
import 'package:shalimar/Home_Screen/customer_home_screen.dart';
import 'package:shalimar/Home_Screen/customer_setting_screen.dart';
import 'package:shalimar/Home_Screen/customer_support_screen.dart';
import 'package:shalimar/utils/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'customer_activity_screen.dart';

class MyHomePage extends StatefulWidget {
  String EmployeeName;
  String Email;
  String DesignationName;

  MyHomePage(
      {super.key,
      required this.EmployeeName,
      required this.Email,
      required this.DesignationName});

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

  Position? _currentPosition;

  Future<void> _getCurrentPosition() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final hasPermission = await _handleLocationPermission();
    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      if (this.mounted) {
        setState(() {
          _currentPosition = position;
          prefs.setDouble('LAT', _currentPosition!.latitude ?? 0.0);
          prefs.setDouble('LNG', _currentPosition!.longitude ?? 0.0);
        });
      }
    }).catchError((e) {
      debugPrint(e);
    });
  }

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services')));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }

  @override
  void initState() {
    super.initState();
    getId();
    _getCurrentPosition();
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
  getId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    employeeId = prefs.getInt("EmployeeId")!;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: onPageChanged,
        children: <Widget>[
          CustomerHomeScreen(
              EmployeeName: widget.EmployeeName,
              Email: widget.Email,
              DesignationName: widget.DesignationName),
          CustomerAttendanceScreen(tag: true, id: 0,),
          CustomerActivityScreen(tag: '', id:employeeId,),
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

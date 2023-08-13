import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shg/screens/LearnScreen.dart';
import 'package:shg/screens/alertScreen.dart';
import 'package:shg/screens/communityScreen.dart';
import 'package:shg/screens/emergencyScreen.dart';
import 'package:shg/screens/reportScreen.dart';
import 'conts/my_flutter_app_icons.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _bottomNavIndex = 0;
  bool emergency = false;
  List<IconData> iconList = [
    CupertinoIcons.bell_fill,
    CupertinoIcons.book_fill,
    Icons.supervised_user_circle_rounded,
    Icons.report
  ];

  List<Widget> screenList = [
    const AlertScreen(),
    const LearnScreen(),
    const CommunityScreen(),
    const ReportScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: emergency
          ? const EmergencyScreen()
          : screenList[_bottomNavIndex], //destination screen
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        autofocus: true,
        child: const Text("SOS", style: TextStyle(fontWeight: FontWeight.bold),),
        onPressed: () {
          setState(() {
            emergency = !emergency;
          });

        },
        //params
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        backgroundColor: Colors.black54,
        inactiveColor: Colors.white,
        activeColor: emergency ? Colors.white : Colors.red,
        icons: iconList,
        activeIndex: _bottomNavIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.verySmoothEdge,
        leftCornerRadius: 20,
        rightCornerRadius: 20,
        onTap: (index) => setState(() {
          _bottomNavIndex = index;
          emergency = false;
        }),
        //other params
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:we_coin/view/dashboard/navigation_pages/home_page/home_page.dart';

import '../../utils/image_manager.dart';
import 'navigation_pages/recived_money/recived_money.dart';
import 'navigation_pages/send_money/send_money.dart';
import 'navigation_pages/transfer/trasfer_page.dart';
import 'navigation_pages/wallats/wallat.dart';

class MyNavigationBar extends StatefulWidget {
  MyNavigationBar({Key? key}) : super(key: key);

  @override
  _MyNavigationBarState createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    HomePageScreen(),
    TransferNavigationPage(),
    SendMoneyPageScreen(),
    RecivedMoneyPageScreen(),
    WallatPageScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Image.asset(ImageManager.bottom_one, height: 25),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(ImageManager.bottom_two, height: 25),
              label: 'Transfer',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(ImageManager.bottom_three, height: 25),
              label: 'Send',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(ImageManager.bottom_four, height: 25),
              label: 'Recived',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(ImageManager.bottom_five, height: 25),
              label: 'Wallat',
            ),
          ],
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.black,
          iconSize: 20,
          onTap: _onItemTapped,
          elevation: 5),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:we_coin/view/dashboard/navigation_pages/home_page/home_page.dart';
import 'package:we_coin/view/dashboard/settings/settings.dart';

import '../../utils/color_manager.dart';
import '../../utils/image_manager.dart';
import 'drawer.dart';
import 'navigation_pages/deposit/deposit.dart';
import 'navigation_pages/dispute/dispute.dart';
import 'navigation_pages/notification/notification.dart';
import 'navigation_pages/profile/edit_profile.dart';
import 'navigation_pages/profile/profile_page.dart';
import 'navigation_pages/recived_money/recived_money.dart';
import 'navigation_pages/send_money/send_money.dart';
import 'navigation_pages/tickets/tickets.dart';
import 'navigation_pages/transfer/trasfer_page.dart';
import 'navigation_pages/wallats/wallat.dart';

class DrawerItem {
  String? title;
  Widget? icon;
  DrawerItem(this.title, this.icon);
}

class MyNavigationBar extends StatefulWidget {
  MyNavigationBar({Key? key}) : super(key: key);
  final drawerItems = [
    new DrawerItem(
        "Home",
        Icon(
          Icons.home,
          color: ColorsManager.COLOR_BLACK,
          size: 20,
        )),
    new DrawerItem(
        "My Profiles",
        Image.asset(
          ImageManager.drawer_one,
          height: 20,
          width: 20,
        )),
    new DrawerItem(
        "Notification",
        Icon(
          Icons.search,
          color: ColorsManager.COLOR_BLACK,
          size: 20,
        )),
    new DrawerItem(
        "Send Money",
        Image.asset(
          ImageManager.drawer_four,
          height: 20,
          width: 20,
        )),
    new DrawerItem(
        "Recive Money",
        Image.asset(
          ImageManager.drawer_two,
          height: 20,
          width: 20,
        )),
    new DrawerItem(
        "Tikets",
        Image.asset(
          ImageManager.drawer_five,
          height: 20,
          width: 20,
        )),
    new DrawerItem(
        "Diposit",
        Icon(
          Icons.error_outline_outlined,
          color: ColorsManager.COLOR_BLACK,
          size: 20,
        )),
    new DrawerItem(
        "Dispute",
        Icon(
          Icons.error_outline_outlined,
          color: ColorsManager.COLOR_BLACK,
          size: 20,
        )),
    new DrawerItem(
        "Setting",
        Icon(
          Icons.settings,
          color: ColorsManager.COLOR_BLACK,
          size: 20,
        )),
  ];

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

  int _selectedDrawerIndex = 0;

  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return MyNavigationBar();
      case 1:
        return new ProfilePageScreen();
      case 2:
        return new NotificationPageScreen();
      case 3:
        return new SendMoneyPageScreen();
      case 4:
        return new RecivedMoneyPageScreen();
      case 5:
        return new TicketsPageScreen();
      case 6:
        return new DepositPageScreen();
      case 7:
        return new DisputedPageScreen();
      case 8:
        return new SettingScreen();

      default:
        return new Text("Error");
    }
  }

  _onSelectItem(int index) {
    setState(() => _selectedDrawerIndex = index);
    Navigator.of(context).pop(); // close the drawer
  }

  @override
  Widget build(BuildContext context) {
    var drawerOptions = <Widget>[];
    for (var i = 0; i < widget.drawerItems.length; i++) {
      var d = widget.drawerItems[i];
      drawerOptions.add(ListTile(
          visualDensity: VisualDensity(horizontal: 0, vertical: -4),
          dense: true,
          minLeadingWidth: 20,
          leading: d.icon ?? null,
          title: new Text(d.title!) ?? Divider(),
          selected: i == _selectedDrawerIndex,
          onTap: () => _onSelectItem(i)));
    }
    int activeIndex = 0;
    void changeActivePage(int index) {
      setState(() {
        activeIndex = index;
      });
    }

    return Scaffold(
      drawer: new Drawer(
        child: new Column(
          children: <Widget>[
            new UserAccountsDrawerHeader(
                accountName: new Text("John Doe"), accountEmail: null),
            new Column(children: drawerOptions)
          ],
        ),
      ),
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

Widget createDrawerHeader() {
  return DrawerHeader(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill, image: AssetImage('images/bg_header.jpeg'))),
      child: Stack(children: <Widget>[
        Positioned(
            bottom: 12.0,
            left: 16.0,
            child: Text("Welcome to Flutter",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500))),
      ]));
}

Widget createDrawerBodyItem(
    {IconData? icon, String? text, GestureTapCallback? onTap}) {
  return ListTile(
    title: Row(
      children: <Widget>[
        Icon(icon),
        Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Text(text!),
        )
      ],
    ),
    onTap: onTap,
  );
}

class pageRoutes {
  static const String home = ProfilePageScreen.routeName;
}

class navigationDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          createDrawerHeader(),
          createDrawerBodyItem(
            icon: Icons.home,
            text: 'Home',
            onTap: () =>
                Navigator.pushReplacementNamed(context, pageRoutes.home),
          ),
          ListTile(
            title: Text('App version 1.0.0'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

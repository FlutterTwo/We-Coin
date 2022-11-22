import 'package:flutter/material.dart';
import 'package:we_coin/utils/image_manager.dart';
import 'package:we_coin/view/auth/forgot.dart';
import 'package:we_coin/view/auth/sign_up.dart';
import 'package:we_coin/view/dashboard/navigation_pages/profile/profile_page.dart';
import 'package:we_coin/view/dashboard/navigation_pages/transfer/trasfer_page.dart';
import 'package:we_coin/view/dashboard/navigation_pages/withdraw/withdraw_page.dart';

import '../../utils/color_manager.dart';
import '../auth/login.dart';
import 'navbar.dart';
import 'navigation_pages/deposit/deposit.dart';

import 'navigation_pages/home_page/home_page.dart';
import 'navigation_pages/notification/notification.dart';
import 'navigation_pages/recived_money/recived_money.dart';
import 'navigation_pages/send_money/send_money.dart';
import 'navigation_pages/tickets/tickets.dart';

class DrawerItem {
  String? title;
  Widget? icon;
  DrawerItem(this.title, this.icon);
}

class Dashboard extends StatefulWidget {
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
        "Dispute",
        Icon(
          Icons.error_outline_outlined,
          color: ColorsManager.COLOR_BLACK,
          size: 20,
        )),
  ];

  @override
  State<StatefulWidget> createState() {
    return new DashboardState();
  }
}

class DashboardState extends State<Dashboard> {
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
      drawerOptions.add(new ListTile(
        visualDensity: VisualDensity(horizontal: 0, vertical: -4),
        dense: true,
        minLeadingWidth: 20,
        leading: d.icon ?? null,
        title: new Text(d.title!),
        selected: i == _selectedDrawerIndex,
        onTap: () => _onSelectItem(i),
      ));
    }
    int activeIndex = 0;
    void changeActivePage(int index) {
      setState(() {
        activeIndex = index;
      });
    }

    final GlobalKey<ScaffoldState> _scaffoldKey =
        new GlobalKey<ScaffoldState>();
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

      // body: pages[activeIndex],
      body: _getDrawerItemWidget(_selectedDrawerIndex),
    );
  }
}

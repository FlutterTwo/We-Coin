import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:line_chart/charts/line-chart.widget.dart';
import 'package:line_chart/model/line-chart.model.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:we_coin/utils/color_manager.dart';
import 'package:we_coin/utils/image_manager.dart';
import 'package:we_coin/view/dashboard/drawer.dart';
import 'package:we_coin/view/dashboard/navigation_pages/profile/profile_page.dart';

import '../../../../model/graphs.dart';
import '../../navbar.dart';

class TransactionPageScreen extends StatefulWidget {
  static const String routeName = '/homePage';
  const TransactionPageScreen({Key? key}) : super(key: key);

  @override
  State<TransactionPageScreen> createState() => _TransactionPageScreenState();
}

class _TransactionPageScreenState extends State<TransactionPageScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  List<LineChartModel> data = [
    LineChartModel(amount: 100, date: DateTime(2020, 1, 1)),
    LineChartModel(amount: 200, date: DateTime(2020, 1, 2)),
    LineChartModel(amount: 300, date: DateTime(2020, 1, 3)),
    LineChartModel(amount: 400, date: DateTime(2020, 1, 4)),
    LineChartModel(amount: 800, date: DateTime(2020, 1, 5)),
    LineChartModel(amount: 200, date: DateTime(2020, 1, 6)),
    LineChartModel(amount: 140, date: DateTime(2020, 1, 8)),
    LineChartModel(amount: 110, date: DateTime(2020, 1, 9)),
    LineChartModel(amount: 250, date: DateTime(2020, 1, 10)),
    LineChartModel(amount: 390, date: DateTime(2020, 1, 11)),
    LineChartModel(amount: 900, date: DateTime(2020, 1, 12)),
  ];

  int _counter = 0;

  late List<_ChartData> data1;
  late TooltipBehavior _tooltip;

  @override
  void initState() {
    data1 = [
      _ChartData('CHN', 12),
      _ChartData('GER', 15),
      _ChartData('RUS', 30),
      _ChartData('BRZ', 6.4),
      _ChartData('IND', 14),
      _ChartData('Pak', 14),
    ];
    _tooltip = TooltipBehavior(enable: true);
    super.initState();
  }

  ///bottom Grid
  List<String> _text2 = ['تريد النجاح', 'اشعر'];
  List<String> list2 = [
    ImageManager.notification_bill,
    ImageManager.notification_bill
  ];
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    Text('Home Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Search Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Profile Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Paint circlePaint = Paint()..color = Colors.black;

    Paint insideCirclePaint = Paint()..color = Colors.white;

    Paint linePaint = Paint()
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke
      ..color = ColorsManager.WHITE_COLOR;

    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Image.asset(ImageManager.bottom_one, height: 25),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(ImageManager.bottom_two, height: 25),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(ImageManager.bottom_three, height: 25),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(ImageManager.bottom_four, height: 25),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(ImageManager.bottom_five, height: 25),
                label: 'Home',
              ),
            ],
            type: BottomNavigationBarType.fixed,
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.black,
            iconSize: 20,
            onTap: _onItemTapped,
            elevation: 5),
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: false,
            elevation: 0,
            backwardsCompatibility: false,
            foregroundColor: ColorsManager.COLOR_BLACK,
            centerTitle: true,
            leading: InkWell(
                onTap: () => Scaffold.of(context).openDrawer(),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(ImageManager.drawer_icon),
                )),
            title: Text("Dashboard"),
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () => Get.to(ProfilePageScreen()),
                  child: CircleAvatar(
                    child: Image.asset(ImageManager.user_pro),
                  ),
                ),
              )
            ]),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 126,
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: ColorsManager.YELLOWBUTTON_COLOR),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Bitcoin",
                                style:
                                    TextStyle(color: ColorsManager.WHITE_COLOR),
                              ),
                              CircleAvatar(
                                radius: 10,
                                backgroundColor: ColorsManager.WHITE_COLOR,
                                child: Icon(
                                  Icons.currency_bitcoin,
                                  size: 16,
                                ) /*Image.asset(ImageManager.app_name)*/,
                              )
                            ],
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "4,351 ETH",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: ColorsManager.WHITE_COLOR,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16.sp),
                            ),
                          ),
                          LineChart(
                            width: 100,
                            height: 30,
                            data: data,
                            linePaint: linePaint,
                            showPointer: true,
                            showCircles: false,
                            linePointerDecoration: BoxDecoration(
                              color: ColorsManager.WHITE_COLOR,
                            ),
                            pointerDecoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: ColorsManager.WHITE_COLOR,
                            ),
                            insideCirclePaint: insideCirclePaint,
                            onValuePointer: (LineChartModelCallback value) {
                              print('${value.chart} ${value.percentage}');
                            },
                            onDropPointer: () {
                              print('onDropPointer');
                            },
                          ),
                          Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "\S125,0",
                                style:
                                    TextStyle(color: ColorsManager.WHITE_COLOR),
                              ),
                              Text(
                                "+51\%",
                                style:
                                    TextStyle(color: ColorsManager.WHITE_COLOR),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: Container(
                      height: 126,
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: ColorsManager.COLOR_BLACK),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Bitcoin",
                                style:
                                    TextStyle(color: ColorsManager.WHITE_COLOR),
                              ),
                              CircleAvatar(
                                radius: 10,
                                backgroundColor: ColorsManager.WHITE_COLOR,
                                child: Icon(
                                  Icons.currency_bitcoin,
                                  size: 16,
                                ) /*Image.asset(ImageManager.app_name)*/,
                              )
                            ],
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "4,351 ETH",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: ColorsManager.WHITE_COLOR,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16.sp),
                            ),
                          ),
                          LineChart(
                            width: 100,
                            height: 30,
                            data: data,
                            linePaint: linePaint,
                            showPointer: true,
                            showCircles: false,
                            linePointerDecoration: BoxDecoration(
                              color: ColorsManager.WHITE_COLOR,
                            ),
                            pointerDecoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: ColorsManager.WHITE_COLOR,
                            ),
                            insideCirclePaint: insideCirclePaint,
                            onValuePointer: (LineChartModelCallback value) {
                              print('${value.chart} ${value.percentage}');
                            },
                            onDropPointer: () {
                              print('onDropPointer');
                            },
                          ),
                          Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "\S125,0",
                                style:
                                    TextStyle(color: ColorsManager.WHITE_COLOR),
                              ),
                              Text(
                                "+51\%",
                                style:
                                    TextStyle(color: ColorsManager.WHITE_COLOR),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: Container(
                      height: 126,
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: ColorsManager.DASHBOARD_FIRST_COLOR),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Bitcoin",
                                style:
                                    TextStyle(color: ColorsManager.WHITE_COLOR),
                              ),
                              CircleAvatar(
                                radius: 10,
                                backgroundColor: ColorsManager.WHITE_COLOR,
                                child: Icon(
                                  Icons.currency_bitcoin,
                                  size: 16,
                                ) /*Image.asset(ImageManager.app_name)*/,
                              )
                            ],
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "4,351 ETH",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: ColorsManager.WHITE_COLOR,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16.sp),
                            ),
                          ),
                          LineChart(
                            width: 100,
                            height: 30,
                            data: data,
                            linePaint: linePaint,
                            showPointer: true,
                            showCircles: false,
                            linePointerDecoration: BoxDecoration(
                              color: ColorsManager.WHITE_COLOR,
                            ),
                            pointerDecoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: ColorsManager.WHITE_COLOR,
                            ),
                            insideCirclePaint: insideCirclePaint,
                            onValuePointer: (LineChartModelCallback value) {
                              print('${value.chart} ${value.percentage}');
                            },
                            onDropPointer: () {
                              print('onDropPointer');
                            },
                          ),
                          Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "\S125,0",
                                style:
                                    TextStyle(color: ColorsManager.WHITE_COLOR),
                              ),
                              Text(
                                "+51\%",
                                style:
                                    TextStyle(color: ColorsManager.WHITE_COLOR),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              /////// new design graphs
              /*charts.Barchart(series, animate: true)*/
              //// new column start
              SizedBox(height: 20.h),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.r)),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  height: 200,
                  child: SfCartesianChart(
                      plotAreaBorderWidth: 0,
                      borderWidth: 0,
                      primaryYAxis: CategoryAxis(isVisible: false),
                      enableSideBySideSeriesPlacement: false,
                      enableAxisAnimation: false,
                      primaryXAxis: CategoryAxis(
                        axisLine: AxisLine(width: 0),
                        majorGridLines: MajorGridLines(width: 0),
                      ),
                      tooltipBehavior: _tooltip,
                      series: <ChartSeries<_ChartData, String>>[
                        ColumnSeries<_ChartData, String>(
                            dataSource: data1,
                            xValueMapper: (_ChartData data, _) => data.x,
                            yValueMapper: (_ChartData data, _) => data.y,
                            color: Color.fromRGBO(8, 142, 255, 1))
                      ]),
                ),
              ),
              SizedBox(height: 20.h),
              Container(
                padding: EdgeInsets.all(12),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Recent Transactions",
                          style: TextStyle(
                            color: ColorsManager.COLOR_GRAY,
                            fontSize: 14.sp,
                          ),
                        ),
                        Text("See All", style: TextStyle()),
                      ],
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        child: Image.asset(ImageManager.user_pro),
                      ),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Bitcoin"),
                          Text("Type",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: ColorsManager.COLOR_GRAY)),
                          SizedBox(height: 10.h)
                        ],
                      ),
                      subtitle: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("12/02/22",
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: ColorsManager.COLOR_GRAY,
                              )),
                          Text("Send",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: ColorsManager.COLOR_BLACK)),
                          SizedBox(height: 10.h)
                        ],
                      ),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "\$750.00",
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "Completed",
                            style: TextStyle(color: ColorsManager.COLOR_GREEN),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}

class _ChartData {
  _ChartData(this.x, this.y);

  final String x;
  final double y;
}

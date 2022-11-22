import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../utils/color_manager.dart';
import '../../../../utils/image_manager.dart';
import 'dart:math' as math;

class TransferNavigationPage extends StatefulWidget {
  const TransferNavigationPage({Key? key}) : super(key: key);

  @override
  State<TransferNavigationPage> createState() => _TransferNavigationPageState();
}

class _TransferNavigationPageState extends State<TransferNavigationPage> {
  late List<_ChartData> data1;
  late TooltipBehavior _tooltip;

  @override
  void initState() {
    data1 = [
      _ChartData('2001', 12),
      _ChartData('2002', 15),
      _ChartData('2005', 30),
      _ChartData('2007', 6.4),
      _ChartData('2015', 14),
    ];
    _tooltip = TooltipBehavior(enable: true);
    super.initState();
  }

  ///bottom Grid
  List<String> _text2 = [
    'Bitcoin',
    'Litecoin',
    'Wecoin',
  ];
  List<String> _text3 = [
    'Send',
    'Recieved',
    'Exchange',
  ];
  List<String> list2 = [
    ImageManager.drawer_icon,
    ImageManager.notification_bill,
    ImageManager.notification_bill
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          title: Text("Transfer"),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                child: Image.asset(ImageManager.user_pro),
              ),
            )
          ]),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.r)),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                height: 200,
                child: SfCartesianChart(
                    plotAreaBorderWidth: 0,
                    borderWidth: 0,
                    enableSideBySideSeriesPlacement: false,
                    enableAxisAnimation: false,
                    primaryXAxis: CategoryAxis(
                      axisLine: AxisLine(width: 0),
                      majorGridLines: MajorGridLines(width: 0),
                    ),
                    tooltipBehavior: _tooltip,
                    series: <ChartSeries<_ChartData, String>>[
                      BarSeries<_ChartData, String>(
                          dataSource: data1,
                          xValueMapper: (_ChartData data, _) => data.x,
                          yValueMapper: (_ChartData data, _) => data.y,
                          color: Color.fromRGBO(8, 142, 255, 1))
                    ]),
              ),
            ),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  " Transactions",
                  style: TextStyle(
                    color: ColorsManager.COLOR_GRAY,
                    fontSize: 14.sp,
                  ),
                ),
                Text("See All", style: TextStyle()),
              ],
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: _text2.length,
                  itemBuilder: (BuildContext ctxt, int index) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Color(
                                (math.Random().nextDouble() * 0xFFFFFF).toInt())
                            .withOpacity(1.0),
                        child: Image.asset(
                          list2[index],
                          width: 25,
                          height: 25,
                        ),
                      ),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(_text2[index]),
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
                          Text(_text3[index],
                              style: TextStyle(
                                  fontSize: 16,
                                  color: ColorsManager.COLOR_BLACK)),
                          SizedBox(height: 10.h)
                        ],
                      ),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
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
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

class _ChartData {
  _ChartData(this.x, this.y);

  final String x;
  final double y;
}

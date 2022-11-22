import 'package:flutter/material.dart';

class DisputedPageScreen extends StatelessWidget {
  const DisputedPageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
              height: 190,
              child: new ListView.builder(
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (BuildContext ctxt, int index) {
                    return Container(
                        margin: new EdgeInsets.fromLTRB(10, 0, 10, 0),
                        width: 25.0,
                        height: 55.0,
                        child: Card(
                          clipBehavior: Clip.antiAlias,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0)),
                          color: Colors.white,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                color: Colors.amber,
                                width: 10,
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    print('testing');
//                                  setState(() {
//                                    _localVehicleSelected =
//                                        vdata[index]["pr"].toString();
//                                  });
//
//                                  doSomething(vdata[index]["pr"].toString());
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      //new Row(
                                      // mainAxisSize: MainAxisSize.max,

                                      //children: <Widget>[
                                      new Text(
                                        'Test Plate',
                                      ),

                                      //style: Theme.of(context).textTheme.body2
                                      //],
                                      //),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ));
                  }))
        ],
      ),
    );
  }
}

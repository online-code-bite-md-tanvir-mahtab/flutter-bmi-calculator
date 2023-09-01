import 'package:flutter/material.dart';

import '../main.dart';

class Destination extends StatelessWidget {
  const Destination({super.key, required this.dMaps});
  final Map<void, void> dMaps;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFF090B1E),
      ),
      home: DestinationBody(dMaps),
    );
  }
}

var bmi_calculation_result = 0;

class DestinationBody extends StatefulWidget {
  DestinationBody(this.dMaps);
  final Map<void, void> dMaps;
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _DestinationBody(dMaps);
  }
}

class _DestinationBody extends State<DestinationBody> {
  Map<void, void> sMaps;
  _DestinationBody(this.sMaps);
  int state = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get_calculation(sMaps);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Scaffold(
          body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.bottomLeft,
                child: Text(
                  "Your Result",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Container(
              child: Expanded(
                  flex: 4,
                  child: getBox(
                      50,
                      double.infinity,
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "OverWeighted".toUpperCase(),
                              style: TextStyle(
                                color: Colors.greenAccent,
                                fontWeight: FontWeight.w400,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              bmi_calculation_result.toString(),
                              style: kNumberStyle(),
                            ),
                            Text(
                              'Your over weighted .Please do some excersize',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w100),
                            )
                          ],
                        ),
                      ))),
            ),
            Container(
              width: double.infinity,
              height: 60.0,
              margin: EdgeInsets.only(top: 10.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyApp()));
                },
                child: Text(
                  "Re Calculate",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }

  void get_calculation(Map<dynamic, dynamic> sMaps) {
    var height = sMaps['Height'];
    var weight = sMaps['Weight'];
    bmi_calculation_result = calculateBMI(weight, height).toInt();
  }

  double calculateBMI(double weightKg, double heightMeters) {
    if (weightKg <= 0 || heightMeters <= 0) {
      return 0.0; // Return 0 if weight or height is invalid
    }

    double bmi = weightKg / ((heightMeters / 100) * (heightMeters / 100));
    return bmi;
  }
}

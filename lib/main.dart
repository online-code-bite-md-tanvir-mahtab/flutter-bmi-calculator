import 'package:bmi_calculator/screen/destinatio.dart';
import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() => runApp(MyApp());

const color = '';
bool isActive = true;
bool inActive = true;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFF0A0D22),
        ),
        scaffoldBackgroundColor: Color(0xFF090B1E),
        textTheme: TextTheme(
          bodyText1: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              'Bmi Calculator',
            ),
          ),
          body: BmiBody(),
        ),
      ),
    );
  }
}

Widget getColumnDAta(String text, IconData icon) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(icon,
          size: 80.0, color: !isActive ? Color(0xFF8D8E98) : Colors.white),
      SizedBox(
        height: 10.0,
      ),
      Text(
        text,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    ],
  );
}

Widget getColumnDAta2(String text, IconData icon) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(icon,
          size: 80.0, color: !inActive ? Color(0xFF8D8E98) : Colors.white),
      SizedBox(
        height: 10.0,
      ),
      Text(
        text,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    ],
  );
}

class BmiBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState

    return _BmiBody();
  }
}

class _BmiBody extends State<BmiBody> {
  double _currentSliderValue = 100;
  double height = 0;
  int weight = 30;
  int age = 0;
  Map<void, void> datas = <void, void>{};
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        Container(
          child: Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () {
                    print("clicked");
                    setState(
                      () {
                        if (isActive) {
                          print('yes its active');
                          isActive = false;
                          inActive = true;
                        } else {
                          print('no its not active');
                          isActive = true;
                          inActive = false;
                        }
                        // isActive = isActive ? true : false;
                        // inActive = inActive ? false : true;
                      },
                    );
                    print(isActive);
                  },
                  child: getBox(
                    170,
                    150,
                    getColumnDAta("male", Icons.male),
                  ),
                ),
              ),
              Expanded(
                child: TextButton(
                  onPressed: () {
                    print("clicked");
                    setState(
                      () {
                        if (inActive) {
                          print('yes its active');
                          isActive = true;
                          inActive = false;
                        } else {
                          print('no its not active');
                          inActive = true;
                          isActive = false;
                        }
                      },
                    );
                  },
                  child: getBox(
                    170,
                    150,
                    getColumnDAta2("female", Icons.female),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: getBox(
            170,
            400,
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 5.0),
                    child: Text(
                      'Height'.toUpperCase(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: AutofillHints.addressState,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.round().toString(),
                        style: kNumberStyle(),
                      ),
                      Text(
                        "cm",
                        style: kSmallTextStyle(),
                      ),
                    ],
                  ),
                  Container(
                    child: SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30),
                        overlayColor: Colors.white,
                      ),
                      child: Slider(
                        value: _currentSliderValue,
                        max: 400,
                        min: 100,
                        divisions: 400,
                        label: _currentSliderValue.round().toString(),
                        activeColor: Colors.red,
                        inactiveColor: Colors.white,
                        onChanged: (double value) {
                          setState(
                            () {
                              _currentSliderValue = value;
                              height = value;
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Container(
          child: Row(
            children: [
              Expanded(
                child: getBox(
                    170,
                    150,
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 5.0),
                            child: Text(
                              'Weight'.toUpperCase(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: AutofillHints.addressState,
                                fontSize: 15,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(
                                weight.toString(),
                                style: kNumberStyle(),
                              ),
                              Text(
                                "kg",
                                style: kSmallTextStyle(),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              FloatingActionButton.small(
                                backgroundColor: Colors.white30,
                                onPressed: () {
                                  print("Deleting weight");
                                  setState(() {
                                    weight -= 1;
                                  });
                                },
                                child: Icon(Icons.remove),
                              ),
                              FloatingActionButton.small(
                                backgroundColor: Colors.white30,
                                onPressed: () {
                                  print("Adding weight");
                                  setState(() {
                                    weight += 1;
                                  });
                                },
                                child: Icon(Icons.add),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )),
              ),
              Expanded(
                child: getBox(
                  170,
                  150,
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 5.0),
                          child: Text(
                            'Age'.toUpperCase(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: AutofillHints.addressState,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        Text(
                          age.toString(),
                          style: kNumberStyle(),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            FloatingActionButton.small(
                              backgroundColor: Colors.white30,
                              onPressed: () {
                                setState(() {
                                  age -= 1;
                                });
                              },
                              child: Icon(Icons.remove),
                            ),
                            FloatingActionButton.small(
                              backgroundColor: Colors.white30,
                              onPressed: () {
                                setState(() {
                                  age += 1;
                                });
                              },
                              child: Icon(Icons.add),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
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
              if (isActive & !inActive) {
                datas['Gender'] = 'Male';
                datas['Height'] = height;
                datas['Weight'] = weight;
                datas['Age'] = age;
                navToDes(datas, context);
                print(
                    "Gender: Male \nHeight: ${height.toInt()} \nWeight: ${weight} \nAge: ${age}");
              } else if (!isActive & inActive) {
                datas['Gender'] = 'Female';
                datas['Height'] = height;
                datas['Weight'] = weight;
                datas['Age'] = age;
                navToDes(datas, context);

                print(
                    "Gender: Female \nHeight: ${height.toInt()} \nWeight: ${weight} \nAge: ${age}");
              } else {
                ScaffoldMessenger.of(context)
                  ..clearSnackBars()
                  ..showSnackBar(
                      SnackBar(content: Text("The gender isn't seelcted")));
              }
            },
            child: Text(
              "Calculate",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }

  void navToDes(Map<void, void> maps, BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Destination(dMaps: maps),
      ),
    );
  }
}

TextStyle kNumberStyle() {
  return TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: 50,
  );
}

TextStyle kSmallTextStyle() {
  return TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w400,
    fontSize: 30,
  );
}

Widget getBox(var height, var width, Widget data) {
  return Container(
    // padding: EdgeInsets.all(
    //   70,
    // ),
    child: Card(
      color: Color(0xFF1D1F33),
      child: data,
    ),
    height: height,
    margin: EdgeInsets.all(15.0),
    // child: Text(""),
    width: width,
    decoration: BoxDecoration(
      color: Color(0xFF1D1F33),
      borderRadius: BorderRadius.circular(15.0),
    ),
  );
}

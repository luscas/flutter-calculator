import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Palette {
  static Color black = Color(0xFF17181A);
  static Color black50 = Color(0xFF222427);
  static Color orange = Color(0xFFFF9500);
  static Color orange50 = Color(0xFFFF9500);
  static Color green = Color(0xFF2EC973);
}

class Button extends StatelessWidget {
  Button({
    Key key,
    this.type,
    this.text,
  }) : super(key: key) {
    presets();
  }

  String type = 'normal';
  Color color = Palette.black50;
  Color textColor = Colors.white;
  double width  = 65;
  double height = 65;
  double borderRadius = 25;
  dynamic text;

  void presets() {
    if(type=='red') {
      color = Color.fromRGBO(45,25,30,1.0);
      textColor = Color.fromRGBO(246,68,78,1.0);
    }

    if(type=='small') {
      height = 45;
      borderRadius = 20;
    }

    if(type=='orange') color = Palette.orange;
    if(type=='green') color = Palette.green;
    if(type=='large') width = 149;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Center(
        child: text.runtimeType == String ? Text(text, style: TextStyle(color: textColor, fontSize: 25)) : text
      )
    );
  }
}

class Calculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Palette.black,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark
    ));

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Palette.black,
        padding: EdgeInsets.only(left: 30, right: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(top: 65, bottom: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      RichText(
                        text: TextSpan(
                          style: TextStyle(
                            color: Colors.white54,
                            fontSize: 20
                          ),
                          children: <TextSpan>[
                            TextSpan(text: '45'),
                            TextSpan(text: ' + ', style: TextStyle(color: Palette.orange50)),
                            TextSpan(text: '(1250'),
                            TextSpan(text: ' x ', style: TextStyle(color: Palette.orange50)),
                            TextSpan(text: '100)'),
                            TextSpan(text: ' / ', style: TextStyle(color: Palette.orange50)),
                            TextSpan(text: '10')
                          ]
                        )
                      )
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  child: Text('12,545', style: TextStyle(color: Colors.white, fontSize: 50), textAlign: TextAlign.end)
                )
              ]
            ),

            Container(
              margin: EdgeInsets.only(top: 30, bottom: 45),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Button(text: "e", type: "small"),
                      Button(text: "pi", type: "small"),
                      Button(text: "sin", type: "small"),
                      Button(text: "deg", type: "small")
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Button(text: "C", type: "red"),
                      Button(text: "("),
                      Button(text: ")"),
                      Button(text: "/", type: "orange")
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Button(text: "7"),
                      Button(text: "8"),
                      Button(text: "9"),
                      Button(text: "x", type: "orange")
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Button(text: "4"),
                      Button(text: "5"),
                      Button(text: "6"),
                      Button(text: "-", type: "orange")
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Button(text: "1"),
                      Button(text: "2"),
                      Button(text: "3"),
                      Button(text: "+", type: "orange")
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Button(text: "0", type: "large"),
                      Button(text: "."),
                      Button(text: "=", type: "green")
                    ],
                  )
                ]
              ),
            )
          ],
        )
      )
    );
  }
}
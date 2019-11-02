import 'package:flutter/material.dart';

class MainBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xff083142),
        body: Stack(
          children: <Widget>[
            Positioned.fill(
              child: Opacity(
                opacity: 0.7,
                child: Container(
                  decoration: new BoxDecoration(
                    image: DecorationImage(
                        alignment: Alignment(-0.91, 0),
                        image: AssetImage('assets/images/background.png'),
                        fit: BoxFit.fitHeight),
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: double.infinity / 2,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment(0, 0.4),
                    stops: [
                      0,
                      1
                    ],
                    colors: [
                      Color(0x2EECDE).withOpacity(0.5),
                      Colors.white.withOpacity(0)
                    ]),
              ),
            ),
            Container(
              width: double.infinity,
              height: double.infinity / 2,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment(0, 0.6),
                    stops: [
                      0,
                      0.9
                    ],
                    colors: [
                      Color(0x073140).withOpacity(0.2),
                      Colors.white.withOpacity(0)
                    ]),
              ),
            ),
            Container(
              width: double.infinity,
              height: double.infinity / 2,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment(0, 0.3),
                    stops: [
                      0,
                      0.1
                    ],
                    colors: [
                      Color(0x073140).withOpacity(0),
                      Colors.white.withOpacity(0)
                    ]),
              ),
            ),
          ],
        ));
  }
}

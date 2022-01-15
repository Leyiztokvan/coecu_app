// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flashlight/flashlight.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isButtonPressed = false;
  var isON = false;
  bool isVisible = false;
  bool viewVisible = false;

  var _hasFlashlight = false;

  @override
  initState() {
    super.initState();
    initFlashlight();
    checkLight();
  }

  checkLight() async {
    bool hasFlash = await Flashlight.hasFlashlight;
    setState(() {
      _hasFlashlight = hasFlash;
    });
  }

  initFlashlight() async {
    bool hasFlash = await Flashlight.hasFlashlight;
    // print("Device has flash ? $hasFlash");
    setState(() {
      _hasFlashlight = hasFlash;
    });
  }

  void showWidget() {
    setState(() {
      viewVisible = true;
    });
  }

  void hideWidget() {
    setState(() {
      viewVisible = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              backgroundColor: const Color(0xE6FB9412),
              title: Text(
                'Cöcu',
                style: TextStyle(
                    fontSize: 40,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
                // style: GoogleFonts.getFont(
                //   'Sacramento',
                //   fontSize: 33,
                //   fontWeight: FontWeight.bold,
                // ),
                // style:
                //  GoogleFonts.getFont('Calligraffitti',
                //     fontSize: 33,
                //     fontWeight: FontWeight.bold,
                //     color: const Color(0xE6280B03)
              ),
              centerTitle: true,
              elevation: 15.0,
              leading: const Padding(
                padding: EdgeInsets.all(2.0),
                child: CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/images/2.jpeg'),
                ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Container(
                    clipBehavior: Clip.hardEdge,
                    width: 50.0,
                    height: 40.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.black,
                    ),
                    child: Image.asset(
                      'assets/images/Puppeteer.jpg',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ],
            ),
            body: Container(
                child: DecoratedBox(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/1.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      alignment: Alignment.center,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            50, 140, 50, 30),
                                        child: _hasFlashlight
                                            ? Center(
                                                child: Transform.rotate(
                                                  angle: -3.14 / 2,
                                                  child: Transform.scale(
                                                    scale: 3,
                                                    child: Switch(
                                                      activeTrackColor:
                                                          const Color(
                                                              0xFDA1D967),
                                                      inactiveTrackColor:
                                                          const Color(
                                                              0xFDBD4343),
                                                      activeColor: const Color(
                                                          0xE65AFD02),
                                                      inactiveThumbColor:
                                                          const Color(
                                                              0xFFFF0000),
                                                      value: isON,
                                                      onChanged: (value) {
                                                        setState(
                                                          () {
                                                            isON = !isON;
                                                            isON
                                                                ? Flashlight
                                                                    .lightOn()
                                                                : Flashlight
                                                                    .lightOff();
                                                          },
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              )
                                            : const Text(
                                                // "",
                                                "You don't have a flash",
                                                style: TextStyle(
                                                  color: Colors.redAccent,
                                                  fontSize: 20.0,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                      ),
                                    ],
                                  ),
                                ]),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                      padding: const EdgeInsets.only(
                                          top: 160,
                                          bottom: 1,
                                          left: 2,
                                          right: 9),
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10, bottom: 0),
                                              child: RawMaterialButton(
                                                  constraints:
                                                      const BoxConstraints(
                                                          maxHeight: 50,
                                                          maxWidth: 50),
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30)),
                                                  onPressed: () {
                                                    // setState(() {
                                                    //   viewVisible =
                                                    //       !viewVisible;
                                                    // });
                                                  },
                                                  child: ClipOval(
                                                      clipBehavior:
                                                          Clip.hardEdge,
                                                      child: Container(
                                                          child: FittedBox(
                                                        child: Image.asset(
                                                          'assets/images/1899EvereadyFlashlight.png',
                                                          fit: BoxFit.contain,
                                                          width: 50,
                                                          height: 50,
                                                        ),
                                                      )))),
                                            ),
                                            Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Visibility(
                                                    child: ButtonTheme(
                                                      minWidth: 30,
                                                      height: 13,
                                                      // ignore: deprecated_member_use
                                                      child: RaisedButton(
                                                        child: const Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 2,
                                                                  top: 0,
                                                                  right: 2,
                                                                  bottom: 0),
                                                          child: Text(
                                                            'History',
                                                            style: TextStyle(
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontFamily:
                                                                    'Georgia'),
                                                          ),
                                                        ),
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20)),
                                                        onPressed: () {
                                                          setState(() {
                                                            viewVisible =
                                                                !viewVisible;
                                                            isButtonPressed =
                                                                !isButtonPressed;
                                                          });
                                                        },
                                                        color: isButtonPressed
                                                            ? const Color(
                                                                0xFFFFEDBB)
                                                            : const Color(
                                                                0xFFA87A49),
                                                        splashColor:
                                                            Colors.black,
                                                        elevation: 3,
                                                        colorBrightness:
                                                            Brightness.light,
                                                        textColor: const Color(
                                                            0xFF533315),
                                                        padding:
                                                            const EdgeInsets
                                                                    .fromLTRB(
                                                                2, 2, 2, 2),
                                                      ),
                                                    ),
                                                  ),
                                                ]),
                                          ])),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                          margin:
                                              const EdgeInsets.only(top: 26),
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(left: 20),
                                            child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: <Widget>[
                                                  Visibility(
                                                    maintainSize: true,
                                                    maintainAnimation: true,
                                                    maintainState: true,
                                                    visible: viewVisible,
                                                    child: Container(
                                                        height: 200,
                                                        width: 200,
                                                        transform:
                                                            Matrix4.rotationZ(
                                                                0.2),
                                                        decoration:
                                                            const BoxDecoration(
                                                          color:
                                                              Color(0x66000000),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(3),
                                                          child: Center(
                                                            child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: const [
                                                                  Text(
                                                                      'Flashlight',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      style: TextStyle(
                                                                          color: Color(
                                                                              0xFFE2A347),
                                                                          fontSize:
                                                                              14,
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          fontFamily:
                                                                              'Georgia')),
                                                                  Text(
                                                                      '\n On January 10, 1899, British inventor David Misell obtained U.S. Patent No. 617,592, assigned to American Electrical Novelty and Manufacturing Company.This "electric device" designed by Misell was powered by "D" batteries laid front to back in a paper tube with the lightbulb and a rough brass reflector at the end\n [Wikipedia]',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      style: TextStyle(
                                                                          color: Color(
                                                                              0xFFCEA666),
                                                                          fontSize:
                                                                              11,
                                                                          fontWeight: FontWeight
                                                                              .w600,
                                                                          fontFamily:
                                                                              'Palatino',
                                                                          fontStyle:
                                                                              FontStyle.italic))
                                                                ]),
                                                          ),
                                                        )),
                                                  )
                                                ]),
                                          ))
                                    ],
                                  ),
                                ]),
                          ]),
                    )))));
  }
}

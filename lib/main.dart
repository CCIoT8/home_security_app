import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'api_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color textColor = const Color(0xFFECDFCC);
  late String currentState = 'loading...';
  final ApiService apiService = ApiService();
  bool isLoading = false;
  Timer? _timer;

  void startPeriodicCheck() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) async {
      String? armState = await apiService.getCurrentState();
      setState(() {
        currentState = armState ?? 'Failed to fetch state';
      });
      bool? alarmState = await apiService.checkAlarm();
      if (alarmState == true) {
        final data = await apiService.getImage();
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return WarningPage(time: data?['timestamp'], imageBytes: base64Decode(data?['image']),
            );
          },
        );
      }
    });
  }
  Future<void> toggleState() async {
    if (currentState != 'ARMED' && currentState != 'DISARMED') {
      return;
    }

    setState(() {
      isLoading = true; // Show loading indicator
    });

    try {
      bool apiResult = false;
      // Call appropriate API based on current state
      if (currentState == 'ARMED') {
        apiResult = await apiService.disarmSystem();
      } else if (currentState == 'DISARMED') {
        apiResult = await apiService.armSystem();
      }
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    startPeriodicCheck();
  }

  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 80.0, horizontal: 50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: screen.width,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hi Ivorine',
                    style: TextStyle(
                        fontSize: 24,
                        fontFamily: 'Nokora',
                        fontWeight: FontWeight.w700,
                        color: Color(0xFFFFE900)),
                  ),
                  Text(
                    'Your Home @',
                    style: TextStyle(
                        fontSize: 18, fontFamily: 'Inter', color: Colors.white),
                  ),
                  Text(
                    '59 Changi South Ave 1, 485999',
                    style: TextStyle(
                        fontSize: 18, fontFamily: 'Inter', color: Colors.white),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 100.0,
            ),
            Column(
              children: [
                const Text(
                  'Alarm System',
                  style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'Nokora',
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
                const SizedBox(height: 30.0),
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape
                          .circle, // Keep the circular shape for the glow
                      boxShadow: [
                        BoxShadow(
                          color: currentState == 'ARMED'
                              ? const Color(0xFF7EA172)
                                  .withOpacity(0.6) // Glow color for 'ARMED'
                              : const Color(0xFFAC3931).withOpacity(
                                  0.6), // Glow color for 'DISARMED'
                          blurRadius: 30.0, // Intensity of the glow
                          spreadRadius: 10.0, // Width of the glow
                        ),
                      ],
                    ),
                    child: ElevatedButton(
                      onPressed: isLoading ? null : toggleState,
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.black),
                        shape: MaterialStateProperty.all(
                          CircleBorder(
                            side: BorderSide(
                              color: currentState == 'ARMED'
                                  ? const Color(0xFF7EA172)
                                  : const Color(0xFFAC3931),
                              width: 6.0,
                            ),
                          ),
                        ),
                        fixedSize: MaterialStateProperty.all(
                          Size(screen.height * 0.25, screen.height * 0.25),
                        ),
                      ),
                      child: isLoading
                          ? const CircularProgressIndicator() // Show loading indicator
                          : Text(
                              currentState,
                              style: TextStyle(
                                fontSize: 32.0,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w700,
                                color: currentState == 'ARMED'
                                    ? const Color(0xFF7EA172)
                                    : const Color(0xFFAC3931),
                              ),
                            ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 50.0,
            ),
            // ElevatedButton(
            //     style: const ButtonStyle(
            //         backgroundColor: MaterialStatePropertyAll(Colors.black)),
            //     onPressed: () {
            //       Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //             builder: (context) => const WarningPage()),
            //       );
            //     },
            //     child: const Text('click open notification'))
          ],
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}

class WarningPage extends StatefulWidget {
  final String time;
  final Uint8List imageBytes;

  const WarningPage({super.key, required this.time, required this.imageBytes});

  @override
  State<WarningPage> createState() => _WarningPageState();
}

class _WarningPageState extends State<WarningPage> {
  final ApiService apiService = ApiService();

  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 80.0, horizontal: 50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                children: [
                  Text('ALARM HAS BEEN TRIGGERED!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color(0xFFFFE900),
                          fontSize: 26.0,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700)),
                  Text('5 September 2024',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontFamily: 'Inter')),
                  Text('1:00PM',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontFamily: 'Inter')),
                ],
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 5,
                      // child: Image.asset(
                      //   'images/sample1.jpeg',
                      //   fit: BoxFit.contain,
                      // ),
                      child: Image.memory(
                                  widget.imageBytes,
                                  height: screen.height * 0.3,
                                  fit: BoxFit.cover,
                                )
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  ElevatedButton(
                      style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all(
                          Size(screen.width * 0.8, 60.0),
                        ),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                50.0), // Optional: Rounded corners
                            side: const BorderSide(
                              color: Color(0xFFFFE900), // Border color
                              width: 3.0, // Border width
                            ),
                          ),
                        ),
                        backgroundColor: MaterialStateProperty.all(
                          const Color(0xFFFFE900), // Background color
                        ),
                      ),
                      onPressed: () {},
                      child: const Text(
                        'CALL THE POLICE',
                        style: TextStyle(
                            fontSize: 18.0,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,
                            color: Colors.black),
                      )),
                  const SizedBox(height: 20.0),
                  ElevatedButton(
                      style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all(
                          Size(screen.width * 0.8, 60.0),
                        ),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                50.0), // Optional: Rounded corners
                            side: const BorderSide(
                              color: Colors.white, // Border color
                              width: 3.0, // Border width
                            ),
                          ),
                        ),
                        backgroundColor: MaterialStateProperty.all(
                          Colors.black, // Background color
                        ),
                      ),
                      onPressed: () async {
                        await apiService.stopAlarm();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MyHomePage()),
                        );
                      },
                      child: const Text(
                        'DEACTIVATE ALARM',
                        style: TextStyle(
                            fontSize: 18.0,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ))
                ],
              )
            ],
          )),
      backgroundColor: Colors.black,
    );
  }
}

class PreviousAlertsPage extends StatefulWidget {
  const PreviousAlertsPage({super.key});

  @override
  State<PreviousAlertsPage> createState() => _PreviousAlertsPageState();
}

class _PreviousAlertsPageState extends State<PreviousAlertsPage> {
  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 80.0, horizontal: 50.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MyHomePage()),
                    );
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_rounded,
                    color: Colors.white,
                    size: 20.0,
                  ),
                ),
                const Text(
                  'Previous Alerts',
                  style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'Nokora',
                      fontWeight: FontWeight.w700,
                      color: Color(0xFFFFE900)),
                ),
              ],
            ),
            const SizedBox(height: 30.0),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Expanded(
                      child: Column(
                        children: [
                          Text(
                            'Date',
                            style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                          ),
                          Text(
                            '05/12/2022',
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'Inter',
                                height: 3.0,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          const Text(
                            'Picture',
                            style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                          ),
                          ElevatedButton(
                              onPressed: () {
                                showModalBottomSheet(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Container(
                                      height: 320,
                                      color: Colors.black,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          IconButton(
                                            onPressed: () =>
                                                Navigator.pop(context),
                                            icon: const Icon(
                                              Icons.close,
                                              color: Colors.white,
                                            ),
                                          ),
                                          Expanded(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                IconButton(
                                                  onPressed: () {},
                                                  icon: const Icon(
                                                    Icons
                                                        .arrow_back_ios_rounded,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 5,
                                                  child: Image.asset(
                                                    'images/sample1.jpeg',
                                                    fit: BoxFit.contain,
                                                  ),
                                                ),
                                                IconButton(
                                                  onPressed: () {},
                                                  icon: const Icon(
                                                    Icons
                                                        .arrow_forward_ios_rounded,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                );
                              },
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                    Colors.black, // Background color
                                  ),
                                  minimumSize: MaterialStateProperty.all(
                                      const Size(10.0, 10.0)),
                                  padding: MaterialStateProperty.all(
                                      EdgeInsets.zero)),
                              child: const Text(
                                'click me',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'Inter',
                                    decoration: TextDecoration.underline,
                                    decorationColor: Colors.white,
                                    color: Colors.white),
                              ))
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}

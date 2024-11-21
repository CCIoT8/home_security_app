import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 80.0, horizontal: 50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'LOGIN',
                  style: TextStyle(
                      fontSize: 32,
                      fontFamily: 'Nokora',
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Please enter your details.',
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Nokora',
                      color: Color(0xFFFFE900)),
                ),
                const SizedBox(height: 50),
                Column(
                  children: [
                    TextField(
                      cursorColor: Colors.white,
                      cursorWidth: 1,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: const BorderSide(
                            color: Colors.white,
                            width: 1.0,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: const BorderSide(
                            color: Colors.white,
                            width: 1.0,
                          ),
                        ),
                        labelText: 'Username',
                        labelStyle: const TextStyle(
                          fontSize: 16.0,
                          fontFamily: 'Open Sans',
                          fontWeight: FontWeight.w300,
                          color: Colors.white,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 16.0,
                          horizontal: 20.0,
                        ),
                      ),
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontFamily: 'Open Sans',
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 30),
                    TextField(
                      enableSuggestions: false,
                      obscureText: true,
                      cursorColor: Colors.white,
                      cursorWidth: 1,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: const BorderSide(
                            color: Colors.white,
                            width: 1.0,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: const BorderSide(
                            color: Colors.white,
                            width: 1.0,
                          ),
                        ),
                        labelText: 'Password',
                        labelStyle: const TextStyle(
                          fontSize: 16.0,
                          fontFamily: 'Open Sans',
                          fontWeight: FontWeight.w300,
                          color: Colors.white,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 16.0,
                          horizontal: 20.0,
                        ),
                      ),
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontFamily: 'Open Sans',
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const MyHomePage()),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    fixedSize: MaterialStateProperty.all(
                      const Size(280, 50),
                    ),
                  ),
                  child: const Text(
                    'SIGN IN',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(height: 5.0),
                TextButton(onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignUpPage(),
                    ),
                  );
                }, child: RichText(
                  text: const TextSpan(
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Nokora',
                      color: Colors.white,
                    ),
                    children: [
                      TextSpan(
                        text: 'No account? ',
                      ),
                      TextSpan(
                        text: 'Register Now',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),)
              ],
            )
          ],
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 80.0, horizontal: 50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'SIGN UP',
                  style: TextStyle(
                      fontSize: 32,
                      fontFamily: 'Nokora',
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Please enter your details.',
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Nokora',
                      color: Color(0xFFFFE900)),
                ),
                const SizedBox(height: 50),
                Column(
                  children: [
                    TextField(
                      cursorColor: Colors.white,
                      cursorWidth: 1,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: const BorderSide(
                            color: Colors.white,
                            width: 1.0,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: const BorderSide(
                            color: Colors.white,
                            width: 1.0,
                          ),
                        ),
                        labelText: 'Username',
                        labelStyle: const TextStyle(
                          fontSize: 16.0,
                          fontFamily: 'Open Sans',
                          fontWeight: FontWeight.w300,
                          color: Colors.white,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 16.0,
                          horizontal: 20.0,
                        ),
                      ),
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontFamily: 'Open Sans',
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 30),
                    TextField(
                      enableSuggestions: false,
                      obscureText: true,
                      cursorColor: Colors.white,
                      cursorWidth: 1,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: const BorderSide(
                            color: Colors.white,
                            width: 1.0,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: const BorderSide(
                            color: Colors.white,
                            width: 1.0,
                          ),
                        ),
                        labelText: 'Password',
                        labelStyle: const TextStyle(
                          fontSize: 16.0,
                          fontFamily: 'Open Sans',
                          fontWeight: FontWeight.w300,
                          color: Colors.white,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 16.0,
                          horizontal: 20.0,
                        ),
                      ),
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontFamily: 'Open Sans',
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 30),
                    TextField(
                      enableSuggestions: false,
                      obscureText: true,
                      cursorColor: Colors.white,
                      cursorWidth: 1,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: const BorderSide(
                            color: Colors.white,
                            width: 1.0,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: const BorderSide(
                            color: Colors.white,
                            width: 1.0,
                          ),
                        ),
                        labelText: 'Confirm Password',
                        labelStyle: const TextStyle(
                          fontSize: 16.0,
                          fontFamily: 'Open Sans',
                          fontWeight: FontWeight.w300,
                          color: Colors.white,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 16.0,
                          horizontal: 20.0,
                        ),
                      ),
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontFamily: 'Open Sans',
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const MyHomePage()),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    fixedSize: MaterialStateProperty.all(
                      const Size(280, 50),
                    ),
                  ),
                  child: const Text(
                    'SIGN UP',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(height: 5.0),
                TextButton(onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    ),
                  );
                }, child: RichText(
                  text: const TextSpan(
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Nokora',
                      color: Colors.white,
                    ),
                    children: [
                      TextSpan(
                        text: 'Already have an account? ',
                      ),
                      TextSpan(
                        text: 'Sign In Now',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),)
              ],
            )
          ],
        ),
      ),
      backgroundColor: Colors.black,
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
  String state = 'ARMED';

  @override
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
              height: 30.0,
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
                          color: state == 'ARMED'
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
                      onPressed: () {
                        setState(() {
                          state = state == 'ARMED' ? 'DISARMED' : 'ARMED';
                        });
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.black),
                        shape: MaterialStateProperty.all(
                          CircleBorder(
                            side: BorderSide(
                              color: state == 'ARMED'
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
                      child: Text(
                        state,
                        style: TextStyle(
                          fontSize: 32.0,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                          color: state == 'ARMED'
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
            Column(
              children: [
                const Text(
                  'Previous Alerts',
                  style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'Nokora',
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
                const SizedBox(height: 20.0),
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
                                      backgroundColor:
                                          MaterialStateProperty.all(
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
                const SizedBox(height: 20.0),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PreviousAlertsPage()),
                      );
                    },
                    style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all(
                        Size(screen.width * 0.35, 42.0),
                      ),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              50.0), // Optional: Rounded corners
                          side: const BorderSide(
                            color: Color(0xFFFFE900), // Border color
                            width: 2.0, // Border width
                          ),
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.all(
                        const Color(0xFF000000), // Background color
                      ),
                    ),
                    child: const Text(
                      'SEE MORE',
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Nokora',
                          color: Color(0xFFFFE900)),
                    ))
              ],
            ),
            ElevatedButton(
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.black)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const WarningPage()),
                  );
                },
                child: const Text('click open notification'))
          ],
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}

class WarningPage extends StatefulWidget {
  const WarningPage({super.key});

  @override
  State<WarningPage> createState() => _WarningPageState();
}

class _WarningPageState extends State<WarningPage> {
  @override
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
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.arrow_back_ios_rounded,
                          color: Colors.white,
                        )),
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
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.white,
                        )),
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
                      onPressed: () {
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

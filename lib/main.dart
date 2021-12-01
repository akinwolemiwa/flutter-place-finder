import 'package:flutter/material.dart';
import 'package:place_finder/size_config.dart';
import 'package:rive/rive.dart';
import 'package:place_finder/routes/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Maps Clone',
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration(seconds: 5),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    // ignore: unnecessary_statements
    SizeConfig.mediaQueryData;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: getPropScreenHeight(300),
              width: getPropScreenWidth(300),
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: RiveAnimation.asset(
                  'assets/riv/maps_splash.riv',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Container(
              height: getPropScreenHeight(100),
              width: getPropScreenWidth(1500),
              child: RiveAnimation.asset(
                'assets/riv/maps_text.riv',
                fit: BoxFit.fitWidth,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

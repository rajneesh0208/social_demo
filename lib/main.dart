import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:social_demo/apputils.dart';
import 'package:social_demo/main_screen.dart';
import 'package:social_demo/sub_home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        useMaterial3: true,


      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key,});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {

    Future.delayed(
      const Duration(seconds: 5),
          () {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const SubHomeScreen()));
      },
    );
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        height: screenHeight(context),
        width: screenWidth(context),
        child: Lottie.asset("asset/lottie_social.json"),
      )
    );
  }
}

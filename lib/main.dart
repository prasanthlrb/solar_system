import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:webview_flutter/webview_flutter.dart';
void main() {
  runApp( MaterialApp(home: SplashScreen()));
}
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTime();
  }
  startTime() async {
    return Timer(Duration(milliseconds: 4000), NavigatorPage);
  }
    void NavigatorPage() {
       Navigator.of(context, rootNavigator: true)
                        .pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return MyApp();
                        },
                      ),
                      (_) => false,
                    );
    }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Color(0xfffb140e),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets/splash.png",
                fit: BoxFit.cover,
                height: height,
                // width: width,
              ),
            ],
          ),
        ),
        floatingActionButton: new FloatingActionButton(
            elevation: 0.0,
            child: SpinKitSpinningLines(
              color: Colors.white,
            ),
            backgroundColor: Colors.transparent,
            onPressed: () {}),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat);
  }
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final webViewController = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..loadRequest(Uri.parse('https://eyes.nasa.gov/apps/solar-system/#/earth?rate=360&time=2026-07-13T23:08:47.721+00:00&logo=false&detailPanel=false&featured=false&menu=false&locked=true&lighting=natural&hideExternalLinks=true&hideFullScreenToggle=true&search=false&collapseSettingsOptions=true&shareButton=false'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: const Text("Flutter WebView"),
        // ),
        body: WebViewWidget(controller: webViewController));
  }
}
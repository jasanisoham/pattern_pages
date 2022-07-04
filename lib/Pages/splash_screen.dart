import 'dart:async';
import 'package:flutter/material.dart';

class SpalshScreen extends StatefulWidget {
  const SpalshScreen({Key? key}) : super(key: key);

  @override
  _SpalshScreenState createState() => _SpalshScreenState();
}

class _SpalshScreenState extends State<SpalshScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () {
        Navigator.of(context).pushReplacementNamed("/");
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Stack(
        children: [
          Transform.scale(
            scale: 4,
            child: Container(
              alignment: Alignment.center,
              child: Text(
                "TaskMe",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                Spacer(
                  flex: 5,
                ),
                Text(
                  "powered by HNG",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                SizedBox(
                  width: 50,
                  height: 50,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Text("WELCOME",
                style:
                TextStyle(fontSize: 42, fontWeight: FontWeight.w500),)
            ],
          ),
        ),
      ),
    );
  }
}

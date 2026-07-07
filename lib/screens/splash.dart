import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Widget mainContent = Platform.isAndroid
        ? const CircularProgressIndicator()
        : const CupertinoActivityIndicator();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Chat'),
      ),
      body: mainContent,
    );
  }
}

import 'package:archonit_test/src/presentation/ui/HomeScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ArchonitTest());
}

class ArchonitTest extends StatelessWidget {
  const ArchonitTest({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          useMaterial3: true,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.transparent,
          )),
      home: const HomeScreen(),
    );
  }
}

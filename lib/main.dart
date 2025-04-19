import 'package:flutter/material.dart';
import 'guess_page.dart';

void main() {
  runApp(GuessApp());
}

class GuessApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sayı Tahmin Oyunu',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        textTheme: TextTheme(
          bodyLarge: TextStyle(fontSize: 18),
        ),
      ),
      home: GuessPage(),
    );
  }
}

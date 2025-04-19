import 'package:flutter/material.dart';
import 'package:guessnum/guess_page.dart';


class ResultPage extends StatelessWidget {
  final bool won;
  final int targetNumber;
  const ResultPage({required this.won, required this.targetNumber});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  won ? Icons.emoji_events : Icons.sentiment_dissatisfied,
                  size: 100,
                  color: won ? Colors.green : Colors.red,
                ),
                SizedBox(height: 30),
                Text(
                  won ? '🎉 Kazandın!' : '😢 Kaybettin!',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                SizedBox(height: 10),
                Text(
                  'Doğru sayı: $targetNumber',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => GuessPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text('Tekrar Oyna'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

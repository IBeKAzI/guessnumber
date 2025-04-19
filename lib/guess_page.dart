import 'dart:math';
import 'package:flutter/material.dart';
import 'result_page.dart';

class GuessPage extends StatefulWidget {
  @override
  _GuessPageState createState() => _GuessPageState();
}

class _GuessPageState extends State<GuessPage> {
  final TextEditingController _controller = TextEditingController();
  late int _targetNumber;
  int _attemptsLeft = 5;
  String _feedback = '';

  @override
  void initState() {
    super.initState();
    _targetNumber = Random().nextInt(101);
  }

  void _checkGuess() {
    final guess = int.tryParse(_controller.text);
    if (guess == null) {
      setState(() {
        _feedback = 'Lütfen yalnızca sayı giriniz!';
      });
      return;
    }

    setState(() {
      _attemptsLeft--;

      if (guess == _targetNumber) {
        _navigateToResult(true);
      } else if (_attemptsLeft == 0) {
        _navigateToResult(false);
      } else if (guess < _targetNumber) {
        _feedback = 'Daha büyük bir sayı gir!';
      } else {
        _feedback = 'Daha küçük bir sayı gir!';
      }

      _controller.clear();
    });
  }

  void _navigateToResult(bool won) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => ResultPage(won: won, targetNumber: _targetNumber),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Sayı Tahmin Oyunu',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  SizedBox(height: 30),
                  Text('0 ile 100 arasında bir sayı tahmin et'),
                  SizedBox(height: 16),
                  TextField(
                    key: Key('guessInput'),
                    controller: _controller,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Tahmininiz',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    key: Key('guessButton'),
                    onPressed: _checkGuess,
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 16,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text('Tahmin Et'),
                  ),
                  SizedBox(height: 20),
                  Text('Kalan Hakkın: $_attemptsLeft'),
                  SizedBox(height: 10),
                  Text(
                    _feedback,
                    key: Key('feedbackText'),
                    style: TextStyle(fontSize: 20, color: Colors.deepPurple),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:minion/card_game.dart';
import 'package:minion/rps_game.dart';
import 'package:minion/snake_game.dart';
import 'package:minion/tictactoe.dart';
import 'package:minion/hangman.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MinionGames',
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF212121),
      appBar: AppBar(
        title: const Text('MinionGames', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        backgroundColor: Color(0XFF00E5FF),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2, // 2 cards per row
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: [ 
            _buildGameCard(context, 'Memory Game', Icons.casino, Colors.redAccent, const CardGame()),
            _buildGameCard(context, 'Snake', Icons.stairs_rounded, Colors.blueAccent, SnakeGame()),
            _buildGameCard(context, 'Tic Tac Toe', Icons.clear_rounded, Color(0XFF388E3C), const Tictactoe()),
            _buildGameCard(context, 'RPS', Icons.back_hand_rounded, Colors.orangeAccent, const RPSGame()),
            _buildGameCard(context, "Hangman", Icons.person, Color(0XFFB28704), const Hangman()),
          ],
        ),
      ),
    );
  }

  // Helper method to create a game card
  Widget _buildGameCard(BuildContext context, String title, IconData icon, Color color, Widget? page) {
    return GestureDetector(
      onTap: () {
        if (page != null) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => page));
        }
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        elevation: 5,
        color: color,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 50, color: Colors.white),
            const SizedBox(height: 10),
            Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
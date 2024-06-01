import 'package:dinosaur_game/games/dinosaur_game.dart';
import 'package:flutter/material.dart';

class GameOverScreen extends StatelessWidget {
  final DinosaurGame game;
  static const String id = "gameOver";

  const GameOverScreen({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black38,
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white60,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "GAME OVER",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "Score: ${game.score}",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              FilledButton(
                onPressed: restartGame,
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Colors.green),
                  foregroundColor: WidgetStateProperty.all(Colors.white),
                ),
                child: const Text("Restart Game"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void restartGame() {
    game.score = 0;
    game.updateScore();
    game.dinosaur.reset();
    game.interval.reset();
    game.overlays.remove(id);
    game.resumeEngine();
  }
}

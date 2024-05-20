import 'package:dinosaur_game/games/dinosaur_game.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

void main() {
  final game = DinosaurGame();
  runApp(
    GameWidget(game: game),
  );
}

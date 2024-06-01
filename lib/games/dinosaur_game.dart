import 'package:dinosaur_game/components/background.dart';
import 'package:dinosaur_game/components/cactus_group.dart';
import 'package:dinosaur_game/components/dinosaur.dart';
import 'package:dinosaur_game/components/moving_background.dart';
import 'package:dinosaur_game/games/configuration.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class DinosaurGame extends FlameGame
    with KeyboardEvents, HasCollisionDetection {
  late Dinosaur dinosaur;

  Timer interval = Timer(Config.cactusInterval, repeat: true);
  late TextComponent scoreText;

  int score = 0;
  bool isHit = false;

  @override
  Future<void> onLoad() async {
    addAll([
      Background(),
      MovingBackground(),
      CactusGroup(),
      dinosaur = Dinosaur(),
      scoreText = buildScore(),
    ]);

    interval.onTick = () => add(CactusGroup());
  }

  TextComponent buildScore() {
    return TextComponent(
      text: "Score: 0",
      position: Vector2(10, 10),
    );
  }

  @override
  KeyEventResult onKeyEvent(KeyEvent event, Set<KeyboardKey> keysPressed) {
    if (event is KeyDownEvent) {
      if (event.logicalKey == LogicalKeyboardKey.space) {
        dinosaur.jump();
        return KeyEventResult.handled;
      } else if (event.logicalKey == LogicalKeyboardKey.keyC) {
        dinosaur.crouch();
        return KeyEventResult.handled;
      }
    } else if (event is KeyUpEvent) {
      if (event.logicalKey == LogicalKeyboardKey.keyC) {
        dinosaur.stand();
        return KeyEventResult.handled;
      }
    }
    return KeyEventResult.ignored;
  }

  @override
  void update(double dt) {
    super.update(dt);
    interval.update(dt);
    scoreText.text = "Score: $score";
  }
}

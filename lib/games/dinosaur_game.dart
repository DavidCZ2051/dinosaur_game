import 'package:dinosaur_game/components/background.dart';
import 'package:dinosaur_game/components/cactus_group.dart';
import 'package:dinosaur_game/components/dinosaur.dart';
import 'package:dinosaur_game/components/moving_background.dart';
import 'package:dinosaur_game/games/configuration.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flame/timer.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class DinosaurGame extends FlameGame
    with KeyboardEvents, HasCollisionDetection {
  late Dinosaur dinosaur;

  Timer interval = Timer(Config.cactusInterval, repeat: true);

  int score = 0;

  @override
  Future<void> onLoad() async {
    addAll([
      Background(),
      MovingBackground(),
      CactusGroup(),
      dinosaur = Dinosaur(),
    ]);

    interval.onTick = () => add(CactusGroup());
  }

  @override
  KeyEventResult onKeyEvent(KeyEvent event, Set<KeyboardKey> keys) {
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
  }
}

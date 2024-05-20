import 'package:dinosaur_game/components/cactus.dart';
import 'package:dinosaur_game/games/configuration.dart';
import 'package:dinosaur_game/games/dinosaur_game.dart';
import 'package:flame/components.dart';

class CactusGroup extends PositionComponent with HasGameRef<DinosaurGame> {
  CactusGroup();

  @override
  Future<void> onLoad() async {
    position.x = gameRef.size.x;

    addAll([
      Cactus(),
      Cactus(),
      Cactus(),
    ]);
  }

  @override
  void update(double dt) {
    super.update(dt);
    position.x -= Config.gameSpeed * dt;

    // remove cactus when it goes off screen
    if (position.x < -30) {
      removeFromParent();
      gameRef.score += 1;
    }
  }
}
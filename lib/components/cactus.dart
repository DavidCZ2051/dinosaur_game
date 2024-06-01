import 'dart:math';
import 'package:dinosaur_game/games/assets.dart';
import 'package:dinosaur_game/games/dinosaur_game.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';

class Cactus extends SpriteComponent with HasGameRef<DinosaurGame> {
  Cactus();

  Random random = Random();

  @override
  Future<void> onLoad() async {
    final cactus = await Flame.images.load(Assets.cactus);
    // random size for cactus
    size =
        Vector2(random.nextDouble() * 40 + 40, random.nextDouble() * 80 + 40);
    position = Vector2(0, gameRef.size.y - size.y);
    sprite = Sprite(cactus);

    add(RectangleHitbox());
  }
}

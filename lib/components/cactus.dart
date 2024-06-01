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
        Vector2(random.nextDouble() * 70 + 40, random.nextDouble() * 110 + 40);
    position = Vector2(0, gameRef.size.y - size.y);
    sprite = Sprite(cactus);

    add(RectangleHitbox());
  }
}

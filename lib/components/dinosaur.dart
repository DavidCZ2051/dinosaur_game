import 'package:dinosaur_game/games/assets.dart';
import 'package:dinosaur_game/games/configuration.dart';
import 'package:dinosaur_game/games/dinosaur_game.dart';
import 'package:dinosaur_game/games/dinosaur_movement.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flutter/widgets.dart';

class Dinosaur extends SpriteGroupComponent<DinosaurMovement>
    with HasGameRef<DinosaurGame>, CollisionCallbacks {
  Dinosaur();

  @override
  Future<void> onLoad() async {
    final dinosaurStanding = await gameRef.loadSprite(Assets.dinosaurStanding);
    final dinosaurCrouching =
        await gameRef.loadSprite(Assets.dinosaurCrouching);

    size = Vector2(130, 130);
    position = Vector2(150, gameRef.size.y - size.y);
    current = DinosaurMovement.standing;
    sprites = {
      DinosaurMovement.standing: dinosaurStanding,
      DinosaurMovement.crouching: dinosaurCrouching,
    };

    add(RectangleHitbox());
  }

  void jump() {
    add(
      MoveByEffect(
        Vector2(0, Config.gravity),
        EffectController(duration: 0.5, curve: Curves.easeInOut),
      ),
    );
  }

  void crouch() {
    current = DinosaurMovement.crouching;
  }

  void stand() {
    current = DinosaurMovement.standing;
  }

  @override
  void onCollisionStart(
    Set<Vector2> intersectionPoints,
    PositionComponent other,
  ) {
    super.onCollisionStart(intersectionPoints, other);
    print("Collision detected");
    gameOver();
  }

  void gameOver() {
    gameRef.pauseEngine();
  }

  @override
  void update(double dt) {
    super.update(dt);
  }
}

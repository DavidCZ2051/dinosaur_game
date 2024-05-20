import 'package:dinosaur_game/games/assets.dart';
import 'package:dinosaur_game/games/configuration.dart';
import 'package:dinosaur_game/games/dinosaur_game.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/parallax.dart';

class MovingBackground extends ParallaxComponent<DinosaurGame> {
  MovingBackground();

  @override
  Future<void> onLoad() async {
    final movingBackground1 = await Flame.images.load(Assets.movingBackground1);
    final movingBackground2 = await Flame.images.load(Assets.movingBackground2);
    final movingBackground3 = await Flame.images.load(Assets.movingBackground3);
    final movingBackground4 = await Flame.images.load(Assets.movingBackground4);
    parallax = Parallax([
      ParallaxLayer(
        ParallaxImage(movingBackground1, fill: LayerFill.width),
        velocityMultiplier: Vector2(0.05, 0),
      ),
      ParallaxLayer(
        ParallaxImage(movingBackground2, fill: LayerFill.width),
        velocityMultiplier: Vector2(0.1, 0),
      ),
      ParallaxLayer(
        ParallaxImage(movingBackground3, fill: LayerFill.width),
        velocityMultiplier: Vector2(0.2, 0),
      ),
      ParallaxLayer(
        ParallaxImage(movingBackground4, fill: LayerFill.width),
        velocityMultiplier: Vector2(0.4, 0),
      ),
    ]);
  }

  @override
  void update(double dt) {
    super.update(dt);
    parallax?.baseVelocity.x = Config.gameSpeed;
  }
}

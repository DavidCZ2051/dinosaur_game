import 'package:dinosaur_game/games/assets.dart';
import 'package:dinosaur_game/games/dinosaur_game.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';

class Background extends SpriteComponent with HasGameRef<DinosaurGame> {
  Background();

  @override
  Future<void> onLoad() async {
    final background = await Flame.images.load(Assets.background);
    size = gameRef.size;
    sprite = Sprite(background);
  }
}

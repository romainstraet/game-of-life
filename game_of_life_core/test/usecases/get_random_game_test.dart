import 'package:game_of_life_core/game_of_life_core.dart';
import 'package:test/test.dart';

void main() {
  group('Testing GetRandomCall().call()', () {
    test('Should return a 30x30 grid game with random state', () {
      List<List<CellState>> game = GetRandomGame().call();
      expect(game.length, equals(30));
      expect(game[0], equals(30));
      expect(game[15], equals(30));
      expect(game[29], equals(30));
    });
  });
}

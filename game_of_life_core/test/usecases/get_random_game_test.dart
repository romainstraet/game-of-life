import 'package:game_of_life_core/game_of_life_core.dart';
import 'package:test/test.dart';

void main() {
  group('Testing GetRandomCall().call()', () {
    test('Should return a 30x30 grid game', () {
      final List<List<CellState>> game = GetRandomGame().call();
      expect(game.length, equals(30));
      expect(game[0].length, equals(30));
      expect(game[15].length, equals(30));
      expect(game[29].length, equals(30));
    });
  });
}

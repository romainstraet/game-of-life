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
    test('Should return a 30x30 grid game with random state', () {
      final List<List<CellState>> game = GetRandomGame().call();
      final int numOfAliveCellsInFirstRow = game[0].where((CellState el) => el == CellState.alive).length;
      final int numOfDeadCellsInLastRow = game[29].where((CellState el) => el == CellState.dead).length;
      expect(numOfAliveCellsInFirstRow, lessThan(30));
      expect(numOfDeadCellsInLastRow, lessThan(30));
    });
    test('Should return a customatized grid game', () {
      final List<List<CellState>> game1 = GetRandomGame(20, 20).call();
      expect(game1.length, equals(20));
      expect(game1[0].length, equals(20));

      final List<List<CellState>> game2 = GetRandomGame(10, 10).call();
      expect(game2.length, equals(10));
      expect(game2[0].length, equals(10));

      final List<List<CellState>> game3 = GetRandomGame(10, 20).call();
      expect(game3.length, equals(10));
      expect(game3[0].length, equals(20));

      final List<List<CellState>> game4 = GetRandomGame(20, 10).call();
      expect(game4.length, equals(20));
      expect(game4[0].length, equals(10));
    });
  });
}

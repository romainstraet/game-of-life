import 'package:game_of_life_core/entites/game.dart';
import 'package:game_of_life_core/game_of_life_core.dart';
import 'package:test/test.dart';

void main() {
  group('Testing Game(state).countAliveNeighboursOfCell()', () {
    group('Given a 4x4 game with only dead cells', () {
      final List<List<CellState>> game4x4AllDead = <List<CellState>>[
        <CellState>[CellState.dead, CellState.dead],
        <CellState>[CellState.dead, CellState.dead],
      ];

      for (int row = 0; row < game4x4AllDead.length; row++) {
        for (int col = 0; col < game4x4AllDead[row].length; col++) {
          test('Then cell at ($row,$col) should have 0 alive neighbour', () {
            expect(Game(game4x4AllDead).countAliveNeighboursOfCell(row, col), 0);
          });
        }
      }
    });
    group('Given a 4x4 game with alive cells on bottom row', () {
      final List<List<CellState>> game4x4BottomIsAlive = <List<CellState>>[
        <CellState>[CellState.dead, CellState.dead],
        <CellState>[CellState.alive, CellState.alive],
      ];

      for (int col = 0; col < game4x4BottomIsAlive[0].length; col++) {
        test('Cell(0,$col) should have 2 alive neighbour', () {
          expect(
            Game(game4x4BottomIsAlive).countAliveNeighboursOfCell(0, col),
            2,
          );
        });
      }
    });
  });
}

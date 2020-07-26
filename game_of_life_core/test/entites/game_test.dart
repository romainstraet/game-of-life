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
        test('Then cell at (0,$col) should have 2 alive neighbours', () {
          expect(
            Game(game4x4BottomIsAlive).countAliveNeighboursOfCell(0, col),
            2,
          );
        });
      }
    });
    group('Given a 4x4 game with alive cells on top row', () {
      final List<List<CellState>> game4x4TopIsAlive = <List<CellState>>[
        <CellState>[CellState.alive, CellState.alive],
        <CellState>[CellState.dead, CellState.dead],
      ];

      for (int col = 0; col < game4x4TopIsAlive[1].length; col++) {
        test('Then cell at (1,$col) should have 2 alive neighbours', () {
          expect(
            Game(game4x4TopIsAlive).countAliveNeighboursOfCell(1, col),
            2,
          );
        });
      }
    });
    group('Given a 4x4 game with only alive cells', () {
      final List<List<CellState>> game4x4AllAlive = <List<CellState>>[
        <CellState>[CellState.alive, CellState.alive],
        <CellState>[CellState.alive, CellState.alive],
      ];

      for (int row = 0; row < game4x4AllAlive.length; row++) {
        for (int col = 0; col < game4x4AllAlive[row].length; col++) {
          test('Then cell at ($row,$col) should have 3 alive neighbours', () {
            expect(
              Game(game4x4AllAlive).countAliveNeighboursOfCell(row, col),
              3,
            );
          });
        }
      }
    });
  });
}

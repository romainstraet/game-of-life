import 'package:game_of_life_core/entites/game.dart';
import 'package:game_of_life_core/game_of_life_core.dart';
import 'package:test/test.dart';

void main() {
  group('Testing Game(state).countAliveNeighboursOfCell()', () {
    group('Given a 2x2 game with only dead cells', () {
      final List<List<CellState>> game2x2AllDead = <List<CellState>>[
        <CellState>[CellState.dead, CellState.dead],
        <CellState>[CellState.dead, CellState.dead],
      ];

      for (int row = 0; row < game2x2AllDead.length; row++) {
        for (int col = 0; col < game2x2AllDead[row].length; col++) {
          test('Then cell at ($row,$col) should have 0 alive neighbour', () {
            expect(Game(game2x2AllDead).countAliveNeighboursOfCell(row, col), 0);
          });
        }
      }
    });
    group('Given a 2x2 game with alive cells on bottom row', () {
      final List<List<CellState>> game2x2BottomIsAlive = <List<CellState>>[
        <CellState>[CellState.dead, CellState.dead],
        <CellState>[CellState.alive, CellState.alive],
      ];

      for (int col = 0; col < game2x2BottomIsAlive[0].length; col++) {
        test('Then cell at (0,$col) should have 2 alive neighbours', () {
          expect(
            Game(game2x2BottomIsAlive).countAliveNeighboursOfCell(0, col),
            2,
          );
        });
      }
    });
    group('Given a 2x2 game with alive cells on top row', () {
      final List<List<CellState>> game2x2TopIsAlive = <List<CellState>>[
        <CellState>[CellState.alive, CellState.alive],
        <CellState>[CellState.dead, CellState.dead],
      ];

      for (int col = 0; col < game2x2TopIsAlive[1].length; col++) {
        test('Then cell at (1,$col) should have 2 alive neighbours', () {
          expect(
            Game(game2x2TopIsAlive).countAliveNeighboursOfCell(1, col),
            2,
          );
        });
      }
    });
    group('Given a 2x2 game with only alive cells', () {
      final List<List<CellState>> game2x2AllAlive = <List<CellState>>[
        <CellState>[CellState.alive, CellState.alive],
        <CellState>[CellState.alive, CellState.alive],
      ];

      for (int row = 0; row < game2x2AllAlive.length; row++) {
        for (int col = 0; col < game2x2AllAlive[row].length; col++) {
          test('Then cell at ($row,$col) should have 3 alive neighbours', () {
            expect(
              Game(game2x2AllAlive).countAliveNeighboursOfCell(row, col),
              3,
            );
          });
        }
      }
    });
    group('Given a 3x3 game with only alive cells', () {
      final List<List<CellState>> game2x2AllAlive = <List<CellState>>[
        <CellState>[CellState.alive, CellState.alive, CellState.alive],
        <CellState>[CellState.alive, CellState.alive, CellState.alive],
        <CellState>[CellState.alive, CellState.alive, CellState.alive],
      ];
      final List<Map<String, int>> scenarios = <Map<String, int>>[
        <String, int>{'row': 0, 'col': 0, 'expectedNeighbour': 3},
        // <String, int>{'row': 0, 'col': 1, 'expectedNeighbour': 5},
        // <String, int>{'row': 0, 'col': 2, 'expectedNeighbour': 3},
        // <String, int>{'row': 1, 'col': 0, 'expectedNeighbour': 5},
        // <String, int>{'row': 1, 'col': 1, 'expectedNeighbour': 8},
        // <String, int>{'row': 1, 'col': 2, 'expectedNeighbour': 5},
        // <String, int>{'row': 2, 'col': 0, 'expectedNeighbour': 3},
        // <String, int>{'row': 2, 'col': 1, 'expectedNeighbour': 5},
        // <String, int>{'row': 2, 'col': 2, 'expectedNeighbour': 3},
      ];

      for (final Map<String, int> scenario in scenarios) {
        final int row = scenario['row'];
        final int col = scenario['col'];
        final int expectedNeighbour = scenario['expectedNeighbour'];
        test('Then cell at ($row,$col) should have $expectedNeighbour alive neighbours', () {
          expect(
            Game(game2x2AllAlive).countAliveNeighboursOfCell(row, col),
            expectedNeighbour,
          );
        });
      }
    });
  });
}

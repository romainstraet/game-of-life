import 'package:game_of_life_core/entites/cell_state.dart';
import 'package:game_of_life_core/usecases/get_next_game_state.dart';
import 'package:test/test.dart';

void main() {
  group('*Usecase : get next game state*', () {
    test('Testing next state of a 2x2 all dead case', () {
      final List<List<CellState>> game2x2AllDead = <List<CellState>>[
        <CellState>[CellState.dead, CellState.dead],
        <CellState>[CellState.dead, CellState.dead],
      ];
      final List<List<CellState>> newGameState = GetNextGameState(game2x2AllDead).execute();
      expect(newGameState, game2x2AllDead);
    });
    test('Testing next state of a 2x2 all alive case', () {
      final List<List<CellState>> game2x2AllAlive = <List<CellState>>[
        <CellState>[CellState.alive, CellState.alive],
        <CellState>[CellState.alive, CellState.alive],
      ];
      final List<List<CellState>> newGameState = GetNextGameState(game2x2AllAlive).execute();
      expect(newGameState, game2x2AllAlive);
    });
    test('Testing next state of a 2x2 only one alive cell case', () {
      final List<List<CellState>> game2x2OnlyOneAlive = <List<CellState>>[
        <CellState>[CellState.alive, CellState.dead],
        <CellState>[CellState.dead, CellState.dead],
      ];
      final List<List<CellState>> expectedResult = <List<CellState>>[
        <CellState>[CellState.dead, CellState.dead], // Cell(0,0) is dead by solitude
        <CellState>[CellState.dead, CellState.dead],
      ];
      final List<List<CellState>> newGameState = GetNextGameState(game2x2OnlyOneAlive).execute();
      expect(newGameState, expectedResult);
    });
    test('Testing next state of a 2x2 with 3 alive cell case', () {
      final List<List<CellState>> game2x2Owith3Alive = <List<CellState>>[
        <CellState>[CellState.alive, CellState.alive],
        <CellState>[CellState.alive, CellState.dead],
      ];
      final List<List<CellState>> expectedResult = <List<CellState>>[
        <CellState>[CellState.alive, CellState.alive],
        <CellState>[CellState.alive, CellState.alive], // Cell(1,1) should reborn
      ];
      final List<List<CellState>> newGameState = GetNextGameState(game2x2Owith3Alive).execute();
      expect(newGameState, expectedResult);
    });
    test('Testing next state of a 3x3 all alive cells case', () {
      final List<List<CellState>> game3x3AllAliveState0 = <List<CellState>>[
        <CellState>[CellState.alive, CellState.alive, CellState.alive],
        <CellState>[CellState.alive, CellState.alive, CellState.alive],
        <CellState>[CellState.alive, CellState.alive, CellState.alive],
      ];
      final List<List<CellState>> game3x3AllAliveState1 = <List<CellState>>[
        <CellState>[CellState.alive, CellState.dead, CellState.alive],
        <CellState>[CellState.dead, CellState.dead, CellState.dead],
        <CellState>[CellState.alive, CellState.dead, CellState.alive],
      ];
      final List<List<CellState>> gameState1 = GetNextGameState(game3x3AllAliveState0).execute();
      expect(gameState1, game3x3AllAliveState1);
      final List<List<CellState>> game3x3AllAliveState2 = <List<CellState>>[
        <CellState>[CellState.dead, CellState.dead, CellState.dead],
        <CellState>[CellState.dead, CellState.dead, CellState.dead],
        <CellState>[CellState.dead, CellState.dead, CellState.dead],
      ];
      final List<List<CellState>> gameState2 = GetNextGameState(game3x3AllAliveState1).execute();
      expect(gameState2, game3x3AllAliveState2);
    });
    test('Testing next state of a 4x4 random cells case', () {
      final List<List<CellState>> game4x4RandomState0 = <List<CellState>>[
        <CellState>[CellState.dead, CellState.alive, CellState.dead, CellState.dead],
        <CellState>[CellState.alive, CellState.alive, CellState.dead, CellState.dead],
        <CellState>[CellState.dead, CellState.dead, CellState.alive, CellState.dead],
        <CellState>[CellState.dead, CellState.dead, CellState.dead, CellState.dead],
      ];
      final List<List<CellState>> game4x4RandomState1 = <List<CellState>>[
        <CellState>[CellState.alive, CellState.alive, CellState.dead, CellState.dead],
        <CellState>[CellState.alive, CellState.alive, CellState.alive, CellState.dead],
        <CellState>[CellState.dead, CellState.alive, CellState.dead, CellState.dead],
        <CellState>[CellState.dead, CellState.dead, CellState.dead, CellState.dead],
      ];
      final List<List<CellState>> game4x4RandomState2 = <List<CellState>>[
        <CellState>[CellState.alive, CellState.dead, CellState.alive, CellState.dead],
        <CellState>[CellState.dead, CellState.dead, CellState.alive, CellState.dead],
        <CellState>[CellState.alive, CellState.alive, CellState.alive, CellState.dead],
        <CellState>[CellState.dead, CellState.dead, CellState.dead, CellState.dead],
      ];
      final List<List<CellState>> game4x4RandomState3 = <List<CellState>>[
        <CellState>[CellState.dead, CellState.alive, CellState.dead, CellState.dead],
        <CellState>[CellState.alive, CellState.dead, CellState.alive, CellState.alive],
        <CellState>[CellState.dead, CellState.alive, CellState.alive, CellState.dead],
        <CellState>[CellState.dead, CellState.alive, CellState.dead, CellState.dead],
      ];
      final List<List<CellState>> gameState1 = GetNextGameState(game4x4RandomState0).execute();
      expect(gameState1, game4x4RandomState1);
      final List<List<CellState>> gameState2 = GetNextGameState(game4x4RandomState1).execute();
      expect(gameState2, game4x4RandomState2);
      final List<List<CellState>> gameState3 = GetNextGameState(game4x4RandomState2).execute();
      expect(gameState3, game4x4RandomState3);
    });
  });
}

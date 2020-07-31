import 'package:game_of_life_core/entites/cell_state.dart';
import 'package:game_of_life_core/usecases/get_next_game_state.dart';
import 'package:test/test.dart';

void main() {
  group('Testing GetNextGameState().call()', () {
    test('Given a 2x2 all dead case, next game state should only contain dead cells', () {
      final List<List<CellState>> game2x2AllDead = <List<CellState>>[
        <CellState>[CellState.dead, CellState.dead],
        <CellState>[CellState.dead, CellState.dead],
      ];
      final List<List<CellState>> newGameState = GetNextGameState(game2x2AllDead).call();
      expect(newGameState, game2x2AllDead);
    });
    test('Given a 2x2 all alive case, next game state should only contain alive cells', () {
      final List<List<CellState>> game2x2AllAlive = <List<CellState>>[
        <CellState>[CellState.alive, CellState.alive],
        <CellState>[CellState.alive, CellState.alive],
      ];
      final List<List<CellState>> newGameState = GetNextGameState(game2x2AllAlive).call();
      expect(newGameState, game2x2AllAlive);
    });
    test('Given a 2x2 with only one alive cell, next game state should only contain dead cells', () {
      final List<List<CellState>> game2x2OnlyOneAlive = <List<CellState>>[
        <CellState>[CellState.alive, CellState.dead],
        <CellState>[CellState.dead, CellState.dead],
      ];
      final List<List<CellState>> expectedResult = <List<CellState>>[
        <CellState>[CellState.dead, CellState.dead], // Cell(0,0) is dead by solitude
        <CellState>[CellState.dead, CellState.dead],
      ];
      final List<List<CellState>> newGameState = GetNextGameState(game2x2OnlyOneAlive).call();
      expect(newGameState, expectedResult);
    });
    test('Given a 2x2 with 3 alive cells, next game state should only contain alive cells', () {
      final List<List<CellState>> game2x2Owith3Alive = <List<CellState>>[
        <CellState>[CellState.alive, CellState.alive],
        <CellState>[CellState.alive, CellState.dead],
      ];
      final List<List<CellState>> expectedResult = <List<CellState>>[
        <CellState>[CellState.alive, CellState.alive],
        <CellState>[CellState.alive, CellState.alive], // Cell(1,1) should reborn
      ];
      final List<List<CellState>> newGameState = GetNextGameState(game2x2Owith3Alive).call();
      expect(newGameState, expectedResult);
    });
    test('Given a 3x3 all alive cells, next game state should evolve', () {
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
      final List<List<CellState>> gameState1 = GetNextGameState(game3x3AllAliveState0).call();
      expect(gameState1, game3x3AllAliveState1);
      final List<List<CellState>> game3x3AllAliveState2 = <List<CellState>>[
        <CellState>[CellState.dead, CellState.dead, CellState.dead],
        <CellState>[CellState.dead, CellState.dead, CellState.dead],
        <CellState>[CellState.dead, CellState.dead, CellState.dead],
      ];
      final List<List<CellState>> gameState2 = GetNextGameState(game3x3AllAliveState1).call();
      expect(gameState2, game3x3AllAliveState2);
    });
    test('Given a 4x4 with alive and cells cells, next game state should evolve', () {
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
      final List<List<CellState>> gameState1 = GetNextGameState(game4x4RandomState0).call();
      expect(gameState1, game4x4RandomState1);
      final List<List<CellState>> gameState2 = GetNextGameState(game4x4RandomState1).call();
      expect(gameState2, game4x4RandomState2);
      final List<List<CellState>> gameState3 = GetNextGameState(game4x4RandomState2).call();
      expect(gameState3, game4x4RandomState3);
    });
  });
}

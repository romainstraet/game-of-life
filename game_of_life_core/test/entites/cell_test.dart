import 'package:game_of_life_core/entites/cell.dart';
import 'package:game_of_life_core/game_of_life_core.dart';
import 'package:test/test.dart';

void main() {
  group('Testing Cell(state).getNextState()', () {
    test('When cell is alive and have 0 or 1 alive neighbour, Should return dead state', () {
      expect(Cell(CellState.alive).getNextState(0), CellState.dead);
      expect(Cell(CellState.alive).getNextState(1), CellState.dead);
    });
    test('When cell is alive and have 2 or 3 alive neighbours, Should return alive state', () {
      expect(Cell(CellState.alive).getNextState(2), CellState.alive);
      expect(Cell(CellState.alive).getNextState(3), CellState.alive);
    });
    test('When cell is alive and have more than 3 alive neighbours, Should return alive state', () {
      expect(Cell(CellState.alive).getNextState(4), CellState.dead);
      expect(Cell(CellState.alive).getNextState(5), CellState.dead);
      expect(Cell(CellState.alive).getNextState(6), CellState.dead);
      expect(Cell(CellState.alive).getNextState(7), CellState.dead);
      expect(Cell(CellState.alive).getNextState(8), CellState.dead);
    });
    test('When cell is dead and have 0 or 1 alive neighbour, Should return dead state', () {
      expect(Cell(CellState.dead).getNextState(0), CellState.dead);
      expect(Cell(CellState.dead).getNextState(1), CellState.dead);
    });
    test('When cell is dead and have 2 alive neighbours, Should return dead state', () {
      expect(Cell(CellState.dead).getNextState(2), CellState.dead);
    });
    test('When cell is dead and have 3 alive neighbours, Should return alive state', () {
      expect(Cell(CellState.dead).getNextState(3), CellState.alive);
    });
  });
}

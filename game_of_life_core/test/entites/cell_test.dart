import 'package:game_of_life_core/entites/cell.dart';
import 'package:game_of_life_core/game_of_life_core.dart';
import 'package:test/test.dart';

void main() {
  group('Testing Cell(state).getNextState()', () {
    test('When cell is alive and have 0 or 1 neighbour, Should return dead state', () {
      expect(Cell(CellState.alive).getNextState(0), CellState.dead);
      expect(Cell(CellState.alive).getNextState(1), CellState.dead);
    });
  });
}

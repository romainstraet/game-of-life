import 'package:game_of_life_core/entites/cell.dart';
import 'package:game_of_life_core/entites/cell_state.dart';
import 'package:game_of_life_core/entites/game.dart';

class GetNextGameState {
  GetNextGameState(this._initialState);
  final List<List<CellState>> _initialState;

  List<List<CellState>> execute() {
    final List<List<CellState>> nextGameState = <List<CellState>>[];
    final Game game = Game(_initialState);
    for (int row = 0; row < _initialState.length; row++) {
      final List<CellState> newRowState = <CellState>[];
      for (int col = 0; col < _initialState[row].length; col++) {
        final int numOfAliveNeightbours = game.countAliveNeighboursOfCell(row, col);
        final CellState initialCellState = _initialState[row][col];
        final CellState newCellState = Cell(initialCellState).getNextState(numOfAliveNeightbours);
        newRowState.add(newCellState);
      }
      nextGameState.add(newRowState);
    }
    return nextGameState;
  }
}

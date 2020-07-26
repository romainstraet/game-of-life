import 'cell_state.dart';

class Game {
  Game(this._state);
  final List<List<CellState>> _state;

  int countAliveNeighboursOfCell(int row, int col) {
    final List<CellState> firstRow = _state[0];
    final List<CellState> lastRow = _state[_state.length - 1];
    final int numOfAliveCellsOnTopRow = firstRow.where((CellState el) => el == CellState.alive).length;
    final int numOfAliveCellsOnBottomRow = lastRow.where((CellState el) => el == CellState.alive).length;

    return numOfAliveCellsOnTopRow + numOfAliveCellsOnBottomRow;
  }
}

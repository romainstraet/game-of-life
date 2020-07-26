import 'cell_state.dart';

class Game {
  Game(this._state);
  final List<List<CellState>> _state;

  int countAliveNeighboursOfCell(int row, int col) {
    final CellState currentCell = _state[row][col];
    // final List<CellState> firstRow = _state[0];
    // final List<CellState> lastRow = _state[_state.length - 1];
    int numOfAliveCells = 0;
    for (final List<CellState> row in _state) {
      numOfAliveCells += row.where((CellState el) => el == CellState.alive).length;
    }
    // final int numOfAliveCellsOnTopRow = firstRow.where((CellState el) => el == CellState.alive).length;
    // final int numOfAliveCellsOnBottomRow = lastRow.where((CellState el) => el == CellState.alive).length;
    // int numOfAliveCells = numOfAliveCellsOnTopRow + numOfAliveCellsOnBottomRow;
    if (currentCell == CellState.alive) {
      numOfAliveCells -= 1;
    }
    return numOfAliveCells;
  }
}

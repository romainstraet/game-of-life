import 'cell_state.dart';

class Game {
  Game(this._state);
  final List<List<CellState>> _state;

  int countAliveNeighboursOfCell(int row, int col) {
    final List<CellState> lastRow = _state[_state.length - 1];
    final int numOfAliveCellsOnBottomRow = lastRow.where((CellState el) => el == CellState.alive).length;
    return numOfAliveCellsOnBottomRow;
  }
}

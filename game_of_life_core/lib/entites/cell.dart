import 'cell_state.dart';

class Cell {
  Cell(this._currentState);
  CellState _currentState;

  CellState getNextState(int numOfNeighbours) {
    if (_currentState == CellState.dead && numOfNeighbours == 2) {
      return CellState.dead;
    }
    if (numOfNeighbours == 2 || numOfNeighbours == 3) {
      return CellState.alive;
    }
    return CellState.dead;
  }
}

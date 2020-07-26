import 'cell_state.dart';

class Cell {
  Cell(this._currentState);
  CellState _currentState;

  CellState getNextState(int numOfNeighbours) {
    if (numOfNeighbours == 2 || numOfNeighbours == 3) {
      return CellState.alive;
    }
    return CellState.dead;
  }
}

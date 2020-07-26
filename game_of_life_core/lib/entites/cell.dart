import 'cell_state.dart';

class Cell {
  Cell(this._currentState);
  CellState _currentState;

  CellState getNextState(int numOfNeighbours) {
    return CellState.dead;
  }
}

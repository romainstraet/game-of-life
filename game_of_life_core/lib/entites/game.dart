import 'cell_state.dart';

class Game {
  Game(this._state);
  final List<List<CellState>> _state;

  int countAliveNeighboursOfCell(int row, int col) {
    final CellState currentCell = _state[row][col];
    final List<List<CellState>> reducedGame = _reduceGameToNeighboursOfCell(row, col);
    int numOfAliveCells = 0;
    for (final List<CellState> row in reducedGame) {
      numOfAliveCells += row.where((CellState el) => el == CellState.alive).length;
    }
    if (currentCell == CellState.alive) {
      numOfAliveCells -= 1;
    }
    return numOfAliveCells;
  }

  List<List<CellState>> _reduceGameToNeighboursOfCell(int row, int col) {
    final int startRowIndexIncl = _isFirstRow(row) ? row : row - 1;
    final int endRowIndexExcl = _isLastRow(row) ? row + 1 : row + 2;
    final List<List<CellState>> reducedGameState = <List<CellState>>[];
    final List<List<CellState>> reducedRows = _state.getRange(startRowIndexIncl, endRowIndexExcl).toList();
    for (final List<CellState> rowList in reducedRows) {
      final int startColIndexIncl = _isFirstCol(col) ? col : col - 1;
      final int endColIndexIncl = _isLastCol(col, rowList.length) ? col + 1 : col + 2;
      final List<CellState> reducedRow = rowList.getRange(startColIndexIncl, endColIndexIncl).toList();
      reducedGameState.add(reducedRow);
    }
    return reducedGameState;
  }

  bool _isFirstRow(int row) {
    return row == 0;
  }

  bool _isLastRow(int row) {
    return row + 1 == _state.length;
  }

  bool _isFirstCol(int col) {
    return col == 0;
  }

  bool _isLastCol(int col, int colLength) {
    return col + 1 == colLength;
  }
}

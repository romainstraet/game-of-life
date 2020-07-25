import 'dart:math';

import 'package:game_of_life_core/entites/cell_state.dart';

class GetRandomGame {
  GetRandomGame([this._rows = 30, this._cols = 30]);
  final int _rows;
  final int _cols;

  List<List<CellState>> call() {
    final List<List<CellState>> game = <List<CellState>>[];
    for (int row = 0; row < _rows; row++) {
      game.add(_generateNewRow());
    }
    return game;
  }

  List<CellState> _generateNewRow() {
    final List<CellState> row = <CellState>[];
    for (int col = 0; col < _cols; col++) {
      row.add(_getRandomCellState());
    }
    return row;
  }

  CellState _getRandomCellState() {
    return Random().nextInt(4) < 3 ? CellState.dead : CellState.alive;
  }
}

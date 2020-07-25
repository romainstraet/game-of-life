import 'package:game_of_life_core/entites/cell_state.dart';

class GetRandomGame {
  List<List<CellState>> call() {
    final List<List<CellState>> game = <List<CellState>>[];
    for (int row = 0; row < 30; row++) {
      final List<CellState> row = <CellState>[];
      for (int col = 0; col < 30; col++) {
        row.add(CellState.alive);
      }
      game.add(row);
    }
    return game;
  }
}

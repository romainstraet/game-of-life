import 'package:game_of_life_core/entites/cell_state.dart';
import 'package:game_of_life_core/interfaces/game_repository.dart';

import 'get_all_games.dart';
import 'get_next_game_state.dart';
import 'get_random_game.dart';

class GameOfLifeCoreUsecases {
  GameOfLifeCoreUsecases(this._gameRepo);
  final GameRepository _gameRepo;

  Future<List<Map<String, List<List<CellState>>>>> getAllGames() {
    return GetAllGames(_gameRepo).call();
  }

  List<List<CellState>> getRandomGame([int row = 30, int col = 30]) {
    return GetRandomGame(row, col).call();
  }

  List<List<CellState>> getNextGameState(List<List<CellState>> initialGameState) {
    return GetNextGameState(initialGameState).call();
  }
}

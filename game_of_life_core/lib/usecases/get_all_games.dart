import 'package:game_of_life_core/entites/cell_state.dart';
import 'package:game_of_life_core/interfaces/game_repository.dart';

class GetAllGames {
  GetAllGames(this._gameRepo);
  final GameRepository _gameRepo;

  Future<List<Map<String, List<List<CellState>>>>> call() {
    return _gameRepo.getAllGames();
  }
}

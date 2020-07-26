import 'package:game_of_life_core/entites/cell_state.dart';

abstract class GameRepository {
  Future<List<Map<String, List<List<CellState>>>>> getAllGames();
}

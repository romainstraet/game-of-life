import 'package:game_of_life_core/game_of_life_core.dart';

class GameRepositoryInMemory implements GameRepository {
  @override
  Future<List<Map<String, List<List<CellState>>>>> getAllGames() async {
    final Map<String, List<List<CellState>>> game1 = <String, List<List<CellState>>>{
      'Random game 1': GetRandomGame().call(),
    };
    final Map<String, List<List<CellState>>> game2 = <String, List<List<CellState>>>{
      'Random game 2': GetRandomGame().call(),
    };
    final Map<String, List<List<CellState>>> game3 = <String, List<List<CellState>>>{
      'Random game 3': GetRandomGame().call(),
    };
    // ignore: always_specify_types
    return Future.value([game1, game2, game3]);
  }
}

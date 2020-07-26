import 'package:game_of_life_core/game_of_life_core.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

class MockRepository extends Mock implements GameRepository {}

void main() {
  final GameRepository mockRepo = MockRepository();
  final Map<String, List<List<CellState>>> game1 = <String, List<List<CellState>>>{
    'alive game': <List<CellState>>[
      <CellState>[CellState.alive, CellState.alive],
      <CellState>[CellState.alive, CellState.alive],
    ]
  };
  final Map<String, List<List<CellState>>> game2 = <String, List<List<CellState>>>{
    'dead game': <List<CellState>>[
      <CellState>[CellState.dead, CellState.dead],
      <CellState>[CellState.dead, CellState.dead],
    ]
  };
  group('Testing GetAllGames().call()', () {
    test('Should return a list of games', () async {
      when(mockRepo.getAllGames()).thenAnswer((_) => Future.value([game1, game2]));
      final List<Map<String, List<List<CellState>>>> games = await GetAllGames(mockRepo).call();
      expect(games.length, equals(2));
      expect(games[0], equals(game1));
      expect(games[1], equals(game2));
    });
  });
}

import 'package:flutter_test/flutter_test.dart';
import 'package:game_of_life_core/game_of_life_core.dart';
import 'package:game_of_life_mobile_app/game_view_model.dart';
import 'package:game_of_life_repository/game_of_life_repository.dart';

void main() {
  final GameRepository gameRepositoryInMemory = GameRepositoryInMemory();
  final GameOfLifeCoreUsecases gameOfLifeCoreUsecases = GameOfLifeCoreUsecases(gameRepositoryInMemory);
  GameViewModel gameViewModel;

  setUp(() {
    gameViewModel = GameViewModel(gameOfLifeCoreUsecases);
  });

  tearDown(() {
    gameViewModel.dispose();
  });

// onInit
// onPlay
// onPause
// onNextState
// onPreviousState
// onReset
// onIncreaseSpead
// onDecreaseSpeed
//

  test('When onInit method is Called Then a game state should be loaded', () {
    gameViewModel.onInit();
    expect(gameViewModel.currentState, isNotNull);
  });
  group('Given a game is loaded', () {
    setUp(() {
      gameViewModel.onInit();
    });

    test('When onPlay method is Called Then the game state should update automatically', () async {
      final List<List<CellState>> state1 = gameViewModel.currentState;
      gameViewModel.onPlay();
      await Future<void>.delayed(const Duration(milliseconds: 1000));
      final List<List<CellState>> state2 = gameViewModel.currentState;
      expect(state2, isNot(state1));
      expect(gameViewModel.stepCount, greaterThan(0));
      expect(gameViewModel.gameIsOnPlay, isTrue);
    });
    test('When onPause method is Called Then auto-updating state should stop', () async {
      gameViewModel.onPlay();
      await Future<void>.delayed(const Duration(milliseconds: 1000));
      final List<List<CellState>> state1 = gameViewModel.currentState;
      gameViewModel.onPause();
      final List<List<CellState>> state2 = gameViewModel.currentState;
      expect(state2, equals(state1));
      expect(gameViewModel.gameIsOnPlay, isFalse);
    });
    test('When onNextState method is Called Then game state should be updated', () {
      final List<List<CellState>> state1 = gameViewModel.currentState;
      gameViewModel.onNextState();
      final List<List<CellState>> state2 = gameViewModel.currentState;
      expect(state2, isNot(state1));
      expect(gameViewModel.stepCount, equals(1));
    });
    test('When onPreviousState method is Called Then game state should be updated with previous state', () {
      final List<List<CellState>> state1 = gameViewModel.currentState;
      gameViewModel.onNextState();
      gameViewModel.onPreviousState();
      final List<List<CellState>> state2 = gameViewModel.currentState;
      expect(state2, equals(state1));
      expect(gameViewModel.stepCount, equals(0));
    });
    test('When onReset method is Called Then initial state should be reset', () {
      final List<List<CellState>> initialState = gameViewModel.currentState;
      gameViewModel.onNextState();
      gameViewModel.onReset();
      final List<List<CellState>> newState = gameViewModel.currentState;
      expect(newState, equals(initialState));
      expect(gameViewModel.stepCount, equals(0));
      expect(gameViewModel.gameIsOnPlay, isFalse);
    });
    test('When onIncreaseSpead method is Called Then auto-updating should be quicker', () async {
      // PLAY WITH NORMAL SPEED
      gameViewModel.onPlay();
      await Future<void>.delayed(const Duration(milliseconds: 2000));
      final int stepCount1 = gameViewModel.stepCount;
      // RESET AND PLAY WITH INCREASED SPEED
      gameViewModel.onReset();
      for (int i = 0; i < 10; i++) {
        gameViewModel.onIncreaseSpeed();
      }
      gameViewModel.onPlay();
      await Future<void>.delayed(const Duration(milliseconds: 2000));
      final int stepCount2 = gameViewModel.stepCount;
      // COMPARE
      expect(stepCount2, greaterThan(stepCount1));
    });
    test('When onDecreaseSpeed method is Called Then auto-updating should be slower', () async {
      // PLAY WITH NORMAL SPEED
      gameViewModel.onPlay();
      await Future<void>.delayed(const Duration(milliseconds: 2000));
      final int stepCount1 = gameViewModel.stepCount;
      // RESET AND PLAY WITH DECREASED SPEED
      gameViewModel.onReset();
      for (int i = 0; i < 10; i++) {
        gameViewModel.onDecreaseSpeed();
      }
      gameViewModel.onPlay();
      await Future<void>.delayed(const Duration(milliseconds: 2000));
      final int stepCount2 = gameViewModel.stepCount;
      // COMPARE
      expect(stepCount2, lessThan(stepCount1));
    });
    test('When onOpenMenu method is Called Then the list of available games should be available', () async {
      await gameViewModel.onOpenMenu();
      expect(gameViewModel.gameNames, isNotEmpty);
    });
    test('When onSelectGame method is Called Then the game state should be updated', () async {
      await gameViewModel.onOpenMenu();
      final String gameSelected = gameViewModel.gameNames[0];
      gameViewModel.onSelectGame(gameSelected);
      expect(gameViewModel.currentState, isNotEmpty);
    });
    test('When onCellClick method is Called Then the selected cell state should be updated', () {
      gameViewModel.onNewBlankGame();
      expect(gameViewModel.currentState[0][0], equals(CellState.dead));
      gameViewModel.onCellTap(0, 0);
      expect(gameViewModel.currentState[0][0], equals(CellState.alive));
    });
  });
}

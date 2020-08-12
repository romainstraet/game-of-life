import 'dart:async';

import 'package:game_of_life_core/game_of_life_core.dart';
import 'package:mobx/mobx.dart';

part 'game_view_model.g.dart';

class GameViewModel = _GameViewModel with _$GameViewModel;

abstract class _GameViewModel with Store {
  _GameViewModel(this._gameCoreUsecases);
  final GameOfLifeCoreUsecases _gameCoreUsecases;

  @observable
  List<List<CellState>> _initialState;

  @observable
  List<List<CellState>> _currentState;

  @observable
  ObservableList<List<List<CellState>>> _previousStates = ObservableList<List<List<CellState>>>();

  @observable
  List<Map<String, List<List<CellState>>>> _allGames = <Map<String, List<List<CellState>>>>[];

  @observable
  List<String> _gameNames = <String>[];

  @observable
  Timer _timer;

  @observable
  int _intervalInMs = 500;

  @computed
  List<List<CellState>> get currentState => _currentState;

  @computed
  bool get gameIsOnPlay => _timer != null;

  @computed
  int get stepCount => _previousStates.length;

  @computed
  List<String> get gameNames => _gameNames;

  @action
  void onInit() {
    _initialState = _gameCoreUsecases.getRandomGame();
    _currentState = _initialState;
  }

  @action
  void onPlay() {
    _timer = Timer.periodic(Duration(milliseconds: _intervalInMs), (Timer timer) => onNextState());
  }

  @action
  void onPause() {
    _stopTimer();
  }

  @action
  void onReset() {
    _stopTimer();
    _intervalInMs = 500;
    _currentState = _initialState;
    _previousStates.clear();
  }

  @action
  void onNextState() {
    _previousStates.add(currentState);
    _currentState = _gameCoreUsecases.getNextGameState(currentState);
  }

  @action
  void onPreviousState() {
    if (_previousStates.isNotEmpty) {
      _currentState = _previousStates.last;
      _previousStates.removeLast();
    }
  }

  @action
  void onIncreaseSpeed() {
    _intervalInMs -= 50;
    _resetTimer();
  }

  @action
  void onDecreaseSpeed() {
    _intervalInMs += 50;
    _resetTimer();
  }

  @action
  Future<void> onOpenMenu() async {
    if (_allGames.isEmpty) {
      _allGames = await _gameCoreUsecases.getAllGames();
      // ignore: avoid_function_literals_in_foreach_calls
      _allGames.forEach((Map<String, List<List<CellState>>> element) {
        element.forEach((String key, List<List<CellState>> value) => _gameNames.add(key));
      });
    }
  }

  @action
  void onSelectGame(String gameName) {
    final List<Map<String, List<List<CellState>>>> selectedGame =
        _allGames.where((Map<String, List<List<CellState>>> element) => element.containsKey(gameName)).toList();
    onReset();
    _initialState = selectedGame[0][gameName];
    _currentState = _initialState;
  }

  @action
  void onCellTap(int row, int col) {
    final List<List<CellState>> newState = _currentState.map((List<CellState> e) => e).toList();
    newState[row][col] == CellState.alive ? newState[row][col] = CellState.dead : newState[row][col] = CellState.alive;
    _currentState = newState;
  }

  @action
  void onNewBlankGame() {
    final List<List<CellState>> newBlankGame = <List<CellState>>[];
    for (int row = 0; row < 30; row++) {
      final List<CellState> newBlankRow = <CellState>[];
      for (int col = 0; col < 30; col++) {
        newBlankRow.add(CellState.dead);
      }
      newBlankGame.add(newBlankRow);
    }
    onReset();
    _initialState = newBlankGame;
    _currentState = _initialState;
  }

  @action
  void onNewRandomGame() {
    onReset();
    _initialState = _gameCoreUsecases.getRandomGame();
    _currentState = _initialState;
  }

  void _stopTimer() {
    if (gameIsOnPlay) {
      _timer.cancel();
      _timer = null;
    }
  }

  void _resetTimer() {
    _stopTimer();
    onPlay();
  }

  @action
  void dispose() {
    _stopTimer();
  }
}

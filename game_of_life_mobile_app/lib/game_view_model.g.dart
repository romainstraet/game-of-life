// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$GameViewModel on _GameViewModel, Store {
  Computed<List<List<CellState>>> _$currentStateComputed;

  @override
  List<List<CellState>> get currentState => (_$currentStateComputed ??=
          Computed<List<List<CellState>>>(() => super.currentState,
              name: '_GameViewModel.currentState'))
      .value;
  Computed<bool> _$gameIsOnPlayComputed;

  @override
  bool get gameIsOnPlay =>
      (_$gameIsOnPlayComputed ??= Computed<bool>(() => super.gameIsOnPlay,
              name: '_GameViewModel.gameIsOnPlay'))
          .value;
  Computed<int> _$stepCountComputed;

  @override
  int get stepCount =>
      (_$stepCountComputed ??= Computed<int>(() => super.stepCount,
              name: '_GameViewModel.stepCount'))
          .value;
  Computed<List<String>> _$gameNamesComputed;

  @override
  List<String> get gameNames =>
      (_$gameNamesComputed ??= Computed<List<String>>(() => super.gameNames,
              name: '_GameViewModel.gameNames'))
          .value;

  final _$_initialStateAtom = Atom(name: '_GameViewModel._initialState');

  @override
  List<List<CellState>> get _initialState {
    _$_initialStateAtom.reportRead();
    return super._initialState;
  }

  @override
  set _initialState(List<List<CellState>> value) {
    _$_initialStateAtom.reportWrite(value, super._initialState, () {
      super._initialState = value;
    });
  }

  final _$_currentStateAtom = Atom(name: '_GameViewModel._currentState');

  @override
  List<List<CellState>> get _currentState {
    _$_currentStateAtom.reportRead();
    return super._currentState;
  }

  @override
  set _currentState(List<List<CellState>> value) {
    _$_currentStateAtom.reportWrite(value, super._currentState, () {
      super._currentState = value;
    });
  }

  final _$_previousStatesAtom = Atom(name: '_GameViewModel._previousStates');

  @override
  ObservableList<List<List<CellState>>> get _previousStates {
    _$_previousStatesAtom.reportRead();
    return super._previousStates;
  }

  @override
  set _previousStates(ObservableList<List<List<CellState>>> value) {
    _$_previousStatesAtom.reportWrite(value, super._previousStates, () {
      super._previousStates = value;
    });
  }

  final _$_allGamesAtom = Atom(name: '_GameViewModel._allGames');

  @override
  List<Map<String, List<List<CellState>>>> get _allGames {
    _$_allGamesAtom.reportRead();
    return super._allGames;
  }

  @override
  set _allGames(List<Map<String, List<List<CellState>>>> value) {
    _$_allGamesAtom.reportWrite(value, super._allGames, () {
      super._allGames = value;
    });
  }

  final _$_gameNamesAtom = Atom(name: '_GameViewModel._gameNames');

  @override
  List<String> get _gameNames {
    _$_gameNamesAtom.reportRead();
    return super._gameNames;
  }

  @override
  set _gameNames(List<String> value) {
    _$_gameNamesAtom.reportWrite(value, super._gameNames, () {
      super._gameNames = value;
    });
  }

  final _$_timerAtom = Atom(name: '_GameViewModel._timer');

  @override
  Timer get _timer {
    _$_timerAtom.reportRead();
    return super._timer;
  }

  @override
  set _timer(Timer value) {
    _$_timerAtom.reportWrite(value, super._timer, () {
      super._timer = value;
    });
  }

  final _$_intervalInMsAtom = Atom(name: '_GameViewModel._intervalInMs');

  @override
  int get _intervalInMs {
    _$_intervalInMsAtom.reportRead();
    return super._intervalInMs;
  }

  @override
  set _intervalInMs(int value) {
    _$_intervalInMsAtom.reportWrite(value, super._intervalInMs, () {
      super._intervalInMs = value;
    });
  }

  final _$onOpenMenuAsyncAction = AsyncAction('_GameViewModel.onOpenMenu');

  @override
  Future<void> onOpenMenu() {
    return _$onOpenMenuAsyncAction.run(() => super.onOpenMenu());
  }

  final _$_GameViewModelActionController =
      ActionController(name: '_GameViewModel');

  @override
  void onInit() {
    final _$actionInfo = _$_GameViewModelActionController.startAction(
        name: '_GameViewModel.onInit');
    try {
      return super.onInit();
    } finally {
      _$_GameViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onPlay() {
    final _$actionInfo = _$_GameViewModelActionController.startAction(
        name: '_GameViewModel.onPlay');
    try {
      return super.onPlay();
    } finally {
      _$_GameViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onPause() {
    final _$actionInfo = _$_GameViewModelActionController.startAction(
        name: '_GameViewModel.onPause');
    try {
      return super.onPause();
    } finally {
      _$_GameViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onReset() {
    final _$actionInfo = _$_GameViewModelActionController.startAction(
        name: '_GameViewModel.onReset');
    try {
      return super.onReset();
    } finally {
      _$_GameViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onNextState() {
    final _$actionInfo = _$_GameViewModelActionController.startAction(
        name: '_GameViewModel.onNextState');
    try {
      return super.onNextState();
    } finally {
      _$_GameViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onPreviousState() {
    final _$actionInfo = _$_GameViewModelActionController.startAction(
        name: '_GameViewModel.onPreviousState');
    try {
      return super.onPreviousState();
    } finally {
      _$_GameViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onIncreaseSpeed() {
    final _$actionInfo = _$_GameViewModelActionController.startAction(
        name: '_GameViewModel.onIncreaseSpeed');
    try {
      return super.onIncreaseSpeed();
    } finally {
      _$_GameViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onDecreaseSpeed() {
    final _$actionInfo = _$_GameViewModelActionController.startAction(
        name: '_GameViewModel.onDecreaseSpeed');
    try {
      return super.onDecreaseSpeed();
    } finally {
      _$_GameViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onSelectGame(String gameName) {
    final _$actionInfo = _$_GameViewModelActionController.startAction(
        name: '_GameViewModel.onSelectGame');
    try {
      return super.onSelectGame(gameName);
    } finally {
      _$_GameViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onCellTap(int row, int col) {
    final _$actionInfo = _$_GameViewModelActionController.startAction(
        name: '_GameViewModel.onCellTap');
    try {
      return super.onCellTap(row, col);
    } finally {
      _$_GameViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onNewBlankGame() {
    final _$actionInfo = _$_GameViewModelActionController.startAction(
        name: '_GameViewModel.onNewBlankGame');
    try {
      return super.onNewBlankGame();
    } finally {
      _$_GameViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onNewRandomGame() {
    final _$actionInfo = _$_GameViewModelActionController.startAction(
        name: '_GameViewModel.onNewRandomGame');
    try {
      return super.onNewRandomGame();
    } finally {
      _$_GameViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void dispose() {
    final _$actionInfo = _$_GameViewModelActionController.startAction(
        name: '_GameViewModel.dispose');
    try {
      return super.dispose();
    } finally {
      _$_GameViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentState: ${currentState},
gameIsOnPlay: ${gameIsOnPlay},
stepCount: ${stepCount},
gameNames: ${gameNames}
    ''';
  }
}

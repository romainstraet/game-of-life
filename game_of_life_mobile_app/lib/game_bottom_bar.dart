import 'package:flutter/material.dart';

import 'game_view_model.dart';

class GameBottomBar extends StatelessWidget {
  const GameBottomBar(this._gameViewModel);
  final GameViewModel _gameViewModel;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 4.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.undo),
            onPressed:
                _gameViewModel.gameIsOnPlay || _gameViewModel.stepCount == 0 ? null : _gameViewModel.onPreviousState,
          ),
          IconButton(
            icon: Icon(Icons.fast_rewind),
            onPressed: _gameViewModel.gameIsOnPlay ? _gameViewModel.onDecreaseSpeed : null,
          ),
          const SizedBox(width: 30),
          IconButton(
            icon: Icon(Icons.fast_forward),
            onPressed: _gameViewModel.gameIsOnPlay ? _gameViewModel.onIncreaseSpeed : null,
          ),
          IconButton(
            icon: Icon(Icons.redo),
            onPressed: _gameViewModel.gameIsOnPlay ? null : _gameViewModel.onNextState,
          ),
        ],
      ),
    );
  }
}

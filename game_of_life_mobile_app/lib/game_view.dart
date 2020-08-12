import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:game_of_life_mobile_app/game_menu.dart';
import 'game_bottom_bar.dart';
import 'game_grid.dart';
import 'game_view_model.dart';

class GameView extends StatelessWidget {
  const GameView(this._gameViewModel);
  final GameViewModel _gameViewModel;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return MaterialApp(
          home: Scaffold(
            appBar: AppBar(
              title: const Text('Game of life'),
              leading: Center(child: Text(_gameViewModel.stepCount.toString())),
              actions: <Widget>[
                GameMenu(_gameViewModel),
                IconButton(
                  icon: Icon(Icons.replay),
                  onPressed: _gameViewModel.onReset,
                ),
              ],
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
            floatingActionButton: FloatingActionButton(
              child: Icon(_gameViewModel.gameIsOnPlay ? Icons.pause : Icons.play_arrow),
              onPressed: _gameViewModel.gameIsOnPlay ? _gameViewModel.onPause : _gameViewModel.onPlay,
            ),
            body: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(10),
                child: GameGrid(_gameViewModel),
              ),
            ),
            bottomNavigationBar: GameBottomBar(_gameViewModel),
          ),
        );
      },
    );
  }
}

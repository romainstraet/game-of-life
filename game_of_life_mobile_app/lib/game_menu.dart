import 'package:flutter/material.dart';

import 'game_view_model.dart';

class GameMenu extends StatelessWidget {
  const GameMenu(this._gameViewModel);
  final GameViewModel _gameViewModel;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.fiber_new),
        onPressed: () {
          _gameViewModel.onOpenMenu();
          showModalBottomSheet<void>(
            context: context,
            builder: (_) {
              return Container(
                height: 300,
                child: ListView(
                  children: <Widget>[
                    const Divider(),
                    Container(
                      //padding: EdgeInsets.symmetric(vertical: 20),
                      child: FlatButton(
                        child: const Text('New Blank Game'),
                        onPressed: () {
                          _gameViewModel.onNewBlankGame();
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    const Divider(),
                    Container(
                      //padding: EdgeInsets.symmetric(vertical: 20),
                      child: FlatButton(
                        child: const Text('New Random Game'),
                        onPressed: () {
                          _gameViewModel.onNewRandomGame();
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    const Divider(),
                    for (final String gameName in _gameViewModel.gameNames) ...<Widget>[
                      Container(
                        //padding: EdgeInsets.symmetric(vertical: 20),
                        child: FlatButton(
                          child: Text(gameName),
                          onPressed: () {
                            _gameViewModel.onSelectGame(gameName);
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      const Divider(),
                    ]
                  ],
                ),
              );
            },
          );
        });
  }
}

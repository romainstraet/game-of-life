import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:game_of_life_core/game_of_life_core.dart';

import 'game_view_model.dart';

class GameGrid extends StatelessWidget {
  const GameGrid(this._gameViewModel);
  final GameViewModel _gameViewModel;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, BoxConstraints constraints) {
        return Column(
          children: <Widget>[
            for (int rowIndex = 0; rowIndex < _gameViewModel.currentState.length; rowIndex++)
              Row(
                children: <Widget>[
                  for (int colIndex = 0; colIndex < _gameViewModel.currentState[rowIndex].length; colIndex++)
                    InkWell(
                      onTap: () => _gameViewModel.onCellTap(rowIndex, colIndex),
                      child: Observer(
                        builder: (_) => Container(
                          height: constraints.maxWidth / _gameViewModel.currentState[rowIndex].length,
                          width: constraints.maxWidth / _gameViewModel.currentState[rowIndex].length,
                          decoration: BoxDecoration(
                            color: _gameViewModel.currentState[rowIndex][colIndex] == CellState.alive
                                ? Colors.black
                                : Colors.white,
                            border: Border.all(
                              color: Colors.black12,
                              width: 1,
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
          ],
        );
      },
    );
  }
}

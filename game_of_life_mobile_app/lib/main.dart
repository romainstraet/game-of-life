import 'package:flutter/material.dart';
import 'package:game_of_life_core/game_of_life_core.dart';
import 'package:game_of_life_repository/game_of_life_repository.dart';

import 'game_view.dart';
import 'game_view_model.dart';

void main() {
  final GameRepository gameRepositoryInMemory = GameRepositoryInMemory();
  final GameOfLifeCoreUsecases gameOfLifeCoreUsecases = GameOfLifeCoreUsecases(gameRepositoryInMemory);
  final GameViewModel gameViewModel = GameViewModel(gameOfLifeCoreUsecases);
  gameViewModel.onInit();
  runApp(GameView(gameViewModel));
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:minion/components/snake_game/scores.dart';
import 'package:minion/components/snake_game/controls.dart';
import 'package:minion/components/snake_game/game_board.dart';
import 'package:minion/components/snake_game/game_state.dart';
import 'package:minion/components/snake_game/color.dart';

class SnakeGame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<GameState>(
      create: (_) => GameState(),
      child: Builder(
        builder: (context) {
          final state = Provider.of<GameState>(context);
          return Scaffold (
            backgroundColor: AppColor.primaryColor,
            appBar: AppBar(
              title: Text("Snake Game"),
              elevation: 0,
              centerTitle: true,
              backgroundColor: AppColor.secondaryColor,
            ),
            body: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Expanded(
                  flex: 3,
                  child: GameBoard(),
                ),
                Expanded(
                  flex: 2,
                  child: Controls(),
                ),
                Expanded(
                  flex: 1,
                  child: Scores(state.currentScore, state.bestScore),
                ),
              ],
            )
          );
        },
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:minion/main.dart';
import 'package:minion/components/hangman/color.dart';
import 'package:minion/components/hangman/figure_image.dart';
import 'package:minion/components/hangman/letter.dart';
import 'package:minion/components/hangman/game.dart';

class Hangman extends StatefulWidget {
  const Hangman({Key? key}) : super(key: key);

  @override
  _Hangman createState() => _Hangman();
}

class _Hangman extends State<Hangman> {
  String word = "Flutter".toUpperCase();
  List<String> alphabets = [
    "A",
    "B",
    "C",
    "D",
    "E",
    "F",
    "G",
    "H",
    "I",
    "J",
    "K",
    "L",
    "M",
    "N",
    "O",
    "P",
    "Q",
    "R",
    "S",
    "T",
    "U",
    "V",
    "W",
    "X",
    "Y",
    "Z"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      appBar: AppBar(
        title: Text("Hangman"),
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppColor.secondaryColor,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Stack(
              children: [
                figureImage(Game.tries >= 0, "assets/images/hang.png"),
                figureImage(Game.tries >= 1, "assets/images/head.png"),
                figureImage(Game.tries >= 2, "assets/images/body.png"),
                figureImage(Game.tries >= 3, "assets/images/ra.png"),
                figureImage(Game.tries >= 4, "assets/images/la.png"),
                figureImage(Game.tries >= 5, "assets/images/rl.png"),
                figureImage(Game.tries >= 6, "assets/images/ll.png"),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: word
                .split('')
                .map((e) => letter(e.toUpperCase(),
                    !Game.selectedChar.contains(e.toUpperCase())))
                .toList(),
          ),

          //Now let's build the Game keyboard
          SizedBox(
            width: double.infinity,
            height: 250.0,
            child: GridView.count(
              crossAxisCount: 7,
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 8.0,
              padding: EdgeInsets.all(8.0),
              children: alphabets.map((e) {
                return RawMaterialButton(
                  onPressed: Game.selectedChar.contains(e)
                      ? null // we first check that we didn't selected the button before
                      : () {
                          setState(() {
                            Game.selectedChar.add(e);
                            print(Game.selectedChar);
                            if (!word.split('').contains(e.toUpperCase())) {
                              Game.tries++;
                            }
                          });
                        },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: Text(
                    e,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  fillColor: Game.selectedChar.contains(e)
                      ? Colors.black87
                      : Colors.blue,
                );
              }).toList(),
            ),
          )
        ],
      )
    );
  }
}
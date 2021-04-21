import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(DiceGame());
}

class DiceGame extends StatefulWidget {
  @override
  _DiceGameState createState() => _DiceGameState();
}

class _DiceGameState extends State<DiceGame> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;
  int playerOneScore = 0;
  int playerTwoScore = 0;
  dynamic turnsLeft = 10;

  bool p1IsEnabled = true;
  bool p2IsEnabled = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.indigo[500],
        appBar: AppBar(
          title: Text('Dice Game'),
          // backgroundColor: Colors.teal[200],
          backgroundColor: Colors.indigoAccent,
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    child: Center(
                      child: Text(
                        '$playerOneScore',
                        style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontFamily: 'Orbitron',
                          letterSpacing: 2.0,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    child: Center(
                      child: Text(
                        '$playerTwoScore',
                        style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontFamily: 'Orbitron',
                          letterSpacing: 2.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(30.0),
                    child: Center(
                      child: Text(
                        'Player 1',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontFamily: 'Orbitron',
                          letterSpacing: 2.0,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(30.0),
                    child: Center(
                      child: Text(
                        'Player 2',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontFamily: 'Orbitron',
                          letterSpacing: 2.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: p1IsEnabled
                        ? () {
                            setState(() {
                              leftDiceNumber = Random().nextInt(6) + 1;
                              playerOneScore += leftDiceNumber;
                            });
                            p1IsEnabled = false;
                            p2IsEnabled = true;
                          }
                        : null,
                    child: Image.asset(
                      'images/dice$leftDiceNumber.png',
                      color: Colors.white,
                    ),
                  ),
                ),
                Expanded(
                  child: TextButton(
                    onPressed: p2IsEnabled
                        ? () {
                            setState(() {
                              turnsLeft -= 1;
                              if (turnsLeft > 0) {
                                rightDiceNumber = Random().nextInt(6) + 1;
                                playerTwoScore += rightDiceNumber;
                                print('I am executed');
                                p1IsEnabled = true;
                              } else {
                                rightDiceNumber = Random().nextInt(6) + 1;
                                playerTwoScore += rightDiceNumber;
                                print('I am executed');
                                p2IsEnabled = false;
                                p1IsEnabled = false;
                                if (playerOneScore > playerTwoScore) {
                                  turnsLeft = 'Player 1 won, tap to replay!';
                                } else if (playerTwoScore == playerOneScore) {
                                  turnsLeft = 'Drawn, tap to replay!';
                                } else {
                                  turnsLeft = 'Player 2 won, tap to restart!';
                                }
                              }
                            });
                            p2IsEnabled = false;
                          }
                        : null,
                    child: Image.asset(
                      'images/dice$rightDiceNumber.png',
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 6.0,
            ),
            Text(
              'Turns Left',
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
                fontFamily: 'Orbitron',
                letterSpacing: 2.0,
              ),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  playerOneScore = 0;
                  playerTwoScore = 0;
                  turnsLeft = 10;
                  p1IsEnabled = true;
                  p2IsEnabled = false;
                  leftDiceNumber = 1;
                  rightDiceNumber = 1;
                });
              },
              child: Text(
                '$turnsLeft',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontFamily: 'Orbitron',
                  letterSpacing: 2.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

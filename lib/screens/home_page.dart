import 'package:flutter/material.dart';
import '../widgets/circle.dart';
import '../widgets/rectangle.dart';
import '../utils.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Utils _utils = Utils();
  CirclePiece circlePiece = CirclePiece(color: Colors.red, size: 100);
  CirclePiece circleTarget = CirclePiece(color: Colors.grey, size: 100);
  bool circleAccepted = false;

  RectanglePiece rectanglePiece = RectanglePiece(color: Colors.red, size: 100);
  RectanglePiece rectangleTarget =
      RectanglePiece(color: Colors.grey, size: 100);
  bool rectangleAccepted = false;

  int countCompleted = 0;

  void reset() {
    setState(() {
      circleAccepted = false;
      rectangleAccepted = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    circleAccepted
                        ? Container()
                        : Draggable(
                            child: circlePiece,
                            feedback: circlePiece,
                            childWhenDragging: Container(),
                            data: 'A',
                          ),
                    rectangleAccepted
                        ? Container()
                        : Draggable(
                            child: rectanglePiece,
                            feedback: rectanglePiece,
                            childWhenDragging: Container(),
                            data: 'B',
                          ),
                  ],
                ),
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(8),
                decoration: mBoxDecoration(Colors.blue),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      DragTarget(
                        builder: (context, List<String> candidateData,
                            rejectedData) {
                          return circleAccepted ? circlePiece : circleTarget;
                        },
                        onWillAccept: (data) {
                          return data == 'A';
                        },
                        onAccept: (data) {
                          setState(() {
                            circleAccepted = true;
                            countCompleted++;
                            checkCompleted();
                          });
                        },
                      ),
                      DragTarget(
                        builder: (context, List<String> candidateData,
                            rejectedData) {
                          return rectangleAccepted
                              ? rectanglePiece
                              : rectangleTarget;
                        },
                        onWillAccept: (data) {
                          return data == 'B';
                        },
                        onAccept: (data) {
                          setState(() {
                            rectangleAccepted = true;
                            countCompleted++;
                            checkCompleted();
                          });
                        },
                      ),
                    ],
                  ),
                  padding: EdgeInsets.all(8),
                  margin: EdgeInsets.all(10),
                  decoration: mBoxDecoration(Colors.green)),
            ),
          ],
        ),
      ),
    );
  }

  BoxDecoration mBoxDecoration(Color color) {
    return BoxDecoration(color: color, borderRadius: BorderRadius.circular(8));
  }

  checkCompleted(){
    if (countCompleted == 2) {
      _utils.composeDialog(context, (){
        setState(() {
          countCompleted = 0;
          Navigator.pop(context);
        });
      });
      reset();
    }
  }
}

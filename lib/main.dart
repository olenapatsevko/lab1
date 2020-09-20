import 'package:flutter/material.dart';
import 'logic.dart';
void main() {
  runApp(InteractiveStory());
}
Logic appLogic = Logic();
class InteractiveStory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
    home: MainView(),);
  }
}

class MainView extends StatefulWidget {
  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 250,
              margin: EdgeInsets.symmetric(vertical: 20.0),
              child: Card(
                color: Colors.orange,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: FittedBox(
                      child: Text(
                        appLogic.getStory()[0],
                        style: TextStyle(fontSize: 20, color: Colors.black38),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            choiceButton(context, appLogic.getStory()[1], (){
              setState(() {
                appLogic.nextStory(1);
              });
            }, Colors.deepOrange, true),
            choiceButton(context, appLogic.getStory()[2], (){
              setState(() {
                appLogic.nextStory(2);
              });
            }, Colors.redAccent, appLogic.isVisible()),
            choiceButton(context, appLogic.getStory()[3], (){
              setState(() {
                appLogic.nextStory(3);
              });
            }, Colors.purple, appLogic.isVisible())
          ],
        ),
      ),
    );
  }
}
Widget choiceButton(context, title, onpress, color, visibility){
  return Container(
    width: MediaQuery.of(context).size.width,
    margin: EdgeInsets.only(bottom: 10.0),
    height: 70,
    child: Visibility(
      visible: visibility,
      child: RaisedButton(
          color: color,
          onPressed: onpress,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: FittedBox(
          child: Text(
            title,
            style: TextStyle(fontSize: 25, color:  Colors.pinkAccent),
          ),
        ),
      ),


  ),
  );

}

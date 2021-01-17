import 'package:flutter/material.dart';

class Buttom extends StatefulWidget {

  String text;
  Buttom(this.text);
  @override
  _ButtomState createState() => _ButtomState();
}

class _ButtomState extends State<Buttom> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: RaisedButton(
         padding: EdgeInsets.all(16),
         child: Text(widget.text,
         style: TextStyle(fontSize: 18),),
         textColor: Colors.white,
         color: Colors.blue,
         onPressed: (){

         },
       ),
    );
  }
}

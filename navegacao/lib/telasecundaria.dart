import 'package:flutter/material.dart';
import 'package:navegacao/main.dart';


class TelaSecundaria extends StatefulWidget {
  @override
  _TelaSecundariaState createState() => _TelaSecundariaState();
}

class _TelaSecundariaState extends State<TelaSecundaria> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tela Secundária'),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          children: <Widget>[

            RaisedButton(
              color: Colors.blue,
                child: Text('Voltar para tela inicial',
                style: TextStyle(color: Colors.white, fontSize: 18),),
                onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TelaPrincipal())
                  );
                })
          ],
        ),
      ),
    );
  }
}

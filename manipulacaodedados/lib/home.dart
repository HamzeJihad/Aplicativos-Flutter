import 'package:flutter/material.dart';
import 'package:manipulacaodedados/buttom.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String _textoSalvo = 'Nada Salvo!';
  TextEditingController _controller = TextEditingController();
  _salvar() async{

    String valorDigitado = _controller.text;

    final prefs = await SharedPreferences.getInstance();

   await prefs.setString('nome', valorDigitado);

   print('Salvar $valorDigitado');
  }

  _recuperar()async{

    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _textoSalvo =  prefs.getString('nome') ?? 'Sem valor';
    });
    print('Recuperado $_textoSalvo');
}

_remover()async{
  final prefs = await SharedPreferences.getInstance();
  prefs.remove('nome');
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manipulação de dados'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(32),

        child: Column(
          children: <Widget>[

            Text(_textoSalvo,
            style: TextStyle(
              fontSize: 20
            ),
            ),
            TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'Digite algo'
              ),
              controller: _controller,
            ),
            Row(
              children: <Widget>[

                RaisedButton(
                  padding: EdgeInsets.all(16),
                  child: Text('Salvar',
                    style: TextStyle(fontSize: 18),),
                  textColor: Colors.white,
                  color: Colors.blue,
                  onPressed: _salvar,
                ),
                RaisedButton(
                  padding: EdgeInsets.all(16),
                  child: Text('Recuperar',
                    style: TextStyle(fontSize: 18),),
                  textColor: Colors.white,
                  color: Colors.blue,
                  onPressed: _recuperar,
                ),

                RaisedButton(
                  padding: EdgeInsets.all(16),
                  child: Text('Remover',
                    style: TextStyle(fontSize: 18),),
                  textColor: Colors.white,
                  color: Colors.blue,
                  onPressed: _remover,
                ),
                /*
                RaisedButton(
                  child: Text('salvar'),
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: (){

                  },*/

              ],
            )
          ],
        ),
      ),
    );
  }
}

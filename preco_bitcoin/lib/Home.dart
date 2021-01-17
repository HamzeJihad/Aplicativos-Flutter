import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {


  String _preco = '0.0';

  _recuperarPrecoBitcoin()async{

    String url = 'https://blockchain.info/ticker';
    http.Response response;
    response = await http.get(url);
    Map<String,dynamic> retorno = json.decode(response.body);

    setState(() {
      _preco = retorno['BRL']['buy'].toString();
    });



  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Preço do Bitcoin'
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('images/bitcoin.png'),

            SizedBox(height: 20,),
            Text('R\$${_preco}', style: TextStyle(fontSize: 35, ),),
            SizedBox(height: 20,),
            RaisedButton(
                child: Text('Atualizar',style: TextStyle(fontSize: 20),),
                textColor: Colors.white,
                color: Colors.orange,
                onPressed: _recuperarPrecoBitcoin),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:pactoconsultoria/Tela_contato.dart';
import 'package:pactoconsultoria/Tela_empresa.dart';
import 'package:pactoconsultoria/Tela_servico.dart';
import 'package:pactoconsultoria/tela_Cliente.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  void _abrirEmpresa(){
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => TelaEmpresa()));
  }

  void _abrirCliente(){
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => TelaCliente()));
  }

  void _abrirContato(){
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => TelaContato()));
  }

  void _abrirServico(){
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => TelaServico()));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Pacto Soluções'),
        centerTitle: true,
      ),

      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('images/logo.png'),
            
            Padding(
                padding:  EdgeInsets.all(32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  GestureDetector(
                    onTap: _abrirEmpresa ,
                    child: Image.asset('images/menu_empresa.png'),
                  ),

                  GestureDetector(
                    onTap: _abrirServico ,
                    child: Image.asset('images/menu_servico.png'),
                  ),
                ],
              ),
            ),
            Padding(
              padding:  EdgeInsets.all(32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  GestureDetector(
                    onTap: _abrirCliente ,
                    child: Image.asset('images/menu_cliente.png'),
                  ),

                  GestureDetector(
                    onTap: _abrirContato ,
                    child: Image.asset('images/menu_contato.png'),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}

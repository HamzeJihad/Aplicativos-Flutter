import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';
import 'dart:io';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List _ToDoList = []; //VAI ARMAZENAR AS NOSSAS TAREFAS

   final _todocontroller = TextEditingController();

    void _addTodo(){

      setState(() {
        Map<String, dynamic> newTodo = Map();
        newTodo["title"] = _todocontroller.text;
        _todocontroller.text = "";
        newTodo["ok"] = false;
        _ToDoList.add(newTodo);
      });
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Tarefas"),
        centerTitle: true,
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Column(
        //corpo do app

        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(17.0, 1.0, 7.0, 1.0), //espaçamento
            child: Row(
              //A LINHA

              children: <Widget>[
               Expanded(  //VAI TENTAR EXPANDIR AO MAXIMO NOVA TAREFA E DEIXAR O BOTÃO PEQUENO
                   child:  TextField(
                     controller: _todocontroller,
                     decoration: InputDecoration(
                         labelText: "Nova Tarefa",
                         labelStyle: TextStyle(color: Colors.blueAccent)), //COR DA NOVA TAREFA
                   ),),

                //INFORMAÇÕES DO BOTÃO
                RaisedButton(
                  color: Colors.lightBlueAccent,
                  child: Text("ADD"),
                  textColor: Colors.white,
                  onPressed: _addTodo,
                )
              ],
            ),
          ),

          Expanded(
              child: ListView.builder(

                padding: EdgeInsets.only(top: 10.0) ,  //USEI PADDING PARA NAO FICAR COLADO

                  itemCount: _ToDoList.length,  //QUANTIDADE DE ITENS DA LISTA

                  itemBuilder: (context, index){

                  return CheckboxListTile(   //É UM LISTTILE, MAS COM UM BOTAO DO LADO
                    title: Text(_ToDoList[index]["title"]),
                    value: _ToDoList[index]["ok"] ,
                    secondary: CircleAvatar(
                      child: Icon(_ToDoList[index]["ok"] ?
                      Icons.check : Icons.error ),),//
                  );
                  }),
          )
        ],
      ),
    );
  }

  Future<File> _getFile() async {
    final directory = await getApplicationDocumentsDirectory(); //VAI PEGAR ...
    // O DIRETORIO ONDE EU POSSO ARMAZENAR OS DOCUMENTOS OD MEU APLICATIVO

    return File(
        "${directory.path}/data.json"); //PEGA O CAMINHO E JUNTO COM DATA E ABRO ATRAVES DO FILE
  }

  Future<File> _saveData() async {
    String data = json.encode(
        _ToDoList); //TRANSFORMANDO A MINHA LISTA EM JSON E ARMAZENANDO EM DATA

    final file = await _getFile(); //ABRINDO O ARQUIVO

    return file.writeAsString(
        data); // ABRIMOS ELE LA ENCIMA E AGORA VAMOS ESCREVER NELE
  }

  Future<String> _redData() async {
    try {
      final file = await _getFile(); //VOU TENTAR ABRIR
      return file.readAsString(); //CASO CONSIGA EU LEIO

    }

    //SE DER ERRADO RETORNO NULL
    catch (e) {
      return null;
    }
  }
}

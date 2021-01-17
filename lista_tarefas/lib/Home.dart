import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {


  List _listaTarefas = [];

  //RECUPERAR O ULTIMO ITÉM PARA QUANDO CLICAR EM DESFAZER
  Map<String,dynamic> _ultimaTarefaRemovida = Map();
  TextEditingController _controllerTarefa = TextEditingController();


  //RECUPERAR O DIRETORIO
  Future<File>_getFile()async{
    final diretorio =  await getApplicationDocumentsDirectory();
    return  File('${diretorio.path}/dados.json');
  }


  _salvarTarefa(){

    String textoDigitado = _controllerTarefa.text;

    //CRIAR DADOS
    Map<String,dynamic> tarefa = Map();
    tarefa['titulo'] = textoDigitado;
    tarefa['realizada'] = false;


    setState(() {
      _listaTarefas.add(tarefa);

    });
    _salvarArquivo();
    _controllerTarefa.text = "";


  }

  _salvarArquivo()async{


    //RECUPERAR O DIRETORIO
    var arquivo = await  _getFile();



    //TRANSFORMANDO A LISTA EM JSON E SALVANDO ELA
     String dados = json.encode(_listaTarefas);
     arquivo.writeAsString(dados);

  }


  _lerArquivo()async{

    try{

      final arquivo = await _getFile();
      return arquivo.readAsString();
    }
    catch(e){
      return null;
    }
  }

  @override
  void initState() {
    super.initState();

    _lerArquivo().then((dados){
      setState(() {
        _listaTarefas = json.decode(dados);
      });
    });
  }

  Widget criarItemLista(context,index){
    final item = _listaTarefas[index]['titulo'] ;
    return Dismissible(
        key: Key(DateTime.now().millisecondsSinceEpoch.toString()),
        direction: DismissDirection.endToStart,
        onDismissed: (direction){



          //RECUPERAR O ÚLTIMO ITEM EXCLUIDO
          _ultimaTarefaRemovida = _listaTarefas[index];
          //REMOVER O ITEM DA LISTA
           _listaTarefas.removeAt(index);

        _salvarArquivo();


           final snackBar = SnackBar(
             //backgroundColor: Colors.green,
             duration: Duration(seconds: 2),
             content: Text('Tarefa Removida!'),
             action: SnackBarAction(
               label: 'Desfazer',
               onPressed: (){

               setState(() {
                 _listaTarefas.insert(index, _ultimaTarefaRemovida);
               });
                 _salvarArquivo();
               },
             ),
           );

           Scaffold.of(context).showSnackBar(snackBar);
        },



        background: Container(
          color: Colors.red,
          padding: EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end  ,
            children: <Widget>[
              Icon(Icons.delete,
                color: Colors.white,)
            ],
          ),
        ),
        child: CheckboxListTile(
            title:Text(_listaTarefas[index]['titulo']) ,
            value: _listaTarefas[index]['realizada'],
            onChanged: (valorAlterado){

              setState(() {
                _listaTarefas[index]['realizada'] = valorAlterado;
              });

              _salvarArquivo();
            }));
  }

  @override
  Widget build(BuildContext context) {
  //_salvarArquivo();
    print(_listaTarefas.toString());
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de tarefas'),
        backgroundColor: Colors.purple,
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
                itemCount: _listaTarefas.length,
                itemBuilder: criarItemLista,

            ),
          )
        ],
      ),

     //CENTRALIZAÇÃO DE FLOATACTIONBUTTOM
     //floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
     floatingActionButton: FloatingActionButton(
       backgroundColor: Colors.purple,
       foregroundColor: Colors.white,
       elevation: 2,
       child: Icon(Icons.add),


       onPressed: (){
          showDialog(
              context: context,
            builder: (context){
              return AlertDialog(
                title: Text('Adicionar Tarefas'),
                content: TextField(
                  controller: _controllerTarefa,
                  decoration: InputDecoration(
                    labelText: 'Digite sua tarefa',
                  ),
                  onChanged: (text){

                  },
                ),
                actions: <Widget>[
                  FlatButton(
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      child: Text('Cancelar')),
                  FlatButton(
                      onPressed: (){

                        _salvarTarefa();
                        Navigator.pop(context);
                      },
                      child: Text('Salvar'))
                ],
              );
            }
          );
       },
     ),


     /*bottomNavigationBar: BottomAppBar(
       shape: CircularNotchedRectangle(), //ANIMAÇÃO AO REDOR DO BOTÃO
       child: Row(
         children: <Widget>[
           IconButton(
               icon: Icon(Icons.menu),
               onPressed: (){

           }),
         ],
       ),
     )*/
    );
  }
}

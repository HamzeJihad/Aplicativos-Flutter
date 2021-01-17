import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List _itens = [];

  void _carregarItens(){
     _itens = [];
    for(int i = 0; i <= 10; i++){
      Map<String,dynamic> item = Map();
      item["titulo"] = "Título ${i} teste aqui";
      item["descricao"] = "Descrição  ${i} teste dois";
      _itens.add(item);
    }
  }
  @override
  Widget build(BuildContext context) {
    _carregarItens();
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: _itens.length,
          itemBuilder: (context, indice){

            //Map<String,dynamic> item = _itens[indice];

           // Map<String, dynamic> item = _itens[indice];
            return ListTile(
              //onTap: (){},
              onLongPress: (){
                showDialog(
                  context: context ,
                  builder: (context){
                    return AlertDialog(
                      title: Text(_itens[indice]['titulo'] ),
                      titlePadding: EdgeInsets.all(20),
                      titleTextStyle: TextStyle(color: Colors.blue),
                      content: Text(_itens[indice]['descricao']),

                      actions: <Widget>[
                        FlatButton(
                            onPressed: (){
                              Navigator.pop(context);
                            },
                            child: Text('Sim')),
                        FlatButton(
                            onPressed: (){
                              Navigator.pop(context);
                            },
                            child: Text('Não'))
                      ],
                    );
                  }
                );
              },
              title: Text(_itens[indice]['titulo'] ),
              subtitle: Text(_itens[indice]['descricao']),
            );
            },

        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';



class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List _listaTarefas = ['Jamilton', 'Maria', 'João', 'Carla'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Widgets'),
      ),
      body: Column(
        children: <Widget>[
            Expanded(
                child: ListView.builder(
                    itemCount:_listaTarefas.length,
                    itemBuilder: (context,index){

                      final item = _listaTarefas[index];
                      return Dismissible(
                        background: Container(
                          color: Colors.green,
                          padding: EdgeInsets.all(16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                             children: <Widget>[
                               Icon(Icons.edit,
                               color: Colors.white,),
                             ],
                          ),
                        ),

                        secondaryBackground: Container(
                          color: Colors.red,
                          padding: EdgeInsets.all(16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Icon(Icons.delete,
                              color: Colors.white,)
                            ],
                          ),
                        ),
                        direction: DismissDirection.horizontal,
                          onDismissed: (direction){

                            if(direction == DismissDirection.endToStart) {
                                  setState(() {
                                    _listaTarefas.removeAt(index);
                                  });
                            }
                            else{
                              setState(() {
                                _listaTarefas.removeAt(index);
                              });
                            }
                          },
                          key: Key(),
                          child: ListTile(
                            title: Text(item),
                          ));
                    })),
        ],
      ),
    );
  }
}

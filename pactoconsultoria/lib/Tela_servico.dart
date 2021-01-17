import 'package:flutter/material.dart';


class TelaServico extends StatefulWidget {
  @override
  _TelaServicoState createState() => _TelaServicoState();
}

class _TelaServicoState extends State<TelaServico> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Serviços'),
        backgroundColor: Colors.green ,
        centerTitle: true,
      ),
      body: Container(

        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Image.asset('images/detalhe_servico.png'),
                Padding(
                    padding: EdgeInsets.only(left: 10)),

                Text('Nossos Serviços',
                style: TextStyle(fontSize: 20,
                color: Colors.black.withAlpha(225)),)
              ],
            ),
            SizedBox(height: 16,),
            Text(
              'Consultoria'
            ),
            SizedBox(height: 16,),

            Text('Precos \nAcompanhamento de Projetos')
          ],
        ),
      ),
    );
  }
}

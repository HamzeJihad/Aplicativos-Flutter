import 'package:flutter/material.dart';

class TelaEmpresa extends StatefulWidget {
  @override
  _TelaEmpresaState createState() => _TelaEmpresaState();
}

class _TelaEmpresaState extends State<TelaEmpresa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Empresa'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(32),
          child: Column(
            children: <Widget>[
            Row(
              children: <Widget>[
                Image.asset('images/detalhe_empresa.png'),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                ),
                Text('Sobre a empresa',
                  style: TextStyle(
                    fontSize: 20, color: Colors.red
                  ),)
              ],
            ),
              Padding(
                padding: EdgeInsets.all(16),
              ),
              Text('Esqueça o acúmulo de planilhas, desorganização e '
                  'falta de tempo. Reunimos tudo o que você precisa em um '
                  'único lugar: Controle de alunos, Controle de treinos, Financeiro,'
                  ' CRM e Aplicativo. Todos os dados da sua academia integrados de maneira prática'
                  ', rápida e simples.')


            ],
          ),
        ),
      ),
    );
  }
}

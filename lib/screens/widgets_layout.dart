import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/titulo_secao.dart';

class WidgetsLayout extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Widgets de Layout')),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          TituloSecao(titulo: 'Padding'),
          Container(
            color: Colors.red,
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Text('Texto com padding interno de 20 px'),
            ),
          ),

          Divider(),
          TituloSecao(titulo: 'Center'),
          Container(
            height: 80,
            color: Colors.red,
            child: Align(
              alignment: Alignment.center,
              child: Text('Alinhamento de Texto'),
            ),
          ),

          Divider(),
          TituloSecao(titulo: 'Center'),
          Container(
            height: 80,
            color: Colors.red,
            child: Center(child: Text('Alinhamento de texto')),
          ),

          Divider(),
          TituloSecao(titulo: 'SizebBox'),
          Column(
            children: [
              Text('Texto acima'),
              SizedBox(height: 20),
              Text('Texto abaixo'),
            ],
          ),

          Divider(),
          TituloSecao(titulo: 'Expanded (em Column)'),
          Container(
            height: 200,
            color: Colors.amberAccent,
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.red,
                    child: Center(child: Text('Expanded')),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                    color: Colors.lightBlueAccent,
                    child: Center(child: Text('Flexible')),
                  ),
                ),
              ],
            ),
          ),

          TituloSecao(titulo: 'Expanded (em Row)'),
          Row(
            children: [
              Expanded(
                child: Container(
                  color: Colors.red,
                  child: Center(child: Text('Expanded')),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.lightBlueAccent,
                  child: Center(child: Text('Flexible')),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

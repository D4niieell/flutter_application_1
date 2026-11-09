import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/widgets_conteudo.dart';
import 'package:flutter_application_1/screens/widgets_layout.dart';
import 'package:flutter_application_1/models/clima.dart';
import 'package:flutter_application_1/screens/verClima.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: ListContents(),
    );
  }
}

class CatalogoItem {
  final String titulo;
  final IconData icone;
  final String descricao;
  final Widget destino;

  CatalogoItem({
    required this.titulo,
    required this.icone,
    required this.descricao,
    required this.destino,
  });
}

class ListContents extends StatelessWidget {
  ListContents({super.key});

  final List<CatalogoItem> secoes = [
    CatalogoItem(
      titulo: 'Widgets de conteudo',
      icone: Icons.text_fields,
      descricao: 'Exemplos de Widgets de Conteudo feitos na aula 1',
      destino: WidgetsConteudo(),
    ),

    CatalogoItem(
      titulo: 'Widgets de Layout',
      icone: Icons.view_agenda,
      descricao: 'Exemplos de Widgets de Layout feitos na aula 2',
      destino: WidgetsLayout(),
    ),

    CatalogoItem(
      titulo: 'Clima de São Paulo',
      icone: Icons.cloud,
      descricao: 'Clique para ver o clima de São Paulo',
      destino: VerClima(
        clima: Clima(
          cidade: 'São Paulo',
          temperaturaAtual: 31,
          temperaturaMinima: 24,
          temperaturaMaxima: 33,
          umidade: 65,
          chanceChuva: 30,
        ),
      ),
    ),

    CatalogoItem(
      titulo: 'Clima do Rio de Janeiro',
      icone: Icons.wb_sunny,
      descricao: 'Clique para ver o clima do Rio de Janeiro',
      destino: VerClima(
        clima: Clima(
          cidade: 'Rio de Janeiro',
          temperaturaAtual: 33,
          temperaturaMinima: 25,
          temperaturaMaxima: 35,
          umidade: 78,
          chanceChuva: 40,
        ),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: ListView.builder(
        itemCount: secoes.length,
        itemBuilder: (context, index) {
          final item = secoes[index];
          return ListTile(
            leading: Icon(item.icone),
            title: Text(item.titulo),
            subtitle: Text(item.descricao),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => item.destino),
            ),
          );
        },
      ),
    );
  }
}

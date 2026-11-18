// formulario.dart

import 'package:flutter/material.dart';

class Formulario extends StatefulWidget {
  const Formulario({super.key});

  @override
  State<Formulario> createState() => _FormularioState();
}

class _FormularioState extends State<Formulario> {
  final _formKey = GlobalKey<FormState>();

  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();
  final _confirmarSenhaController = TextEditingController();

  bool entrar = true; // true = login, false = cadastro

  @override
  void dispose() {
    _nomeController.dispose();
    _emailController.dispose();
    _senhaController.dispose();
    _confirmarSenhaController.dispose();
    super.dispose();
  }

  void _alterarModo() {
    setState(() {
      entrar = !entrar;
      _nomeController.clear();
      _senhaController.clear();
      _confirmarSenhaController.clear();
      _formKey.currentState?.reset(); // limpa erros ao trocar de modo
    });
  }

  void _enviar() {
    if (!_formKey.currentState!.validate()) return;

    if (entrar) {
      // TODO: logica de login
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login com ${_emailController.text}')),
      );
    } else {
      // TODO: Lógica de cadastro (API, Firebase, etc.)
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Conta criada para ${_nomeController.text}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Formulários')),
      body: Form(
        key: _formKey,
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Visibility(
                  visible: !entrar,
                  child: TextFormField(
                    decoration: InputDecoration(label: Text('Nome')),
                  ),
                ),
                // Campo exibido apenas no cadastro
                if (!entrar)
                  TextFormField(
                    decoration: InputDecoration(label: Text('E-mail')),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Informe o seu e-mail';
                      }
                      if (!value.contains('@') || !value.contains('.')) {
                        return 'E-mail inválido';
                      }
                      return null;
                    },
                  ),

                TextFormField(
                  controller: _senhaController,
                  obscureText: true,
                  decoration: const InputDecoration(label: Text('Senha')),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Informe sua senha';
                    }
                    if (!entrar && value.length < 6) {
                      return 'A senha deve ter no mínimo 6 caracteres';
                    }
                    return null;
                  },
                ),

                Visibility(
                  visible: entrar,
                  child: TextFormField(
                    decoration: InputDecoration(
                      label: Text('Confirme a senha'),
                    ),
                    obscureText: true,
                  ),
                ),
                SizedBox(height: 32),

                ElevatedButton(
                  onPressed: _enviar,
                  child: Text(entrar ? 'Entrar' : 'Cadastrar'),
                ),
                const Divider(),
                TextButton(
                  onPressed: _alterarModo,
                  child: Text(
                    (entrar)
                        ? 'AInda não tem uma conta? cadastre-se'
                        : 'Já tem uma conta? Entre',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

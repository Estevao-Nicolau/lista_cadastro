import 'package:flutter/material.dart';
import 'package:lista_contatos/models/user_model.dart';
import 'package:lista_contatos/page/listscard/list_card.dart';
import 'package:lista_contatos/page/registerPage/register_page.dart';
import 'package:lista_contatos/repository_dio/repository_dio.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final DioRepository _repository = DioRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Contatos'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(''),
            ),
            ListTile(
              title: const Text('Cadastro'),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const RegisterPage(),
                  ),
                );
              },
            ),
            // Outros itens do menu
          ],
        ),
      ),
      body: FutureBuilder<List<Results>>(
        future: _repository.getUsers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Erro: ${snapshot.error}'),
            );
          } else {
            final users = snapshot.data;
            return ListCard(results: users);
          }
        },
      ),
    );
  }
}

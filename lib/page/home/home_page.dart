import 'package:flutter/material.dart';
import 'package:lista_contatos/models/user_model.dart';
import 'package:lista_contatos/page/listscard/list_card.dart';
import 'package:lista_contatos/page/registerPage/register_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
              child: Text('Menu'),
            ),
            ListTile(
              title: const Text('Cadastro'), // Altere o texto para "Cadastro"
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
      body: Column(
        children: [
          Expanded(
            child: ListCard(
              users: [
                UserModel(
                  name: 'Ana',
                  age: '30',
                  cpf: '12345678901',
                  email: 'ana@example.com',
                  phone: '123-456-7890',
                ),
                UserModel(
                  name: 'Aline',
                  age: '25',
                  cpf: '98765432109',
                  email: 'aline@example.com',
                  phone: '987-654-3210',
                ),
                UserModel(
                  name: 'Amamo',
                  age: '25',
                  cpf: '98765432109',
                  email: 'aline@example.com',
                  phone: '987-654-3210',
                ),
                UserModel(
                  name: 'Bia',
                  age: '25',
                  cpf: '98765432109',
                  email: 'aline@example.com',
                  phone: '987-654-3210',
                ),
                UserModel(
                  name: 'Baiha',
                  age: '25',
                  cpf: '98765432109',
                  email: 'aline@example.com',
                  phone: '987-654-3210',
                ),
                UserModel(
                  name: 'Caio',
                  age: '25',
                  cpf: '98765432109',
                  email: 'aline@example.com',
                  phone: '987-654-3210',
                ),
                UserModel(
                  name: 'Caiq',
                  age: '25',
                  cpf: '98765432109',
                  email: 'aline@example.com',
                  phone: '987-654-3210',
                ),
                UserModel(
                  name: 'Daniel',
                  age: '25',
                  cpf: '98765432109',
                  email: 'aline@example.com',
                  phone: '987-654-3210',
                ),
                UserModel(
                  name: 'Deved',
                  age: '25',
                  cpf: '98765432109',
                  email: 'aline@example.com',
                  phone: '987-654-3210',
                ),
                UserModel(
                  name: 'Estevao',
                  age: '25',
                  cpf: '98765432109',
                  email: 'aline@example.com',
                  phone: '987-654-3210',
                ),
                UserModel(
                  name: 'Erick',
                  age: '25',
                  cpf: '98765432109',
                  email: 'aline@example.com',
                  phone: '987-654-3210',
                ),
                // Adicione mais usuários aqui
              ],
            ),
          ),
        ],
      ),
    );
  }
}

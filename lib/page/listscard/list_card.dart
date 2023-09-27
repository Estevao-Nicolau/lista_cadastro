import 'package:flutter/material.dart';
import 'package:lista_contatos/models/user_model.dart';
import 'package:lista_contatos/page/home/widgets/card.dart';

class ListCard extends StatelessWidget {
  final List<UserModel> users;

  const ListCard({super.key, required this.users});

  @override
  Widget build(BuildContext context) {
    // Organize os usuários em um mapa com base na letra inicial do nome
    final Map<String, List<UserModel>> usersByInitial = {};

    for (var user in users) {
      final initial = user.name[0].toUpperCase();
      if (!usersByInitial.containsKey(initial)) {
        usersByInitial[initial] = [];
      }
      usersByInitial[initial]!.add(user);
    }

    // Crie a lista de cartões de usuário
    return ListView.builder(
      itemCount: usersByInitial.length,
      itemBuilder: (context, index) {
        final initial = usersByInitial.keys.toList()[index];
        final userList = usersByInitial[initial]!;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                initial,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: userList
                    .map((user) => UserCard(
                          nameController: TextEditingController(text: user.name),
                          ageController: TextEditingController(text: user.age),
                          cpfController: TextEditingController(text: user.cpf),
                          emailController: TextEditingController(text: user.email),
                          phoneController: TextEditingController(text: user.phone),
                        ))
                    .toList(),
              ),
            ),
          ],
        );
      },
    );
  }
}
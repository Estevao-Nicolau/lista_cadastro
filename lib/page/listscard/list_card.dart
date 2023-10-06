import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lista_contatos/models/user_model.dart';
import 'package:lista_contatos/page/home/widgets/card.dart';

class ListCard extends StatelessWidget {
  final List<Results>? results;

  const ListCard({super.key, required this.results});

  @override
  Widget build(BuildContext context) {
   // Classifique a lista de resultados em ordem alfabética com base nos nomes
    results?.sort((a, b) => a.name!.compareTo(b.name!));

    // Organize os usuários em um mapa com base na letra inicial do nome
    final Map<String, List<Results>?> resultsByInitial = {};

    for (var user in results!) {
      final initial = user.name![0].toUpperCase();
      if (!resultsByInitial.containsKey(initial)) {
        resultsByInitial[initial] = [];
      }
      resultsByInitial[initial]!.add(user);
    }

    // Crie a lista de cartões de usuário
    return ListView.builder(
      itemCount: resultsByInitial.length,
      itemBuilder: (context, index) {
        final initial = resultsByInitial.keys.toList()[index];
        final userList = resultsByInitial[initial]!;

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
                          profilephoto: File(user.profilephoto!), // Passa o arquivo diretamente
                          phoneController: TextEditingController(text: user.phone.toString()),
                          nameController: TextEditingController(text: user.name),
                          ageController: TextEditingController(text: user.age.toString()),
                          cpfController: TextEditingController(text: user.cpf.toString()),
                          emailController: TextEditingController(text: user.emial),
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

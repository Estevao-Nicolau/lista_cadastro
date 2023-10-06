import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  final TextEditingController profilephotoController;
  final TextEditingController nameController;
  final TextEditingController ageController;
  final TextEditingController cpfController;
  final TextEditingController emailController;
  final TextEditingController phoneController;

  const UserCard({
    super.key,
    required this.profilephotoController,
    required this.nameController,
    required this.ageController,
    required this.cpfController,
    required this.emailController,
    required this.phoneController,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      margin: const EdgeInsets.all(16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  radius: 30.0,
                  backgroundImage: AssetImage('caminho_da_imagem.png'),
                ),
                const SizedBox(width: 16.0),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nome:',
                      style: TextStyle(fontSize: 16.0),
                    ),
                    SizedBox(height: 4.0),
                    Text(
                      'Idade:',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
                const SizedBox(width: 8.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      nameController.text,
                      style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      ageController.text,
                      style: const TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            const Text('CPF:', style: TextStyle(fontSize: 16.0)),
            Text(cpfController.text, style: const TextStyle(fontSize: 16.0)),
            const SizedBox(height: 8.0),
            const Text('Email:', style: TextStyle(fontSize: 16.0)),
            Text(emailController.text, style: const TextStyle(fontSize: 16.0)),
            const SizedBox(height: 8.0),
            const Text('Celular:', style: TextStyle(fontSize: 16.0)),
            Text(phoneController.text, style: const TextStyle(fontSize: 16.0)),
          ],
        ),
      ),
    );
  }
}

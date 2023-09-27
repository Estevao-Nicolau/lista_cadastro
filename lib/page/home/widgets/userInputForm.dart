import 'package:flutter/material.dart';

class UserInputForm extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController ageController;
  final TextEditingController cpfController;
  final TextEditingController emailController;
  final TextEditingController phoneController;

  const UserInputForm({super.key, 
    required this.nameController,
    required this.ageController,
    required this.cpfController,
    required this.emailController,
    required this.phoneController,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Nome:'),
          TextField(
            controller: nameController,
            decoration: const InputDecoration(hintText: 'Digite o nome'),
          ),
          const SizedBox(height: 16.0),
          const Text('Idade:'),
          TextField(
            controller: ageController,
            decoration: const InputDecoration(hintText: 'Digite a idade'),
          ),
          const SizedBox(height: 16.0),
          const Text('CPF:'),
          TextField(
            controller: cpfController,
            decoration: const InputDecoration(hintText: 'Digite o CPF'),
          ),
          const SizedBox(height: 16.0),
          const Text('Email:'),
          TextField(
            controller: emailController,
            decoration: const InputDecoration(hintText: 'Digite o email'),
          ),
          const SizedBox(height: 16.0),
          const Text('Celular:'),
          TextField(
            controller: phoneController,
            decoration: const InputDecoration(hintText: 'Digite o celular'),
          ),
        ],
      ),
    );
  }
}
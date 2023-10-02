import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lista_contatos/page/home/widgets/card.dart';
import 'package:lista_contatos/page/home/widgets/userInputForm.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController cpfController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  bool isDataConfirmed =
      false; // Novo estado para controlar a confirmação dos dados
  File? _image; // Estado para armazenar a imagem selecionada

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro'),
        automaticallyImplyLeading: false, // Remova o botão de volta
      ),
      body: Center(
        child: isDataConfirmed
            ? _buildConfirmationContainer()
            : _buildInputFormContainer(),
      ),
    );
  }

  Widget _buildInputFormContainer() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          GestureDetector(
            onTap: _pickImage,
            child: CircleAvatar(
              radius: 50, // Tamanho do CircleAvatar
              backgroundImage: _image != null ? FileImage(_image!) : null,
              child: _image == null
                  ? const Icon(
                      Icons.camera_alt,
                      size: 40,
                      color: Colors.white,
                    )
                  : null,
            ),
          ),
          UserInputForm(
            nameController: nameController,
            ageController: ageController,
            cpfController: cpfController,
            emailController: emailController,
            phoneController: phoneController,
          ),
          const SizedBox(height: 16.0),
          Row(
            mainAxisAlignment:
                MainAxisAlignment.center, // Alinhe horizontalmente os botões
            children: [
              ElevatedButton(
                onPressed: () {
                  // Após salvar os dados, defina isDataConfirmed como true
                  setState(() {
                    isDataConfirmed = true;
                  });
                },
                child: const Text('Salvar Cadastro'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildConfirmationContainer() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          UserCard(
            nameController: nameController,
            ageController: ageController,
            cpfController: cpfController,
            emailController: emailController,
            phoneController: phoneController,
          ),
          const SizedBox(height: 16.0),
          Row(
            mainAxisAlignment:
                MainAxisAlignment.center, // Alinhe horizontalmente os botões
            children: [
              ElevatedButton(
                onPressed: () {},
                child: const Text('Confirmar'),
              ),
              const SizedBox(width: 16.0),
              ElevatedButton(
                onPressed: () {
                  setState(
                    () {
                      isDataConfirmed = false;
                    },
                  );
                },
                child: const Text('Voltar'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }
}

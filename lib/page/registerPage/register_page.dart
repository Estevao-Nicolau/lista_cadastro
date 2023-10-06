import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lista_contatos/models/user_model.dart';
import 'package:lista_contatos/page/home/home_page.dart';
import 'package:lista_contatos/page/home/widgets/card.dart';
import 'package:lista_contatos/page/home/widgets/userInputForm.dart';
import 'package:lista_contatos/repository_dio/repository_dio.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController cpfController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  bool isDataConfirmed = false;
  File? _image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro'),
        automaticallyImplyLeading: false,
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
              radius: 50,
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
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
            profilephoto: _image,
            nameController: nameController,
            ageController: ageController,
            cpfController: cpfController,
            emailController: emailController,
            phoneController: phoneController,
          ),
          const SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async {
                  final results = Results(
                    name: nameController.text,
                    age: int.tryParse(ageController.text) ?? 0,
                    emial: emailController.text,
                    cpf: int.tryParse(cpfController.text) ?? 0,
                    profilephoto: _image != null ? _image!.path : "",
                    phone: int.tryParse(phoneController.text) ?? 0,
                  );

                  try {
                    await DioRepository().createUser(results);
                    print('User data saved successfully');
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomePage(),
                        ));
                  } catch (error) {
                    print('Error saving user data: $error');
                  }
                },
                child: const Text('Confirmar'),
              ),
              const SizedBox(width: 16.0),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    isDataConfirmed = false;
                  });
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
    try {
      final imagePicker = ImagePicker();
      final pickedFile =
          await imagePicker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        setState(() {
          _image = File(pickedFile.path);
        });
      }
    } catch (e) {
      print('Erro ao selecionar imagem: $e');
    }
  }
}

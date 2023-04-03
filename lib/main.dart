import 'dart:io';

import 'package:camera_demo/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Widget raíz do aplicativo
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Camera Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Camera Demo'),
    );
  }
}

/*Classe que define o conjunto de widgets presentes na HomePage do app e algumas funções.
É do tipo Stateful, visto que possui elementos que possuem diferentes estados (botões). */
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  File? image;

//Função para obter uma imagem de uma fonte (da câmera ou galeria)
  Future pickImage(source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      // ignore: avoid_print
      print('Erro: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("App Demo")),
        ),
        body: Center(
          child: SafeArea(
            child: Column(
              children: [
                ImageView(file: image), //Instância do Widget da classe classe Imageview.
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    //Botões
                    ElevatedButton.icon(
                        icon: const Icon(Icons.collections),
                        label: const Text('Galeria'),
                        onPressed: () {
                          pickImage(ImageSource.gallery);  //Imagem vem da galeria
                        }),
                    ElevatedButton.icon(
                        icon: const Icon(Icons.camera_alt),
                        label: const Text('Câmera'),
                        onPressed: () {
                          pickImage(ImageSource.camera); //Imagem vem da câmera
                        }),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}

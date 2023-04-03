import 'dart:io';
import 'package:flutter/material.dart';

/*Classe que define o widget ImageView, responsável por exibir uma imagem na tela */
class ImageView extends StatelessWidget {
  final File? file;
  const ImageView({super.key, this.file});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 30),
      width: 300,
      height: 400,
      color: Colors.blueGrey,
      child: (file == null) //Verifica se o arquivo de imagem é nulo
          ? _buildEmptyView() //Se for nulo, exibe o texto 'Escolha uma foto' no container
          : Image.file(file!, fit: BoxFit.cover), //Se há uma imagem, ela é exibida na tela.
    );
  }

  Widget _buildEmptyView() {
    return const Center(
        child: Text(
      'Escolha uma foto',
      ),
    );
  }
}

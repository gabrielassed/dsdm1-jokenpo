import 'dart:math';

import 'package:flutter/material.dart';

class Jogo extends StatefulWidget {
  const Jogo({super.key});

  @override
  State<Jogo> createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  var _imagemApp = AssetImage("images/padrao.png");
  var _resultadoFinal = "Boa sorte!!!";

  void _opcaoSelecionada(String escolhaUsuario) {
    var opcoes = ["pedra", "papel", "tesoura"];
    var numero = Random().nextInt(3);
    var escolhaApp = opcoes[numero];

    switch (escolhaApp) {
      case "pedra":
        setState(() {
          _imagemApp = const AssetImage("images/pedra.png");
        });
        break;
      case "papel":
        setState(() {
          _imagemApp = const AssetImage("images/papel.png");
        });
        break;
      case "tesoura":
        setState(() {
          _imagemApp = const AssetImage("images/tesoura.png");
        });
        break;
    }

    // Lógica para ganhador e perdedor
    if ((escolhaApp == "pedra" && escolhaUsuario == "tesoura") ||
        (escolhaApp == "papel" && escolhaUsuario == "pedra") ||
        (escolhaApp == "tesoura" && escolhaUsuario == "papel")) {
      setState(() {
        _resultadoFinal = "Puxa!!! Você perdeu :(";
      });
    } else if ((escolhaUsuario == "pedra" && escolhaApp == "tesoura") ||
        (escolhaUsuario == "papel" && escolhaApp == "pedra") ||
        (escolhaUsuario == "tesoura" && escolhaApp == "papel")) {
      setState(() {
        _resultadoFinal = "Parabéns!!! Você ganhou :)";
      });
    } else {
      setState(() {
        _resultadoFinal = "Empate!!! Tente novamente :/";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: const Text('JokenPO'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              "Escolha do App",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Image(image: _imagemApp),
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              "Escolha uma opção abaixo:",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                onTap: () => _opcaoSelecionada("pedra"),
                child: const Image(
                  image: AssetImage('images/pedra.png'),
                  height: 100,
                ),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("papel"),
                child: const Image(
                  image: AssetImage('images/papel.png'),
                  height: 100,
                ),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("tesoura"),
                child: const Image(
                  image: AssetImage('images/tesoura.png'),
                  height: 100,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              _resultadoFinal,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}

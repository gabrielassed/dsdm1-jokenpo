import 'dart:math';

import 'package:flutter/material.dart';

class Jogo extends StatefulWidget {
  const Jogo({super.key});

  @override
  State<Jogo> createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  var _imagemApp = const AssetImage("images/padrao.png");
  var _resultadoFinal = "Boa sorte!!!";
  Color _corResultado = Colors.black;

  int _pontosUsuario = 0;
  int _pontosApp = 0;

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

    if ((escolhaApp == "pedra" && escolhaUsuario == "tesoura") ||
        (escolhaApp == "papel" && escolhaUsuario == "pedra") ||
        (escolhaApp == "tesoura" && escolhaUsuario == "papel")) {
      setState(() {
        _resultadoFinal = "Puxa!!! Você perdeu :(";
        _corResultado = Colors.red;
        _pontosApp++;
      });
    } else if ((escolhaUsuario == "pedra" && escolhaApp == "tesoura") ||
        (escolhaUsuario == "papel" && escolhaApp == "pedra") ||
        (escolhaUsuario == "tesoura" && escolhaApp == "papel")) {
      setState(() {
        _resultadoFinal = "Parabéns!!! Você ganhou :)";
        _corResultado = Colors.blue;
        _pontosUsuario++;
      });
    } else {
      setState(() {
        _resultadoFinal = "Empate!!! Tente novamente :/";
        _corResultado = Colors.orange;
      });
    }
  }

  void _resetGame() {
    setState(() {
      _pontosUsuario = 0;
      _pontosApp = 0;
      _resultadoFinal = "Boa sorte!!!";
      _imagemApp = const AssetImage("images/padrao.png");
      _corResultado = Colors.black;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('JokenPO'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        actions: [
          IconButton(icon: const Icon(Icons.refresh), onPressed: _resetGame),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              "Escolha do App",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Image(image: _imagemApp),
          Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 16),
            child: Text(
              "Placar: Você: $_pontosUsuario | App: $_pontosApp",
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          const Padding(
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
                child: Column(
                  children: const [
                    Image(image: AssetImage('images/pedra.png'), height: 100),
                    SizedBox(height: 8),
                    Text("Pedra"),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("papel"),
                child: Column(
                  children: const [
                    Image(image: AssetImage('images/papel.png'), height: 100),
                    SizedBox(height: 8),
                    Text("Papel"),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("tesoura"),
                child: Column(
                  children: const [
                    Image(image: AssetImage('images/tesoura.png'), height: 100),
                    SizedBox(height: 8),
                    Text("Tesoura"),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              _resultadoFinal,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: _corResultado,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

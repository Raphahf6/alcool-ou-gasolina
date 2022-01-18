import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _controllerAlcool = TextEditingController();
  final _controllerGasolina = TextEditingController();
  String _textoResultado = '';

  void calcular() {
    double? precoAlcool = double.tryParse(_controllerAlcool.text);
    double? precoGasolina = double.tryParse(_controllerGasolina.text);
    if (precoAlcool == null || precoGasolina == null) {
      setState(() {
        _textoResultado = 'caractere "," inválido';
      });
    } else {
      setState(() {
        _textoResultado = 'RESULTADO';
        if (precoAlcool / precoGasolina >= 0.7) {
          _textoResultado = 'É melhor abastecer com gasolina.';
        } else {
          _textoResultado = 'É melhor abastecer com alcool.';
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: Image.asset('assets/logo.png')),
          const Padding(
            padding: EdgeInsets.only(bottom: 30),
            child: Text(
              'Saiba qual a melhor opção para abastecimento do seu carro.',
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  label: Text('Preço Álcool, ex: 01.59'),
                  labelStyle: TextStyle(fontSize: 25)),
              controller: _controllerAlcool,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  label: Text('Preço Gasolina, ex: 03.15'),
                  labelStyle: TextStyle(fontSize: 25)),
              controller: _controllerGasolina,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              calcular();
            },
            child: const Padding(
                padding: EdgeInsets.all(15),
                child: Text(
                  'Calcular',
                  style: TextStyle(fontSize: 25),
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text(
              '$_textoResultado',
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}

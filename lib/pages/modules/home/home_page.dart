import 'package:flutter/material.dart';
import 'package:testeasyncstate/pages/modules/home/home_controller.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController textController = TextEditingController();
  HomeController controller = HomeController();
  Map<String, dynamic> _cep = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Digite seu CEP',
            ),
            SizedBox(
              width: 400,
              height: 50,
              child: TextField(
                controller: textController,
              ),
            ),
            ElevatedButton(
                onPressed: () async {
                  final _meuCep = await controller.buscarCep(textController.text);

                  setState(() {
                    _cep = _meuCep;
                  });
                },
                child: const Text('Pesquisar')),
            const SizedBox(
              height: 30,
            ),
            Text(_cep.toString()),
          ],
        ),
      ),
    );
  }
}

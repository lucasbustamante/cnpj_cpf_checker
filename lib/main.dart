import 'package:flutter/material.dart';

void main(){
  runApp(const MaterialApp(
    home: HomePage(),
    debugShowCheckedModeBanner: false,
  ));

}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}




class _HomePageState extends State<HomePage> {
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {

    bool type = false;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          String text = _controller.text.substring(0, 4);
          int primeiraSoma = 0;
          int value = 6;
          for (int i = 0; i < text.length; i++) {
            primeiraSoma += int.parse(text[i]) * (value++);
          }

          value = 2;
          int segundaSoma = 0;
          for (int i = 0; i < _controller.text.substring(4, 8).length; i++) {
            segundaSoma += int.parse(_controller.text.substring(4, 8)[i]) * (value++);

          }
          value = 6;
          int terceiraSoma = 0;
          for (int i = 0; i < _controller.text.substring(8, 12).length; i++) {
            terceiraSoma += int.parse(_controller.text.substring(8, 12)[i]) * (value++);
          }

          print(primeiraSoma+segundaSoma+terceiraSoma);


          if(type){
            String text = _controller.text.substring(0, 9);
            int primeiraSoma = 0;
            for (int i = 0; i < text.length; i++) {
              primeiraSoma += int.parse(text[i]) * (i + 1);
            }
            primeiraSoma%11 == 10 ? primeiraSoma = 0 : primeiraSoma = primeiraSoma%11;
            text = text+(primeiraSoma%11).toString();

            int segundaSoma = 0;
            for (int i = 0; i < text.length; i++) {
              segundaSoma += int.parse(text[i]) * i;
            }
            segundaSoma%11 == 10 ? segundaSoma = 0 : segundaSoma = segundaSoma%11;

            String DV = (primeiraSoma%11).toString()+segundaSoma.toString();
            if(DV == _controller.text.substring(9,11)){
              print('aprovado');
            }else{
              print('reprovado');
            }
          }else{
            String text = _controller.text.substring(0, 4);
            int primeiraSoma = 0;
            for (int i = 0; i < text.length; i++) {
              primeiraSoma += int.parse(text[i]) * (i + 1);
            }

            int segundaSoma = 0;
            for (int i = 4; i < _controller.text.substring(4, 7).length; i++) {
              segundaSoma += int.parse(text[i]) * (i + 1);
            }
            int terceiraSoma = 0;
            for (int i = 7; i < _controller.text.substring(7, 12).length; i++) {
              terceiraSoma += int.parse(text[i]) * (i + 1);
            }


          }
        },),
      appBar: AppBar(
        title: const Text('Consulta Rápida'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Consulte se o CPF ou CNPJ é valido',
              style: TextStyle(
                fontSize: 19
              ),
            ),SizedBox(height: 30),
            Text('Escolha uma opção'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Button(name: 'CPF'),
                Button(name: 'CNPJ'),
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Text(
                'Digite o CPF',
                style: TextStyle(
                  fontSize: 18
                ),
              ),
            ),

            TextField(
              //maxLength: 11,
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Digite um número com 11 dígitos',
              ),
            ),

          ],
        ),
      ),
    );

  }
}

class Button extends StatelessWidget {
  final String name;

  const Button({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ButtonStyle(

        ),
          onPressed: (){},
          child: Text(name)),
    );
  }
}



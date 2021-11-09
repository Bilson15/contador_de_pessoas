import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int contador = 0;

  void decremento() {
    setState(() {
      contador--;
    });
  }

  void incremento() {
    setState(() {
      contador++;
    });
  }

  bool get vazio => contador == 0;
  bool get cheio => contador == 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/img/shopping-carts-1275480_1920.jpg'),
          fit: BoxFit.cover,
        )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              cheio ? 'Lotado!' : 'Pode entrar!',
              style: TextStyle(
                  fontSize: 45,
                  color: cheio ? Colors.redAccent[700] : Colors.amber,
                  fontWeight: FontWeight.w900),
            ),
            Padding(
              padding: const EdgeInsets.all(35),
              child: Text(
                '$contador',
                style: TextStyle(
                    fontSize: 100,
                    color: cheio ? Colors.redAccent[700] : Colors.amber,
                    fontWeight: FontWeight.w900),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: vazio ? null : decremento,
                  style: TextButton.styleFrom(
                    backgroundColor: vazio ? Colors.amber[100] : Colors.amber,
                    fixedSize: const Size(100, 80),
                    primary: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: const Text('Saiu',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      )),
                ),
                const SizedBox(
                  width: 35,
                ),
                TextButton(
                  onPressed: cheio ? null : incremento,
                  style: TextButton.styleFrom(
                    backgroundColor: cheio ? Colors.amber[100] : Colors.amber,
                    fixedSize: const Size(100, 80),
                    primary: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: const Text('Entrou',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

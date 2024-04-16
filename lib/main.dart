import 'package:flutter/material.dart';
import 'package:projeto_app_repiracao/contagem_uso.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Controle de Respiração', style: TextStyle(color: Colors.white),),
          //color: Colors.white,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu, color: Colors.white,),
              onPressed: () {
                Scaffold.of(context).openDrawer();
                //backgroundColor: Colors.blue; nn funcionaaaaaaa
              },
            );
          },
        ),
          backgroundColor: Colors.blue
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BreathingCounter(), // Adiciona a contagem acima da elipse, precisa ser revisado não está funcionando
            BreathingCircle(),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Container(
                height: 50, //altura da barra do cabeçalho, ESSA PARTE NÃO ESTÁ FUNCIONANDO PRECISA ARRUMAR
                child: Text('Menu', style: TextStyle(color: Colors.white),),
              ),
              decoration: BoxDecoration(
                color: Colors.blueGrey,
              ),
            ),
            ListTile(
              title: Text('Contagem de Uso'),
              onTap: () {
                // faz ir para a tela de contagem de uso
                Navigator.pop(context); // az fechar o menu quando clica fora
                Navigator.push(context, MaterialPageRoute(builder: (context) => UsageCountScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ContagemElipse extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Text(
      'Contagem de Respirações: 0', // precisa rever também não está funcionando
      style: TextStyle(fontSize: 18),
    );
  }
}


class BreathingCounter extends StatelessWidget {
  const BreathingCounter({super.key});

  @override
  Widget build(BuildContext context) {
    // Implemente a lógica da contagem aqui
    return Container(); // Ou qualquer widget que represente a contagem
  }
}

class BreathingCircle extends StatefulWidget {
  @override
  _BreathingCircleState createState() => _BreathingCircleState();
}

class _BreathingCircleState extends State<BreathingCircle> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 4),
    )..repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Container(
          width: 200 * _controller.value,
          height: 200 * _controller.value,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.blueGrey,
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}




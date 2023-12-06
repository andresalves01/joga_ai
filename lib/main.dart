import 'package:flutter/material.dart';
import 'package:joga_ai/tabbar.dart';
import 'appbar.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  // Initialize the 'pt_BR' locale
  await initializeDateFormatting('pt_BR', null);

  // Run the app
  runApp(const JogaAi());
}

class JogaAi extends StatelessWidget {
  const JogaAi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Joga Ai",
        debugShowCheckedModeBanner: false,
        home: const HomePage(),
        theme: ThemeData(
          colorScheme: const ColorScheme.light(background: Colors.white),
          fontFamily: 'Cereal',
          primarySwatch: Colors.green,
        ));
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AirbnbTabBar airbnbTabBar = AirbnbTabBar();

  List<Widget> tabBarView = [];

  @override
  void initState() {
    super.initState();
    airbnbTabBar
        .getTabBarView()
        .then((value) => tabBarView.addAll(value))
        .whenComplete(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(150.0),
            child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(40, 128, 128, 128),
                      spreadRadius: 2,
                      blurRadius: 1,
                      offset: Offset(0, 1),
                    ),
                  ],
                ),
                child: const Column(
                  children: [
                    AirbnbAppBar(backgroundColor: Colors.white),
                    AirbnbTabBar.tabBar
                  ],
                )),
          ),
          body: ListView(children: tabBarView),
          bottomNavigationBar: BottomNavigationBar(
              selectedItemColor: Colors.green,
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.search), label: "Explorar"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.favorite), label: "Favoritors"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person), label: "Perfil")
              ]),
        ));
  }
}

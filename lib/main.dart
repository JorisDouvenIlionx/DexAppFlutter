import 'package:flutter/material.dart';
import 'package:flutter_pokedex/abilities_list_view.dart';

void main() {
  runApp(const Pokedex());
}

class Pokedex extends StatelessWidget {
  const Pokedex({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.cruelty_free)),
                Tab(icon: Icon(Icons.local_fire_department)),
              ],
            ),
            title: const Text('Advanced Pokédex'),
          ),
          body: const TabBarView(
            children: [
              AbilityListView(),
              Center(child: Text("Put every Ability here")),
            ],
          ),
        ),
      ),
    );
  }
}

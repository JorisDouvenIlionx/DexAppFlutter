import 'package:flutter/material.dart';
import 'package:flutter_pokedex/abilities_list_view.dart';
import 'package:flutter_pokedex/Beesjes.dart';
import 'package:flutter_pokedex/beesjes_data.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

void main() {
  runApp(const Pokedex());
}

class Pokedex extends StatelessWidget {
  const Pokedex({super.key});

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: BeesjesData.GetGQLClient(),
      child: MaterialApp(
        home: DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              bottom: const TabBar(
                tabs: [
                  Tab(icon: Icon(Icons.cruelty_free)),
                  Tab(icon: Icon(Icons.add_home)),
                ],
              ),
              title: const Text('Advanced Pokédex'),
            ),
            body: const TabBarView(
              children: [AbilityListView(), Beesjes()],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_pokedex/ability_detail_screen.dart';

import 'ability_model.dart';

class AbilityListView extends StatefulWidget {
  const AbilityListView({super.key});

  @override
  State<AbilityListView> createState() => _AbilityListViewState();
}

class _AbilityListViewState extends State<AbilityListView> {
  static List<Ability> abilities = [
    Ability(
        name: "Stench",
        id: 1,
        effect:
            "Has a 10% chance of making target Pokémon flinch with each hit."),
    Ability(
        name: "Drizzle",
        id: 2,
        effect: "Summons rain that lasts indefinitely upon entering battle."),
    Ability(
        name: "Speed Boost",
        id: 3,
        effect: "Raises Speed one stage after each turn.")
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: abilities.length,
        itemBuilder: (context, index) {
          final ability = abilities[index];

          return Card(
            child: ListTile(
              title: Text(ability.name ?? "No Name Found"),
              onTap: () => {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AbilityDetails(
                              ability: ability,
                            )))
              },
            ),
          );
        });
  }
}

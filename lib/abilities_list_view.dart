import 'package:flutter/material.dart';
import 'package:flutter_pokedex/ability_detail_screen.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'ability_model.dart';

const String readCounters = """
  query ExampleQuery(\$where: pokemon_v2_abilityeffecttext_bool_exp, \$pokemonV2AbilityflavortextsWhere2: pokemon_v2_abilityflavortext_bool_exp, \$limit: Int) {
    pokemon_v2_ability {
      name
      pokemon_v2_abilityeffecttexts(where: \$where) {
        effect
      }
      pokemon_v2_abilityflavortexts(where: \$pokemonV2AbilityflavortextsWhere2, limit: \$limit) {
        flavor_text
      }
      id
    }
  }
""";

class AbilityListView extends StatefulWidget {
  const AbilityListView({super.key});

  @override
  State<AbilityListView> createState() => _AbilityListViewState();
}

class _AbilityListViewState extends State<AbilityListView> {
  // static List<Ability> abilities = [
  //   Ability(
  //       name: "Stench",
  //       id: 1,
  //       effect:
  //           "Has a 10% chance of making target Pokémon flinch with each hit."),
  //   Ability(
  //       name: "Drizzle",
  //       id: 2,
  //       effect: "Summons rain that lasts indefinitely upon entering battle."),
  //   Ability(
  //       name: "Speed Boost",
  //       id: 3,
  //       effect: "Raises Speed one stage after each turn.")
  // ];

  @override
  Widget build(BuildContext context) {
    QueryOptions options = QueryOptions(
      document: gql(readCounters),
      variables: const {
        "where": {
          "language_id": {"_eq": 9}
        },
        "pokemonV2AbilityflavortextsWhere2": {
          "language_id": {"_eq": 9}
        },
        "limit": 1
      },
    );

    Widget builder(QueryResult result,
        {VoidCallback? refetch, FetchMore? fetchMore}) {
      if (result.hasException) {
        return Text(result.exception.toString());
      }
      if (result.isLoading) {
        return const Text("Loading");
      }

      var abilityData = result.data?['pokemon_v2_ability'];

      return ListView.builder(
          itemCount: abilityData.length,
          itemBuilder: (c, i) {
            return Card(
                child: ListTile(
              leading: Text(abilityData[i]['id'].toString()),
              title: Text(abilityData[i]['name']),
              onTap: () => {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AbilityDetails(
                            ability: Ability(
                                name: abilityData[i]['name'],
                                id: abilityData[i]['id'],
                                effect: abilityData[i]
                                        ['pokemon_v2_abilityeffecttexts'][0]
                                    ['effect'])))),
              },
            ));
          });
    }

    return Query(
      options: options,
      builder: builder,
    );
  }
}

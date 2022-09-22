import 'package:flutter/material.dart';
import 'package:flutter_pokedex/beesjes_info.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

const String readCounters = """
      query ExampleQuery {
        pokemon_v2_pokemon {
          name
          id
          pokemon_v2_pokemonsprites {
            sprites
          }
        }
      }
""";

class Beesjes extends StatefulWidget {
  const Beesjes({super.key});

  @override
  State<Beesjes> createState() => _BeesjesState();
}

class _BeesjesState extends State<Beesjes> {
  @override
  Widget build(BuildContext context) {
    QueryOptions options = QueryOptions(
      document: gql(readCounters),
      // variables: const {'counterId': 42},
      // pollInterval: const Duration(seconds: 10),
    );

    Widget builder(QueryResult result,
        {VoidCallback? refetch, FetchMore? fetchMore}) {
      if (result.hasException) {
        return Text(result.exception.toString());
      }
      if (result.isLoading) {
        return const Text("Loading");
      }

      var counters = result.data?['pokemon_v2_pokemon'];
      return ListView.builder(
          itemCount: counters.length,
          itemBuilder: (c, i) {
            return Card(
                child: ListTile(
              leading: Text(counters[i]['id'].toString()),
              title: Text(counters[i]['name']),
              // subtitle: Text(counters[i]['pokemon_v2_pokemonsprites']['sprites']),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const BeesjesInfo())),));
          });
    }

    return Query(
      options: options,
      builder: builder,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

const String GQLQuery = """
      query GetPokemons(\$where: pokemon_v2_pokemon_bool_exp) {
        pokemon_v2_pokemon(where: \$where) {
          name

        }
      }
""";

class BeesjesInfo extends StatefulWidget {
  const BeesjesInfo({super.key, required this.i});

  final int i;

  @override
  State<BeesjesInfo> createState() => _BeesjesInfoState();
}

class _BeesjesInfoState extends State<BeesjesInfo> {
  @override
  Widget build(BuildContext context) {
    QueryOptions options = QueryOptions(
      document: gql(GQLQuery),
      variables: {
        'where': {
          "id": {"_eq": widget.i}
        }
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

      var pokemons = result.data?['pokemon_v2_pokemon'][0];
      print(pokemons);

      return Text(pokemons['name']);
    }

    return Scaffold(
        appBar: AppBar(),
        body: Query(
          options: options,
          builder: builder,
        ));
  }
}

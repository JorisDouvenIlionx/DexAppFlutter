import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

const String readCounters = """
    query Pokemon {
      allPokemon {
        id
        name
        sprites{
          front_default
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
      variables: const {'counterId': 42},
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
      List counters = result.data?['allPokemon'];
      
      return ListView.builder(
          itemCount: counters.length,
          itemBuilder: (c, i) {
            return Card(
                child: ListTile(
              leading: Text(counters[i]['id'].toString()),
              title: Text(counters[i]['name']),
              trailing: counters[i]['sprites']['front_default'],
            ));
          });
    }

    return Query(
      options: options,
      builder: builder,
    );
  }
}

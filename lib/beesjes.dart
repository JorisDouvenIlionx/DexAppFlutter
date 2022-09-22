import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'beesjes_data.dart'';

const String readCounters = """
    query readCounters(\$counterId: Int!) {
        counter {
            name
            id
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
      variables: {'counterId': 42},
      pollInterval: const Duration(seconds: 10),
    );

    Widget builder(QueryResult result,
        {VoidCallback? refetch, FetchMore? fetchMore}) {
      if (result.hasException) {
        return Text(result.exception.toString());
      }
      if (result.isLoading) {
        return Text("Loading");
      }

      List counters = result.data?['counter'];

      return ListView.builder(
          itemCount: 894,
          itemBuilder: (c, i) {
            return Text(counters[i]['name']);
          });
    }

    return Query(
      options: options,
      builder: builder,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

final hyperLink = HttpLink('https://beta.pokeapi.co/graphql/v1beta/');

class BeesjesData {
  // ignore: non_constant_identifier_names
  static ValueNotifier<GraphQLClient> GetGQLClient() {
    return ValueNotifier(GraphQLClient(cache: GraphQLCache(), link: hyperLink));
  }
}

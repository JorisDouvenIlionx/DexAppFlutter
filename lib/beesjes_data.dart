import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

final hyperLink = HttpLink('https://dex-server.herokuapp.com/');

class BeesjesData {
  static ValueNotifier<GraphQLClient> GetGQLClient() {
    return ValueNotifier(GraphQLClient(cache: GraphQLCache(), link: hyperLink));
  }
}

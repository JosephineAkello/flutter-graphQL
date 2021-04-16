import 'package:flutter/material.dart';
import "package:graphql_flutter/graphql_flutter.dart";
import 'secrets.dart';

class GraphQLConfiguration{
   static HttpLink httpLink = HttpLink(
    "$graphQLink",
  );

 ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
      link: httpLink,
      // The default store is the InMemoryStore, which does NOT persist to disk
      cache: GraphQLCache(store: HiveStore()),
    ),
  );
  }

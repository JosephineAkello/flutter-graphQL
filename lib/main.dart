import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'register.dart';
import 'graphqlConf.dart';

GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();

void main() async {
  // runApp( MyApp());
  await initHiveForFlutter();
  runApp(GraphQLProvider(
      client: graphQLConfiguration.client,
      child: CacheProvider(child: MyApp())));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter GraphQL App',
        theme: ThemeData(
          primaryColor: Color(0xFF102253),
          accentColor: Color(0xFF91A6E0),
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text(
              'Flutter GraphQL App',
            ),
            centerTitle: true,
          ),
          body: Register(),
        ));
  }
}

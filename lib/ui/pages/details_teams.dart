import 'package:flutter/material.dart';
import 'package:project_app/api/api_constants.dart';
import 'package:project_app/models/teams.dart';

class DetailsTeams extends StatelessWidget {
  final Teams teams;

  const DetailsTeams({required this.teams, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, {required}) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Sobre'),
          titleSpacing: 100.0,
          centerTitle: true,
          backgroundColor: Colors.black54,
        ),
        body: Padding(
          padding: const EdgeInsets.all(50),
          child: Center(
              child: Column(children: <Widget>[
            Text(
              teams.name,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.normal,
              ),
            ),
            Image.network(
              '${ApiConstants.urlImg}${teams.flag.replaceFirst('~', '')}',
              width: 250,
              height: 250,
            ),
          ])),
        ));
  }
}

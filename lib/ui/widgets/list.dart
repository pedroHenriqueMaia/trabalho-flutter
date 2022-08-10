import 'package:flutter/material.dart';
import 'package:project_app/api/api_constants.dart';
import 'package:project_app/models/teams.dart';
import 'package:project_app/ui/pages/details_teams.dart';

class ListTeams extends StatefulWidget {
  late List<Teams>? teams = [];

  ListTeams({required this.teams, Key? key}) : super(key: key);

  @override
  State<ListTeams> createState() => _ListPageState();
}

class _ListPageState extends State<ListTeams> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: widget.teams?.length ?? 0,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(widget.teams?.elementAt(index).name ?? ''),
                  leading: Image.network(
                    '${ApiConstants.urlImg}${widget.teams?.elementAt(index).flag.replaceFirst('~', '')}',
                    width: 50,
                    height: 45,
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailsTeams(
                                  teams: widget.teams!.elementAt(index),
                                )));
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:project_app/api/api.dart';
import 'package:project_app/models/teams.dart';
import 'package:project_app/ui/ui.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Teams>? _teams = [];

  @override
  void initState() {
    super.initState();
    _get();
  }

  void _get() async {
    _teams = (await Api().getTeams()) ?? [];
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Times - Seleções'),
          centerTitle: true,
          backgroundColor: Colors.black54,

        ),
        body: _teams!.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : ListTeams(
                teams: _teams,
              ));
  }
}

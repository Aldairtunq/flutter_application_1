import 'package:flutter/material.dart';

import '../db/bd_agenda.dart';

class HomePage extends StatelessWidget {
  get myTasks => null;

  Future<String> getFullNase() async {
    return "Aldair tunquipa";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home Page'),
        ),
        body: FutureBuilder(
            future: DBAdmin.db.getTasks(),
            builder: (BuildContext context, AsyncSnapshot snap) {
              if (snap.hasData) {
                List<Map<String, dynamic>> myTastks = snap.data;
                return ListView.builder(
                  itemCount: myTastks.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(myTasks[index]["title"]),
                      subtitle: Text(myTasks[index]["descripcion"]),
                    );
                  },
                );
              }

              return const Center(
                child: CircularProgressIndicator(),
              );
            }));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/task_model.dart';

import '../db/bd_agenda.dart';

class HomePage extends StatelessWidget {
  get myTasks => null;

  Future<String> getFullNase() async {
    return "Aldair tunquipa";
  }

  @override
  Widget build(BuildContext context) {
    DBAdmin.db.getTasks();

    return Scaffold(
        appBar: AppBar(
          title: const Text('Home Page'),
        ),
        body: FutureBuilder(
            future: DBAdmin.db.getTasks(),
            builder: (BuildContext context, AsyncSnapshot snap) {
              if (snap.hasData) {
                List<TaskModel> myTastks = snap.data;
                return ListView.builder(
                  itemCount: myTastks.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(myTasks[index].title),
                      subtitle: Text(myTasks[index].descripcion),
                      trailing: Text(myTasks[index].id.toString()),
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

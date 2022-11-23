import 'package:flutter/material.dart';

import '../db/bd_agenda.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                DBAdmin.db.initDatabase();
              },
              child: Text("Mostrar data"),
            ),
            ElevatedButton(
              onPressed: () {
                DBAdmin.db.insertTask();
              },
              child: Text("Insertar Tarea"),
            ),
            ElevatedButton(
              onPressed: () {
                //DBAdmin.db.updateRawTask();
                DBAdmin.db.updateTask();
              },
              child: Text("Actualizar tarea Tarea"),
            ),
            ElevatedButton(
              onPressed: () {
                DBAdmin.db.deleteRawTask();
                //DBAdmin.db.deleteTask();
              },
              child: Text("Elimnar Tarea"),
            ),
          ],
        ),
      ),
    );
  }
}

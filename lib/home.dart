import 'package:flutter/material.dart';
import 'package:locally_store/noteslist.dart';
//To shared preferences one has to import the shared preferences
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final notesController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          //Keeping alignment in Column - If it's just a single widget use wrap with center widget but for rest use main & cross alignment
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: notesController,
              decoration: const InputDecoration(
                hintText: 'Enter Notes',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  setNotesData(notesController.text);
                },
                child: const Text('Save')),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const NotesListScreen(),
                      ));
                },
                child: const Text('View Notes')),
          ],
        ),
      ),
    );
  }

//Creating a method
  Future<void> setNotesData(noteValue) async {
    //creating variable for shared preferences
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('noteData', noteValue);
  }
}

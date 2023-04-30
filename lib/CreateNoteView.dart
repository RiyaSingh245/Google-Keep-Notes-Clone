import 'package:flutter/material.dart';
import 'package:keep_notes/Services/db.dart';
import 'package:keep_notes/colors.dart';
import 'Model/MyNoteModel.dart';
import 'home.dart';

class CreateNoteView extends StatefulWidget {
  const CreateNoteView({super.key});

  @override
  State<CreateNoteView> createState() => _CreateNoteViewState();
}

class _CreateNoteViewState extends State<CreateNoteView> {
  TextEditingController title = TextEditingController();
  TextEditingController content = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    title.dispose();
    content.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: bgColor.withOpacity(0.3),
        elevation: 1.0,
        actions: [
          IconButton(
            onPressed: () async {
              await NotesDatabse.instance.InsertEntry(Note(
                title: title.text,
                content: content.text,
                pin: false,
                isArchieve: false,
                createdTime: DateTime.now(),
              ));
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => Home()));
            },
            icon: const Icon(Icons.save_outlined),
            splashRadius: 17,
          ),
        ],
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: Column(
          children: [
            TextField(
              controller: title,
              cursorColor: bgColor,
              style: const TextStyle(
                  fontSize: 25, color: bgColor, fontWeight: FontWeight.bold),
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  hintText: "Title",
                  hintStyle: TextStyle(
                    color: bgColor,
                  )),
            ),
            Container(
              height: 300,
              child: TextField(
                controller: content,
                keyboardType: TextInputType.multiline,
                minLines: 50,
                maxLines: null,
                cursorColor: bgColor,
                style: const TextStyle(fontSize: 17, color: bgColor),
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    hintText: "Note",
                    hintStyle: TextStyle(
                      color: bgColor,
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

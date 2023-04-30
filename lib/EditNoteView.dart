import 'package:flutter/material.dart';
import 'package:keep_notes/NoteView.dart';
import 'package:keep_notes/Services/db.dart';
import 'package:keep_notes/colors.dart';
import 'package:keep_notes/home.dart';
import 'Model/MyNoteModel.dart';

class EditNoteView extends StatefulWidget {
  Note note;
  EditNoteView({super.key, required this.note});

  @override
  State<EditNoteView> createState() => _EditNoteViewState();
}

class _EditNoteViewState extends State<EditNoteView> {
  late String NewTitle;
  late String NewNoteDet;

  @override
  void initState() {
    super.initState();
    NewTitle = widget.note.title.toString();
    NewNoteDet = widget.note.content.toString();
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
              Note newNote = Note(
                  content: NewNoteDet,
                  title: NewTitle,
                  createdTime: widget.note.createdTime,
                  pin: widget.note.pin,
                  isArchieve: widget.note.isArchieve,
                  id: widget.note.id);
              await NotesDatabse.instance.updateNote(newNote);
              // ignore: use_build_context_synchronously
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const Home()),
              );
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
            Form(
              child: TextFormField(
                initialValue: NewTitle,
                cursorColor: bgColor,
                onChanged: ((value) {
                  NewTitle = value;
                }),
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
                    fontWeight: FontWeight.bold,
                    color: bgColor,
                  ),
                ),
              ),
            ),
            Container(
              height: 300,
              child: Form(
                child: TextFormField(
                  initialValue: NewNoteDet,
                  onChanged: ((value) {
                    NewNoteDet = value;
                  }),
                  keyboardType: TextInputType.multiline,
                  minLines: 50,
                  maxLines: null,
                  cursorColor: white,
                  style: const TextStyle(fontSize: 17, color: bgColor),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    hintText: "Note",
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: bgColor,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

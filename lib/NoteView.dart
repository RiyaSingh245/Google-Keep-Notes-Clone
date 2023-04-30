import 'package:flutter/material.dart';
import 'package:keep_notes/ArchiveView.dart';
import 'package:keep_notes/EditNoteView.dart';
import 'package:keep_notes/Services/db.dart';
import 'package:keep_notes/colors.dart';
import 'package:keep_notes/home.dart';
import 'Model/MyNoteModel.dart';
import 'package:intl/intl.dart';

class NoteView extends StatefulWidget {
  //const NoteView({super.key});

  Note note;
  NoteView({super.key, required this.note});

  @override
  State<NoteView> createState() => _NoteViewState();
}

class _NoteViewState extends State<NoteView> {
  @override
  void initState() {
    super.initState();
    //print(widget.note.pin);
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
              await NotesDatabse.instance.pinNote(widget.note);
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => Home()));
            },
            icon: Icon(
                widget.note.pin ? Icons.push_pin : Icons.push_pin_outlined),
            splashRadius: 17,
          ),
          IconButton(
            onPressed: () async {
              await NotesDatabse.instance.archNote(widget.note);
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => Home()));
            },
            icon: Icon(widget.note.isArchieve
                ? Icons.archive
                : Icons.archive_outlined),
            splashRadius: 17,
          ),
          IconButton(
            onPressed: () async {
              await NotesDatabse.instance.deleteNote(widget.note);
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => Home()));
            },
            icon: const Icon(Icons.delete_forever_outlined),
            splashRadius: 17,
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => EditNoteView(note: widget.note)));
            },
            icon: const Icon(Icons.edit_outlined),
            splashRadius: 17,
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Created on ${DateFormat('dd-MM-yyyy').format(widget.note.createdTime)}",
                style: const TextStyle(fontSize: 15, color: bgColor),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                widget.note.title,
                style: const TextStyle(
                    fontSize: 15, fontWeight: FontWeight.bold, color: bgColor),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                widget.note.content,
                style: const TextStyle(color: bgColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

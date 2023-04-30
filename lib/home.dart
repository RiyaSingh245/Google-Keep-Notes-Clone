import 'package:flutter/material.dart';
import 'package:keep_notes/NoteView.dart';
import 'package:keep_notes/SearchPage.dart';
import 'package:keep_notes/Services/auth.dart';
//import 'package:keep_notes/Services/firestore_db.dart';
import 'package:keep_notes/Services/login_info.dart';
import 'package:keep_notes/SideMenuBar.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'colors.dart';
import 'CreateNoteView.dart';
import 'Services/db.dart';
import 'package:keep_notes/Model/MyNoteModel.dart';

import 'login.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isLoading = true;
  bool isStaggered = true;
  late List<Note> noteslist;
  late String? ImgUrl;
  GlobalKey<ScaffoldState> drawerkey = GlobalKey();
  String note =
      " THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE  THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE  THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE  THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE";
  String note2 = "THIS IS A NOTE THIS IS A NOTE ";
  @override
  void initState() {
    super.initState();
    /*createEntry(Note(
        pin: false,
        isArchieve: false,
        title: "title",
        content: note2,
        createdTime: DateTime.now()));*/
    LocalDataSaver.saveSyncSet(false);
    getAllNotes();

    //updateoneNote();
    //getOneNote();
  }

  Future createEntry(Note note) async {
    await NotesDatabse.instance.InsertEntry(note);
  }

  Future<void> getAllNotes() async {
    LocalDataSaver.getImg().then((value) {
      if (mounted) {
        setState(() {
          ImgUrl = value;
        });
      }
    });

    noteslist = await NotesDatabse.instance.readAllNotes();
    if (mounted) {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> getOneNote(int id) async {
    await NotesDatabse.instance.readOneNote(id);
  }

  Future<void> updateoneNote(Note note) async {
    await NotesDatabse.instance.updateNote(note);
  }

  Future<void> deleteoneNote(Note note) async {
    await NotesDatabse.instance.deleteNote(note);
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Scaffold(
            backgroundColor: white,
            body: Center(
              child: CircularProgressIndicator(color: Colors.blueAccent),
            ),
          )
        : Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CreateNoteView()));
              },
              backgroundColor: bgColor.withOpacity(0.3),
              child: const Icon(
                Icons.add,
                size: 45,
              ),
            ),
            endDrawerEnableOpenDragGesture: true,
            key: drawerkey,
            drawer: const SideMenu(),
            backgroundColor: white,
            body: RefreshIndicator(
              onRefresh: () {
                return Future.delayed(const Duration(seconds: 1), () {
                  setState(() {});
                });
              },
              child: SafeArea(
                child: SingleChildScrollView(
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 10,
                          ),
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: bgColor.withOpacity(0.2),
                                spreadRadius: 1,
                                blurRadius: 2,
                              ),
                            ],
                          ),
                          child: Row(
                            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  TextButton(
                                    onPressed: (() {
                                      drawerkey.currentState!.openDrawer();
                                    }),
                                    child: const Icon(
                                      Icons.menu,
                                      color: bgColor,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 16,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const SearchView(),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      height: 55,
                                      width:
                                          MediaQuery.of(context).size.width / 3,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: const [
                                          Text(
                                            "Search Notes",
                                            style: TextStyle(
                                              color: bgColor,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              /*const SizedBox(
                                width: 16,
                              ),*/
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  children: [
                                    TextButton(
                                      style: ButtonStyle(
                                        overlayColor:
                                            MaterialStateProperty.resolveWith(
                                                (states) =>
                                                    white.withOpacity(0.1)),
                                        shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(50.0),
                                          ),
                                        ),
                                      ),
                                      onPressed: (() {
                                        setState(() {
                                          isStaggered = !isStaggered;
                                        });
                                      }),
                                      child: const Icon(
                                        Icons.grid_view,
                                        color: bgColor,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 9,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        signOut();
                                        LocalDataSaver.saveLoginData(false);
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => Login()));
                                      },
                                      child: CircleAvatar(
                                        onBackgroundImageError:
                                            (Object, StackTrace) {},
                                        radius: 16,
                                        backgroundImage:
                                            NetworkImage(ImgUrl.toString()),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        isStaggered ? NoteSectionAll() : NoteListSection(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
  }

  Widget NoteSectionAll() {
    return Container(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 25,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "ALL",
                  style: TextStyle(
                    color: bgColor.withOpacity(0.5),
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Container(
            //height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: MasonryGridView.count(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              itemCount: noteslist.length,
              itemBuilder: (context, index) => InkWell(
                onTap: (() {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NoteView(
                                note: noteslist[index],
                              )));
                }),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: bgColor.withOpacity(0.4),
                    ),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        noteslist[index].title,
                        style: const TextStyle(
                          color: bgColor,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        noteslist[index].content.length > 250
                            ? "${noteslist[index].content.substring(0, 250)}..."
                            : noteslist[index].content,
                        style: const TextStyle(
                          color: bgColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget NoteListSection() {
    return Container(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 25,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "ALL",
                  style: TextStyle(
                    color: bgColor.withOpacity(0.5),
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: SizedBox(
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: noteslist.length,
                itemBuilder: (context, index) => Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: bgColor.withOpacity(0.4),
                    ),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        noteslist[index].title,
                        style: const TextStyle(
                          color: bgColor,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        noteslist[index].content.length > 250
                            ? "${noteslist[index].content.substring(0, 250)}..."
                            : noteslist[index].content,
                        style: const TextStyle(
                          color: bgColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

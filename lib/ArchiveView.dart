import 'package:flutter/material.dart';
import 'package:keep_notes/Model/MyNoteModel.dart';
import 'package:keep_notes/NoteView.dart';
import 'package:keep_notes/SideMenuBar.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'SearchPage.dart';
import 'Services/db.dart';
import 'colors.dart';
import 'CreateNoteView.dart';

class ArchiveView extends StatefulWidget {
  const ArchiveView({super.key});

  @override
  State<ArchiveView> createState() => _ArchiveViewState();
}

class _ArchiveViewState extends State<ArchiveView> {
  late List<Note> noteslist;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getAllNotes();
  }

  Future<void> getAllNotes() async {
    noteslist = await NotesDatabse.instance.readAllArchiveNotes();
    if (mounted) {
      setState(() {
        isLoading = false;
      });
    }
  }

  GlobalKey<ScaffoldState> drawerkey = GlobalKey();
  String note =
      " THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE  THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE  THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE  THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE THIS IS A NOTE";
  String note2 = "THIS IS A NOTE THIS IS A NOTE ";

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Scaffold(
            backgroundColor: bgColor,
            body: Center(
              child: CircularProgressIndicator(color: Colors.white),
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
              backgroundColor: bgColor,
              child: const Icon(
                Icons.add,
                size: 45,
              ),
            ),
            endDrawerEnableOpenDragGesture: true,
            key: drawerkey,
            drawer: const SideMenu(),
            backgroundColor: white,
            body: SafeArea(
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
                        height: 55,
                        decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(8),
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
                                    Navigator.pop(context);
                                  }),
                                  child: const Icon(
                                    Icons.arrow_back_sharp,
                                    color: bgColor,
                                  ),
                                ),
                                /*const SizedBox(
                            width: 1,
                          ),*/
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
                            /*Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            /*TextButton(
                              style: ButtonStyle(
                                overlayColor: MaterialStateProperty.resolveWith(
                                    (states) => white.withOpacity(0.1)),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50.0),
                                  ),
                                ),
                              ),
                              onPressed: (() {}),
                              child: const Icon(
                                Icons.grid_view,
                                color: white,
                              ),
                            ),*/
                            const SizedBox(
                              width: 1,
                            ),
                            /*const CircleAvatar(
                              radius: 16,
                              backgroundColor: white,
                            ),*/
                          ],
                        ),
                      ),*/
                          ],
                        ),
                      ),
                      NoteSectionAll(),
                      //NoteListSection(),
                    ],
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
                  "LIST VIEW",
                  style: TextStyle(
                    color: white.withOpacity(0.5),
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context, index) => Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: white.withOpacity(0.4),
                  ),
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "LIST VIEW",
                      style: TextStyle(
                        color: white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      index.isEven
                          ? note.length > 250
                              ? "${note.substring(0, 250)}..."
                              : note
                          : note2,
                      style: const TextStyle(
                        color: white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

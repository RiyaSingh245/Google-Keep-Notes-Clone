import 'package:flutter/material.dart';
import 'package:keep_notes/Services/db.dart';
import 'package:keep_notes/colors.dart';
import 'Model/MyNoteModel.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'NoteView.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  List<int> SearchResultIDs = [];
  List<Note?> SearchResultNotes = [];

  bool isLoading = false;

  void SearchResults(String query) async {
    SearchResultNotes.clear();
    setState(() {
      isLoading = true;
    });
    final ResultIds = await NotesDatabse.instance.getNoteString(query);
    List<Note?> SearchResultNotesLocal = [];
    ResultIds.forEach((element) async {
      final SearchNote = await NotesDatabse.instance.readOneNote(element);
      SearchResultNotesLocal.add(SearchNote);
      setState(() {
        SearchResultNotes.add(SearchNote);
      });
    });
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              color: white.withOpacity(0.1),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back_outlined,
                        color: white,
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                        textInputAction: TextInputAction.search,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          hintText: "Search Your Note",
                          hintStyle: TextStyle(
                            color: white.withOpacity(0.5),
                            fontSize: 16,
                          ),
                        ),
                        onSubmitted: (value) {
                          setState(() {
                            SearchResults(value.toLowerCase());
                          });
                        },
                      ),
                    ),
                  ],
                ),
                isLoading
                    ? const Center(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      )
                    : NoteSectionAll()
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
                  "Search Results",
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
            //height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: MasonryGridView.count(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              itemCount: SearchResultNotes.length,
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NoteView(
                                note: SearchResultNotes[index]!,
                              )));
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: white.withOpacity(0.4),
                    ),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        SearchResultNotes[index]!.title,
                        style: const TextStyle(
                          color: white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        SearchResultNotes[index]!.content.length > 250
                            ? "${SearchResultNotes[index]!.content.substring(0, 250)}..."
                            : SearchResultNotes[index]!.content,
                        style: const TextStyle(
                          color: white,
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

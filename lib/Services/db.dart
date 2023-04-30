import 'package:keep_notes/Services/firestore_db.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:keep_notes/Model/MyNoteModel.dart';

class NotesDatabse {
  static final NotesDatabse instance = NotesDatabse._init();
  static Database? _database;
  NotesDatabse._init();

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await _initializeDB('write.db');
    return _database;
  }

  Future<Database> _initializeDB(String filepath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filepath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const boolType = 'BOOLEAN NOT NULL';
    const textType = 'TEXT NOT NULL';
    await db.execute('''  
    CREATE TABLE Notes(
      ${NotesImpName.id} $idType,
      ${NotesImpName.pin} $boolType,
      ${NotesImpName.isArchieve} $boolType,
      ${NotesImpName.title} $textType,
      ${NotesImpName.content} $textType,
      ${NotesImpName.createdTime} $textType
    )
    ''');
  }

  Future<Note> InsertEntry(Note note) async {
    final db = await instance.database;
    final id = await db!.insert(NotesImpName.TableName, note.toJson());
    await FireDB().createNewNoteFirestore(note, id.toString());
    print(id);
    return note.copy(id: id);
  }

  Future<List<Note>> readAllNotes() async {
    final db = await instance.database;
    const orderBy = 'createdTime ASC';
    final queryResult =
        await db!.query(NotesImpName.TableName, orderBy: orderBy);
    return queryResult.map((json) => Note.fromJson(json)).toList();
  }

  Future<List<Note>> readAllArchiveNotes() async {
    final db = await instance.database;
    const orderBy = 'createdTime ASC';
    final queryResult = await db!.query(NotesImpName.TableName,
        orderBy: orderBy, where: '${NotesImpName.isArchieve} = 1');
    return queryResult.map((json) => Note.fromJson(json)).toList();
  }

  Future<Note?> readOneNote(int id) async {
    final db = await instance.database;
    final map = await db!.query(NotesImpName.TableName,
        columns: NotesImpName.values,
        where: '${NotesImpName.id} = ?',
        whereArgs: [id]);
    if (map.isNotEmpty) {
      return Note.fromJson(map.first);
    } else {
      return null;
    }
  }

  Future updateNote(Note note) async {
    await FireDB().updateNoteFirestore(note);
    final dp = await instance.database;

    await dp!.update(NotesImpName.TableName, note.toJson(),
        where: '${NotesImpName.id} = ?', whereArgs: [note.id]);
  }

  Future pinNote(Note? note) async {
    final dp = await instance.database;

    await dp!.update(
        NotesImpName.TableName, {NotesImpName.pin: !note!.pin ? 1 : 0},
        where: '${NotesImpName.id} = ?', whereArgs: [note.id]);
  }

  Future archNote(Note? note) async {
    final dp = await instance.database;

    await dp!.update(NotesImpName.TableName,
        {NotesImpName.isArchieve: !note!.isArchieve ? 1 : 0},
        where: '${NotesImpName.id} = ?', whereArgs: [note.id]);
  }

  Future<List<int>> getNoteString(String query) async {
    final db = await instance.database;
    final result = await db!.query(NotesImpName.TableName);
    List<int> resultIds = [];
    result.forEach((element) {
      if (element["title"].toString().toLowerCase().contains(query) ||
          element["content"].toString().toLowerCase().contains(query)) {
        resultIds.add(element["id"] as int);
      }
    });
    return resultIds;
  }

  Future deleteNote(Note? note) async {
    await FireDB().deleteNoteFirestore(note!);
    final dp = await instance.database;

    await dp!.delete(NotesImpName.TableName,
        where: '${NotesImpName.id} = ?', whereArgs: [note.id]);
  }
}

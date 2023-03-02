import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_it/constant.dart';
import 'package:note_it/cubits/notes_cubit/notes_cubit.dart';
import 'package:note_it/models/note_model.dart';
import 'package:note_it/view/widgets/add_note_bottom_sheet.dart';
import 'package:note_it/view/widgets/edit_note.dart';

class MyNotesPage extends StatefulWidget {
  const MyNotesPage({super.key});

  @override
  State<MyNotesPage> createState() => _MyNotesPageState();
}

class _MyNotesPageState extends State<MyNotesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: primary,
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            backgroundColor: const Color(0xffEEEEEE),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            context: context,
            builder: (context) {
              return const AddNoteBottomSheet();
            },
          );
        },
        child: const Icon(
          Icons.edit,
        ),
      ),
      backgroundColor: const Color(0xffEEEEEE),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                Image.asset(
                  'assets/images/note-icon.png',
                  height: 50,
                  width: 50,
                ),
                const SizedBox(
                  height: 8,
                ),
                const Text(
                  'My notes',
                  style: TextStyle(
                    fontSize: 32,
                    fontFamily: FontConstants.montserratFont,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                const CustomSearchBar(),
                const SizedBox(
                  height: 16,
                ),
                const Expanded(
                  child: NotesListView(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: TextFormField(
        decoration: const InputDecoration(
          border: InputBorder.none,
          labelText: 'Search',
          labelStyle: TextStyle(
              fontFamily: FontConstants.montserratFont, color: Colors.black),
          prefixIcon: Icon(
            Icons.search,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}

class NoteItem extends StatelessWidget {
  const NoteItem({
    Key? key,
    required this.note,
  }) : super(key: key);

  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) {
          return EditNote(
            note: note,
          );
        }),
      ),
      child: Card(
        elevation: 4,
        shadowColor: Colors.grey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Container(
          padding: const EdgeInsets.only(top: 24, bottom: 24, left: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                note.date,
                style: TextStyle(
                  color: Colors.black.withOpacity(.7),
                  fontSize: 18,
                  fontFamily: FontConstants.hubballiFont,
                ),
              ),
              ListTile(
                contentPadding: const EdgeInsets.only(left: 0.0, right: 0.0),
                title: Text(
                  note.title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontFamily: FontConstants.montserratFont,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    note.subTitle,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontFamily: FontConstants.hubballiFont,
                    ),
                  ),
                ),
                trailing: Padding(
                  padding: const EdgeInsets.only(
                    right: 30,
                    bottom: 30,
                  ),
                  child: IconButton(
                    onPressed: () {
                      note.delete();
                      BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: primary,
                      size: 32,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NotesListView extends StatefulWidget {
  const NotesListView({super.key});

  @override
  State<NotesListView> createState() => _NotesListViewState();
}

class _NotesListViewState extends State<NotesListView> {
  @override
  void initState() {
    BlocProvider.of<NotesCubit>(context).fetchAllNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        List<NoteModel> notes = BlocProvider.of<NotesCubit>(context).notes!;
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: ListView.builder(
              itemCount: notes.length,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: NoteItem(
                    note: notes[index],
                  ),
                );
              }),
        );
      },
    );
  }
}

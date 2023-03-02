import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_it/constant.dart';
import 'package:note_it/cubits/notes_cubit/notes_cubit.dart';
import 'package:note_it/routes_manager.dart';
import 'package:note_it/view/widgets/add_note_bottom_sheet.dart';

class MyNotesPage extends StatelessWidget {
  const MyNotesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesCubit(),
      child: Scaffold(
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
          labelStyle: TextStyle(fontFamily: FontConstants.montserratFont),
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
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(Routes.myNotesViewBodyRoute),
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
                '13/1/2023',
                style: TextStyle(
                  color: Colors.black.withOpacity(.4),
                  fontSize: 18,
                  fontFamily: FontConstants.hubballiFont,
                ),
              ),
              ListTile(
                contentPadding: const EdgeInsets.only(left: 0.0, right: 0.0),
                title: const Text(
                  'note title',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontFamily: FontConstants.montserratFont,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    'note subtitle',
                    style: TextStyle(
                      color: Colors.black.withOpacity(.4),
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
                    onPressed: () {},
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.black,
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

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: ListView.builder(
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) {
            return const Padding(
              padding: EdgeInsets.symmetric(vertical: 4),
              child: NoteItem(),
            );
          }),
    );
  }
}

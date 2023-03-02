import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:note_it/constant.dart';
import 'package:note_it/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:note_it/models/note_model.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());

  fetchAllNotes() async {
    try {
      var notesBox = Hive.box<NoteModel>(knotesBox);

      List<NoteModel> notes = notesBox.values.toList();
      emit(NotesSuccess(notes));
    } catch (e) {
      emit(NotesFailure(e.toString()));
    }
  }
}

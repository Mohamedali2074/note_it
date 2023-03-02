import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_it/constant.dart';
import 'package:note_it/cubits/notes_cubit/notes_cubit.dart';
import 'package:note_it/models/note_model.dart';
import 'package:note_it/view/widgets/custom_text_form_field.dart';

class EditNote extends StatefulWidget {
  const EditNote({super.key, required this.note});

  final NoteModel note;

  @override
  State<EditNote> createState() => _EditNoteState();
}

class _EditNoteState extends State<EditNote> {
  String? title;
  String? content;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEEEEEE),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              CustomAppBar(
                onPressed: () {
                  widget.note.title = title ?? widget.note.title;
                  widget.note.subTitle = content ?? widget.note.subTitle;
                  widget.note.save();
                  BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                  Navigator.pop(context);
                },
              ),
              const SizedBox(
                height: 28,
              ),
              CustomTextFormField(
                onChanged: (val) {
                  title = val;
                },
                obscureText: false,
                keyboardType: TextInputType.multiline,
                hintText: widget.note.title,
                hintStyle: const TextStyle(color: primary),
                style: const TextStyle(color: primary),
              ),
              const SizedBox(
                height: 28,
              ),
              CustomTextFormField(
                onChanged: (val) {
                  content = val;
                },
                obscureText: false,
                keyboardType: TextInputType.multiline,
                hintText: widget.note.subTitle,
                hintStyle: const TextStyle(color: primary),
                style: const TextStyle(color: primary),
                maxLines: 8,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.onPressed,
  });

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Edit Note',
              style: TextStyle(
                fontSize: 28,
                fontFamily: FontConstants.montserratFont,
              ),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: IconButton(
              onPressed: onPressed,
              icon: const Icon(
                Icons.check,
                size: 36,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

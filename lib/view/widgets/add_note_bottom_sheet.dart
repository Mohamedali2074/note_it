import 'package:flutter/material.dart';
import 'package:note_it/constant.dart';
import 'package:note_it/view/widgets/custom_text_form_field.dart';
import 'package:note_it/view/widgets/main_button.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 32,
          ),
          const CustomTextFormField(
            obscureText: true,
            hintText: 'Title',
            hintStyle: TextStyle(color: primary),
            style: TextStyle(color: primary),
          ),
          const SizedBox(
            height: 28,
          ),
          const CustomTextFormField(
            obscureText: true,
            hintText: 'Content',
            hintStyle: TextStyle(color: primary),
            style: TextStyle(color: primary),
            maxLines: 8,
          ),
          const SizedBox(
            height: 46,
          ),
          MainButton(
            width: 400,
            backgroundColor: primary,
            textColor: Colors.white,
            text: 'Add',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

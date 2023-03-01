import 'package:flutter/material.dart';
import 'package:note_it/constant.dart';
import 'package:note_it/view/widgets/custom_text_form_field.dart';

class NoteViewBody extends StatelessWidget {
  const NoteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEEEEEE),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: const [
              CustomAppBar(),
              SizedBox(
                height: 28,
              ),
              CustomTextFormField(
                keyboardType: TextInputType.multiline,
                obscureText: true,
                hintText: 'Title',
                hintStyle: TextStyle(color: primary),
                style: TextStyle(color: primary),
              ),
              SizedBox(
                height: 28,
              ),
              CustomTextFormField(
                keyboardType: TextInputType.multiline,
                obscureText: true,
                hintText: 'Content',
                hintStyle: TextStyle(color: primary),
                style: TextStyle(color: primary),
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
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Edit Note',
              style: TextStyle(
                fontSize: 28,
                fontFamily: FontConstants.montserratFont,
              ),
            ),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(
              Icons.check,
              size: 36,
            ),
          ),
        ],
      ),
    );
  }
}

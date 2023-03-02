import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:note_it/constant.dart';
import 'package:note_it/cubits/add_note_cubit/add_note_cubit.dart';
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
      child: SingleChildScrollView(
        child: BlocConsumer<AddNoteCubit, AddNoteState>(
          listener: (context, state) {
            if (state is AddNoteFailure) {
              debugPrint('failed ${state.errMessage}');
            }
            if (state is AddNoteSuccess) {
              Navigator.pop(context);
            }
          },
          builder: (context, state) {
            return ModalProgressHUD(
              inAsyncCall: state is AddNoteLoading ? true : false,
              child: const AddNoteForm(),
            );
          },
        ),
      ),
    );
  }
}

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final _formKey = GlobalKey<FormState>();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  String? title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          const SizedBox(
            height: 32,
          ),
          CustomTextFormField(
            onSaved: (val) {
              title = val;
            },
            validator: (val) {
              if (val?.isEmpty ?? true) {
                return 'Field  is required';
              } else {
                return null;
              }
            },
            obscureText: true,
            hintText: 'Title',
            hintStyle: const TextStyle(color: primary),
            style: const TextStyle(color: primary),
          ),
          const SizedBox(
            height: 28,
          ),
          CustomTextFormField(
            onSaved: (val) {
              subTitle = val;
            },
            validator: (val) {
              if (val?.isEmpty ?? true) {
                return 'Field  is required';
              } else {
                return null;
              }
            },
            obscureText: true,
            hintText: 'Content',
            hintStyle: const TextStyle(color: primary),
            style: const TextStyle(color: primary),
            maxLines: 6,
          ),
          const SizedBox(
            height: 28,
          ),
          MainButton(
            width: 400,
            backgroundColor: primary,
            textColor: Colors.white,
            text: 'Add',
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
              } else {
                autovalidateMode = AutovalidateMode.always;
                setState(() {});
              }
            },
          ),
          const SizedBox(
            height: 100,
          ),
        ],
      ),
    );
  }
}

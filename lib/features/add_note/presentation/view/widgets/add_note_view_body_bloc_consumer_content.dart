import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app_with_fire_base/core/entities/note_entity.dart';
import 'package:notes_app_with_fire_base/core/utils/constants/custom_colors.dart';
import 'package:notes_app_with_fire_base/core/utils/constants/firebase_auth_uid.dart';
import 'package:notes_app_with_fire_base/core/utils/functions/custom_snackbar.dart';
import 'package:notes_app_with_fire_base/core/utils/widgets/custom_btn.dart';
import 'package:notes_app_with_fire_base/core/utils/widgets/custom_text_form_field.dart';
import 'package:notes_app_with_fire_base/features/add_note/presentation/manegar/add_note_cubit/add_note_cubit.dart';

class AddNoteViewBodyBlocConsumerContent extends StatefulWidget {
  const AddNoteViewBodyBlocConsumerContent(
      {super.key, required this.isLoading});
  final bool isLoading;

  @override
  State<AddNoteViewBodyBlocConsumerContent> createState() =>
      _AddNoteViewBodyBlocConsumerContentState();
}

class _AddNoteViewBodyBlocConsumerContentState
    extends State<AddNoteViewBodyBlocConsumerContent> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  String noteTitle = "";
  String noteContent = "";
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CustomTextFormField(
                  onSaved: (value) {
                    noteTitle = value!;
                  },
                  validator: (value) {
                    if (value.toString().isEmpty) {
                      return "This Field Is Required";
                    } else {
                      return null;
                    }
                  },
                  maxLenght: 30,
                  inputType: TextInputType.text,
                  innerText: "Note Title",
                  prefixIcon: Icons.title),
              const SizedBox(
                height: 20,
              ),
              CustomTextFormField(
                  onSaved: (value) {
                    noteContent = value!;
                  },
                  validator: (value) {
                    if (value.toString().isEmpty) {
                      return "This Field Is Required";
                    } else {
                      return null;
                    }
                  },
                  maxLines: 10,
                  inputType: TextInputType.text,
                  innerText: "Note Content",
                  prefixIcon: Icons.content_paste),
              const SizedBox(
                height: 100,
              ),
              SizedBox(
                width: double.infinity,
                child: CustomBtn(
                  innnerText: widget.isLoading ? "Loading..." : "Add Note",
                  onPressed: () {
                    if (!widget.isLoading &&
                        _formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      BlocProvider.of<AddNoteCubit>(context).addNote(
                          note: NoteEntity(
                              noteTitle: noteTitle,
                              noteContent: noteContent,
                              uid: uid));
                    } else {
                      customSnackBar(context,
                          msg: "Please Wait", color: customBlue);
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

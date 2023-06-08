import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app_with_fire_base/core/entities/note_entity.dart';
import 'package:notes_app_with_fire_base/core/utils/constants/custom_colors.dart';
import 'package:notes_app_with_fire_base/core/utils/constants/firebase_auth_uid.dart';
import 'package:notes_app_with_fire_base/core/utils/functions/custom_snackbar.dart';
import 'package:notes_app_with_fire_base/core/utils/widgets/custom_btn.dart';
import 'package:notes_app_with_fire_base/core/utils/widgets/custom_text_form_field.dart';
import 'package:notes_app_with_fire_base/features/update_note/presentation/manegar/cubit/update_note_cubit.dart';

class UpdateNoteViewBodyBlocConsumerContent extends StatefulWidget {
  const UpdateNoteViewBodyBlocConsumerContent(
      {super.key,
      required this.isLoading,
      required this.note,
      required this.docId});
  final bool isLoading;
  final NoteEntity note;
  final String docId;
  @override
  State<UpdateNoteViewBodyBlocConsumerContent> createState() =>
      _UpdateNoteViewBodyBlocConsumerContentState();
}

class _UpdateNoteViewBodyBlocConsumerContentState
    extends State<UpdateNoteViewBodyBlocConsumerContent> {
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
                  initialValue: widget.note.noteTitle,
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
                  initialValue: widget.note.noteContent,
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
                  innnerText: widget.isLoading ? "Loading..." : "Update Note",
                  onPressed: () {
                    if (!widget.isLoading &&
                        _formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      BlocProvider.of<UpdateNoteCubit>(context).updateNote(
                          docId: widget.docId,
                          note: NoteEntity(
                              noteTitle: noteTitle,
                              noteContent: noteContent,
                              uid:uid));
                      //! your Code is here !
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

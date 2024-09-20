import 'package:flutter/material.dart';

class DialogeBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogeBox(
      {required this.controller, required this.onCancel, required this.onSave});

  final _formkey = GlobalKey<FormState>();

  // const DialogeBox({super.key});

  String input = "";

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Form(
        key: _formkey,
        child: TextFormField(
          cursorHeight: 20,
         controller: controller,
          decoration: InputDecoration(
            labelStyle: TextStyle(color: Colors.pink),
            labelText: 'add a new task',
            focusedBorder: _border,
            enabledBorder: _border,
            border: _border,
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please inter your task';
            } else {
              return null;
            }
          },
          autovalidateMode: AutovalidateMode.onUserInteraction,
        ),
      ),
      actions: [
        Row(
          children: [
            Expanded(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ElevatedButton(
                  onPressed: onCancel,
                  child: const Text(
                    'cancel',
                    style: TextStyle(color: Colors.pink),
                  )),
            )),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ElevatedButton(
                  onPressed: () {
                    if (_formkey.currentState?.validate() == true) {
                      onSave();
                    }
                  },
                  child: const Text(
                    'add',
                    style: TextStyle(color: Colors.pink),
                  )),
            ))
          ],
        )
      ],
    );
  }
}

final _border = OutlineInputBorder(
  borderRadius: BorderRadius.circular(30),
  borderSide: const BorderSide(color: Colors.pinkAccent, width: 2),
);

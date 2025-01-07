import 'package:flutter/material.dart';
import 'package:to_do_app_tutorial/Components/button.dart';

class DialogBox extends StatelessWidget {
  final TextEditingController textController; 
  VoidCallback onSave;
  VoidCallback onCancel;

   DialogBox({
    super.key, 
    required this.textController,
    required this.onSave,
    required this.onCancel});
 

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow,
      content: Container(
        height: 200,
        color: Colors.yellow,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
//get user input
            TextField(
              controller: textController,
              decoration: const InputDecoration(border:OutlineInputBorder(),
              hintText: "New task",
              )
            ),

            //buttons -> save + cancel
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
              //save button
              Button(text: "Save", onPressed: onSave),
              //space
              const SizedBox(width:20,),
              //cancel
              Button(text: "Cancel", onPressed: onCancel),
             ],
              ),],



        ) ) 
    );
  }
}
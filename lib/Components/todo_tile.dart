import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:to_do_app_tutorial/pages/page_1.dart';

class ToDoTile extends StatefulWidget {

  final String taskName;
  final bool taskCompleted;
  final dynamic Function(bool?)? onChanged;
  final dynamic Function(String) onTextChanged;
  final dynamic Function(BuildContext)? deleteTodo;
  
  const ToDoTile({
      super.key, 
      required this.taskName, 
      required this.taskCompleted,
      required this.onChanged,
      required this.onTextChanged,
      required this.deleteTodo,
      });


  @override
  State<ToDoTile> createState() => _ToDoTileState();
}



class _ToDoTileState extends State<ToDoTile> {
  late TextEditingController textControl;

  @override
  void initState(){
    super.initState();
    textControl = TextEditingController(text:widget.taskName);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Slidable(
        endActionPane:ActionPane(
          motion: const DrawerMotion(),
          children: [
            SlidableAction(
              onPressed: widget.deleteTodo,
              icon: Icons.delete_forever_rounded,
              backgroundColor: const Color.fromARGB(255, 216, 69, 59),
              borderRadius: BorderRadius.circular(12),
            ),
          ],
          ),
        child: Container(
          padding: const EdgeInsets.all(5),
         
          decoration: BoxDecoration(color:const Color.fromARGB(255, 235, 218, 73),
            borderRadius: BorderRadius.circular(12)),
          child: Row(
            children: [
              //checkbox
              Checkbox(
                value: widget.taskCompleted, 
                onChanged: widget.onChanged,
                activeColor:Colors.black)
            ,
                        //task name
        
              Expanded(
                child: TextField(
                  controller:textControl,
                  style: TextStyle(
                  decoration: widget.taskCompleted 
                      ? TextDecoration.lineThrough 
                      : TextDecoration.none),
              onChanged: widget.onTextChanged,
                ),
              ),
        
            ],
          ),
        
          ),
      ),
      );
  }
}
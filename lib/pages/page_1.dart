import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:to_do_app_tutorial/Components/dialogtype.dart';
import 'package:to_do_app_tutorial/Components/todo_tile.dart';
import 'package:to_do_app_tutorial/data/data.dart';
import 'package:to_do_app_tutorial/models/todo_class.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});



  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //reference the hive box
  final _myBox = Hive.box('myBox');
  ToDoDatabase db = ToDoDatabase();

  @override 
  void initState (){
    super.initState();
    //first time ever opening apo - create default data
    if (_myBox.get("TODOLIST") == null) {
      db.createInitialData();
        }
    else {
      // data already exists
      db.loadData();
    }
  }


//making each of the to do list items editable
TextEditingController textControl = TextEditingController();



//checkbox change

 void checkBoxChange (bool? value, int index ){
  setState((){
    db.toDoList[index].isDone = !db.toDoList[index].isDone;
  });
  db.updateDataBase();

 }

//delete a task

void deleteTask (int index){
  setState((){
    db.toDoList.removeAt(index);

});
  db.updateDataBase();
}


//save new task

void saveNewTask (){
  setState((){
    db.toDoList.add(Todo(textControl.text, false));
    textControl.clear();
    Navigator.of(context).pop();

  }
  );
  db.updateDataBase();
}


//field change
void onTextChanged(String newText, int index){
  setState((){
    db.toDoList[index].task =newText;

  });
  db.updateDataBase();
}


//add a new task

void createNewTask (){
  showDialog(
    context: context, 
    builder: (context) {
      return  DialogBox(
        textController: textControl,
        onSave: saveNewTask,
        onCancel: () => Navigator.of(context).pop(),

      );
      },
    );
  db.updateDataBase();
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: const Color.fromARGB(255, 228, 219, 136),
      
      appBar: AppBar(
          title: const Text("Geena's To do's"),
          elevation: 0,
      ),

      floatingActionButton: FloatingActionButton(
          onPressed: createNewTask,
            child: const Icon(Icons.add),

       ),

      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
            return ToDoTile(
              taskName: db.toDoList [index].task,
              taskCompleted: db.toDoList[index].isDone,
              onTextChanged: (newText) => onTextChanged(newText,index),
              onChanged: (value) => checkBoxChange(value, index),
              deleteTodo:(context) => deleteTask(index),
            );
        },
          
         
          ),

      );
  }
}



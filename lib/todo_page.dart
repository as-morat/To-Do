import 'package:flutter/material.dart';
import 'package:todo/style.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  List<Map<String, dynamic>> todoList = [];
  String item = "";
  final TextEditingController _controller = TextEditingController();

  void toggleDone(int index) {
    setState(() {
      todoList[index]["done"] = !(todoList[index]["done"] as bool);
    });
  }

  void myInputOnChange(String content) {
    setState(() {
      item = content;
    });
  }

  void addItem() {
    if (item.trim().isEmpty) return;
    setState(() {
      todoList.add({"item": item, "done": false});
      item = "";
      _controller.clear();
    });
  }

  void removeItem(int index) {
    setState(() {
      todoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.green.shade50,
      appBar: AppBar(title: Text("To Do", style: myText(28, FontWeight.w800),), centerTitle: true),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: TextFormField(
                    controller: _controller,
                    onChanged: myInputOnChange,
                    onFieldSubmitted: (_) => addItem(),
                    decoration: myInput("Add Task"),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: ElevatedButton(
                      onPressed: addItem,
                      style: myButton(),
                      child: Text("Add", style: myText(18, FontWeight.w600),),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 28),
            Expanded(
              child: ListView.builder(
                itemCount: todoList.length,
                itemBuilder: (context, index) {
                  return mySize(
                    ListTile(
                      title: Text(todoList[index]["item"], style: myText(18, FontWeight.w500,color: Colors.green)),
                      leading: IconButton(
                        onPressed: () => toggleDone(index),
                        icon: Icon(
                          todoList[index]["done"] ? Icons.check_box : Icons.check_box_outline_blank,
                          color: todoList[index]["done"] ? Colors.green : null,
                        ),
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.delete_rounded),
                        color: Colors.redAccent,
                        onPressed: () => removeItem(index),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

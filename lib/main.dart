import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const Color _color = Color(0xFF1877F2);

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primarySwatch: Colors.lightBlue),
    home: HomeScreen(),
  ));
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List todoList = [];
  String singlevalue = " ";

  addString(content) {
    setState(() {
      singlevalue = content;
    });
  }

  addList() {
    setState(() {
      todoList.add({"Value": singlevalue});
    });
  }

  deleteitem(index) {
    setState(() {
      todoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _color,
        title: Text(
          "TO DO APP",
          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 25),
        ),
        centerTitle: true,
        toolbarHeight: 70,
        actions: [
          Container(
            margin: EdgeInsets.only(right: 8),
            child: TextButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.black12)),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => faqpage()));
              },
              child: Icon(
                Icons.question_mark_rounded,
                color: Colors.black,
              ),
            ),
          )
        ],
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
        elevation: 0,
      ),
      body: Container(
        margin: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
                flex: 90,
                child: ListView.builder(
                    itemCount: todoList.length,
                    itemBuilder: (context, index) {
                      return Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        color: Colors.white70,
                        child: SizedBox(
                          height: 70,
                          width: double.infinity,
                          child: Container(
                            margin: EdgeInsets.only(left: 20),
                            alignment: Alignment.center,
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 80,
                                  child: Text(
                                    todoList[index]['Value'].toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black),
                                  ),
                                ),
                                Expanded(
                                    flex: 20,
                                    child: TextButton(
                                      style: ButtonStyle(
                                          iconColor: MaterialStatePropertyAll(
                                              Colors.black)),
                                      child: Icon(Icons.delete_rounded),
                                      onPressed: () {
                                        deleteitem(index);
                                      },
                                    ))
                              ],
                            ),
                          ),
                        ),
                      );
                    })),
            Expanded(
              flex: 10,
              child: Row(
                children: [
                  Expanded(
                      flex: 89,
                      child: Container(
                        height: 60,
                        child: TextFormField(
                            onChanged: (content) {
                              addString(content);
                            },
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: _color,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(20.0)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: _color,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(20.0)),
                                labelText: "Add Task Here...",
                                labelStyle:
                                    TextStyle(fontWeight: FontWeight.w500))),
                      )),
                  Expanded(
                    flex: 3,
                    child: SizedBox(
                      width: 10,
                    ),
                  ),
                  Expanded(
                      flex: 27,
                      child: FloatingActionButton(
                        onPressed: () {
                          addList();
                        },
                        elevation: 5.0,
                        backgroundColor: _color,
                        tooltip: 'Add Task',
                        child: Icon(Icons.arrow_upward),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class faqpage extends StatelessWidget {
  const faqpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Frequently Asked Questions"),
        toolbarHeight: 70,
        backgroundColor: _color,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Frequently Asked Questions?",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(
              height: 25,
            ),
            Text("Q : What is this App About?"),
            SizedBox(
              height: 15,
            ),
            Text(
                "A : This is an TO DO list app for listing an events or tasks"),
            SizedBox(
              height: 15,
            ),
            Text("Q : What's the purpose of this app ?"),
            SizedBox(
              height: 15,
            ),
            Text("A : You can add us tasks for reminder purpose")
          ],
        ),
      ),
    );
  }
}

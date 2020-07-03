import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/network/RestApi.dart';

class TodoListScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TodoListState();
  }
}

class _TodoListState extends State<TodoListScreen> {
  @override
  Widget build(BuildContext context) {
    TextStyle textStyle =
        Theme.of(context).textTheme.title.apply(color: Colors.pinkAccent);
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo List"),
      ),
      body: Container(
        child: FutureBuilder(
          future: ApiService().getTodoList(context),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Container(
                child: Center(
                  child: Text("Loading....."),
                ),
              );
            } else {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      elevation: 5.0,
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: 8.0, bottom: 8.0, left: 10.0, right: 10.0),
                        child: Row(
                          children: <Widget>[
                            Align(
                              alignment: Alignment.centerLeft,
                              child: ClipOval(
                                child: Container(
                                  color: Colors.blue,
                                  height: 60.0,
                                  width: 60.0,
                                  child: Center(
                                    child: Text(
                                        snapshot.data[index].userId.toString()),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: 5.0,
                            ),
                            Flexible(
                                child: Column(
                              children: <Widget>[
                                Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                    child: Text(
                                      snapshot.data[index].id.toString(),
                                      style: textStyle,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                    child: Text(
                                      snapshot.data[index].title.toString(),
                                      maxLines: 1,
                                      style: textStyle,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                    child: Text(
                                      snapshot.data[index].completed.toString(),
                                      style: textStyle,
                                    ),
                                  ),
                                )
                              ],
                            ))
                          ],
                        ),
                      ),
                    );
                  });
            }
          },
        ),
      ),
    );
  }
}



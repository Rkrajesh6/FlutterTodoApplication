import 'dart:convert';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:todoapp/model/TodoModel.dart';
import 'package:todoapp/util/Constants.dart';

class ApiService {
  Future<List<TodoModel>> getTodoList(BuildContext context) async {
//    var connectivityResult = await (Connectivity().checkConnectivity());
//    if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi) {
    var data = await http.get(Constants.BASE_URLS);
    var jsonData = jsonDecode(data.body);
    List<TodoModel> list = [];
    for (var todo in jsonData) {
      TodoModel todoModel = TodoModel(
          todo['userId'], todo['id'], todo['title'], todo['completed']);
      list.add(todoModel);
    }
    return list;
//    } else {
//      showAlert(context);
//    }
  }
}

/*
showAlert(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Alert Dialog Title Text.'),
        content: Text("Are You Sure Want To Proceed ?"),
        actions: <Widget>[
          FlatButton(
            child: Text("YES"),
            onPressed: () {
              //Put your code here which you want to execute on Yes button click.
              Navigator.of(context).pop();
            },
          ),

          FlatButton(
            child: Text("NO"),
            onPressed: () {
              //Put your code here which you want to execute on No button click.
              Navigator.of(context).pop();
            },
          ),

          FlatButton(
            child: Text("CANCEL"),
            onPressed: () {
              //Put your code here which you want to execute on Cancel button click.
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}*/

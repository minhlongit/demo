import 'package:flutter/material.dart';
import 'package:flutter_todo_app/constants/colors.dart';
import 'package:flutter_todo_app/widgets/todo_item.dart';

import 'package:flutter_todo_app/model/todo.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  final todosList = ToDo.todoList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: tdBGColor, // change background color full application
        appBar: _buildAppBar(),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(children: [
            searchBox(),
            Expanded(
              child: ListView(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 50, bottom: 20),
                    child: Text(
                      'All ToDos',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  for (ToDo todo in todosList) TodoItem(),
                ],
              ),
            ),
          ]),
        ));
  }

  AppBar _buildAppBar() {
    return AppBar(
        backgroundColor: tdBGColor,
        elevation: 0, // xoá box shadow
        title: Row(
          mainAxisAlignment:
              MainAxisAlignment.spaceBetween, // căn 2 cạnh menu và avatar
          children: [
            Icon(Icons.menu, color: tdBlack, size: 30), // icon menu
            Container(
              height: 40, // set height image avatar
              width: 40, // set width image avatar
              child: ClipRRect(
                child: Image.asset('assets/images/cat-avatar.jpeg'), // url ảnh
                borderRadius: BorderRadius.circular(50), // tạo border radius
              ),
            ),
          ],
        ));
  }

  Widget searchBox() {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: TextField(
          decoration: InputDecoration(
              contentPadding: EdgeInsets.all(0),
              prefixIcon: Icon(
                Icons.search,
                color: tdBlack,
                size: 20,
              ),
              prefixIconConstraints: BoxConstraints(
                maxHeight: 20,
                minWidth: 25,
              ),
              border: InputBorder.none, // xoá border input
              hintText: 'Search', // thêm placeholder
              hintStyle: TextStyle(color: tdGrey)), // color chữ
        ));
  }
}

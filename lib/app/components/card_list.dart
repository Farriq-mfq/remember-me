import "package:flutter/material.dart";
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:remember_me/app/components/detail_task.dart';
import 'package:remember_me/app/controllers/todo_controller.dart';
import 'package:remember_me/model/todo_response.dart';

class CardList extends StatefulWidget {
  const CardList({super.key, required this.todo});
  final TodoResponse todo;

  @override
  State<CardList> createState() => _CardListState();
}

class _CardListState extends State<CardList> {
  Color _getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Color(0xff8687E7);
    }
    return Color(0xffFFFFFF);
  }

  final todo_controller = Get.put(TodoController());

  bool isChecked = false;
  bool loadingCheck = false;

  @override
  void initState() {
    super.initState();
    isChecked = widget.todo.pinned == 0 ? false : true;
  }

  @override
  void dispose() {
    isChecked = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      color: Color(0xff363636),
      child: ListTile(
        onLongPress: () {
          Get.bottomSheet(
            DetailTask(
              todo: widget.todo,
            ),
            backgroundColor: Color(0xff363636),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            )),
            isDismissible: true,
          );
        },
        contentPadding: const EdgeInsets.all(12),
        title: Text(
          widget.todo.title,
          style: TextStyle(color: Color(0xffFFFFFF), fontSize: 16),
          maxLines: 1,
        ),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "${widget.todo.createdAt.day.toString()}/${widget.todo.createdAt.month.toString()}/${widget.todo.createdAt.year.toString()}",
              style: TextStyle(
                color: Color(0xffAFAFAF),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Color(int.parse(widget.todo.category.categoryColor))
                    .withAlpha(100),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  SvgPicture.network(
                    widget.todo.category.icon.iconUrl,
                    color: Color(int.parse(widget.todo.category.categoryColor)),
                  ),
                  SizedBox(
                    width: 3,
                  ),
                  Text(
                    widget.todo.category.categoryName,
                    style: TextStyle(color: Color(0xffFFFFFF), fontSize: 12),
                  ),
                ],
              ),
            )
          ],
        ),
        leading: loadingCheck
            ? SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  color: Color(0xff8687E7),
                ))
            : Checkbox(
                side: BorderSide(color: Color(0xFFFFFFFF), width: 1.5),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                checkColor: Color(0xff8687E7),
                fillColor: MaterialStateProperty.resolveWith(_getColor),
                value: isChecked,
                onChanged: (value) {
                  setState(() {
                    loadingCheck = true;
                  });
                  Future.delayed(
                    Duration(milliseconds: 500),
                    () {
                      todo_controller
                          .updateTodoStatus(widget.todo.id.toString())
                          .whenComplete(() {
                        setState(() {
                          isChecked = value!;
                          loadingCheck = false;
                        });
                        todo_controller
                            .fetchTask(todo_controller.selectedTab.value);
                      });
                    },
                  );
                },
              ),
      ),
    );
  }
}

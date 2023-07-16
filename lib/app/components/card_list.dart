import "package:flutter/material.dart";
import 'package:flutter_svg/flutter_svg.dart';
import 'package:remember_me/model/todo_response.dart';

class CardList extends StatefulWidget {
  const CardList({super.key, required this.todo});
  final Datum todo;

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

  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      color: Color(0xff363636),
      child: ListTile(
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
              "Today At 16:45",
              style: TextStyle(
                color: Color(0xffAFAFAF),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Color(0xff809CFF),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  SvgPicture.asset(
                    "assets/icons/flag.svg",
                    color: Color(0xffFFFFFF),
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
        leading: Checkbox(
          side: BorderSide(color: Color(0xFFFFFFFF), width: 1.5),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          checkColor: Color(0xff8687E7),
          fillColor: MaterialStateProperty.resolveWith(_getColor),
          value: isChecked,
          onChanged: (value) {
            setState(() {
              isChecked = value!;
            });
          },
        ),
      ),
    );
  }
}

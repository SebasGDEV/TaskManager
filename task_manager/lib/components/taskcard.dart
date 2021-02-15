import 'package:flutter/material.dart';
import 'package:task_manager/model/task.dart';

class TaskCard extends StatefulWidget {
  @required
  final bool isSelected;
  @required
  final Task task;

  const TaskCard(this.task, this.isSelected);

  @override
  _TaskCardState createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 8.0, right: 2.0, top: 8.0, bottom: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: (widget.isSelected) ? Colors.redAccent : Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  Text(widget.task.title),
                  Spacer(),
                  Text(widget.task.dueDate.toString())
                ],
              ),
              Text(
                widget.task.content,
                overflow: TextOverflow.ellipsis,
              ),
              Text('Stack de asignados'),
              Row(
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          Text('Progress 60%'),
                        ],
                      ),
                      Text('____________________'),
                    ],
                  ),
                  Spacer(),
                  Center(
                    child: FlatButton(
                      highlightColor: Color(0xfff9ba17),
                      child: Icon(Icons.check),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

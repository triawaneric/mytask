import 'package:flutter/material.dart';
import 'package:mytask/data/model/models.dart';
import 'package:mytask/presentation/shared/taks_menu_widget.dart';
import 'package:mytask/presentation/task/detail_task.dart';


import 'task_text_widget.dart';

class TaskCard extends StatelessWidget {
  final KTask task;
  final int columnIndex;
  final Function deleteItemHandler;
  final Function(DragUpdateDetails) dragListener;

  const TaskCard({
    super.key,
    required this.task,
    required this.columnIndex,
    required this.dragListener,
    required this.deleteItemHandler,
  });

  @override
  Widget build(BuildContext context) {
    Color _colorFromHex(String hexColor) {
      final hexCode = hexColor.replaceAll('#', '');
      return Color(int.parse('FF$hexCode', radix: 16));
    }

    return LayoutBuilder(
      builder: (BuildContext _, BoxConstraints constraints) {
        return InkWell(
          onTap: (){
            //Move to Detail
            print("data data"+columnIndex.toString());
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DetailTaskScreen(task: task!)),
            );
          },
            child:Container(
          height: 50,
          clipBehavior: Clip.hardEdge,
          margin: const EdgeInsets.symmetric(vertical: 6.0),

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.green[200],
          ),
          child: Draggable<KData>(
            onDragUpdate: dragListener,
            feedback: Material(
              color: Colors.red,
              borderRadius: BorderRadius.circular(10.0),
              child: Container(
                height: 50,
                width: constraints.maxWidth,
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 16),
                child: TaskText(
                  title: task.title,
                  dueDate: task.due_date,
                ),
              ),
            ),
            childWhenDragging: Container(color: Colors.black12),
            data: KData(from: columnIndex, task: task),
            child: Container(
              // color: _colorFromHex("#f0f6fe"),
              child: ListTile(
                dense: true,
                title: TaskText(
                  title: task.title,
                  dueDate: task.due_date,

                ),
                trailing: InkWell(
                  onTap: () => showModalBottomSheet(
                    context: context,
                    builder: (context) => TaskMenu(
                      deleteHandler: () => deleteItemHandler(columnIndex, task),
                    ),
                  ),
                  child: Icon(
                    color: Theme.of(context).hintColor,
                    Icons.more_horiz,
                  ),
                ),
              ),
            ),
          ),
            ),
        );
      },
    );
  }
}
import 'package:flutter/material.dart';
import 'package:mytask/presentation/shared/add_task_widget.dart';
import 'package:mytask/presentation/shared/column_widget.dart';


import 'package:mytask/utils/services/kanban_board_controller.dart';

import '../../data/model/models.dart';



class KanbanBoard extends StatefulWidget {
  final KanbanBoardController controller;
  final List<KColumn> columns;
  const KanbanBoard({
    super.key,
    required this.controller,
    required this.columns,
  });

  @override
  State<KanbanBoard> createState() => _KanbanBoardState();
}

class _KanbanBoardState extends State<KanbanBoard> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      controller: _scrollController,
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.all(16),
      itemCount: widget.columns.length,
      separatorBuilder: (_, __) => const SizedBox(width: 16),
      itemBuilder: (context, index) {
      return KanbanColumn(
            column: widget.columns[index],
            index: index,
            dragHandler: widget.controller.dragHandler,
            reorderHandler: widget.controller.handleReOrder,
            addTaskHandler: _showAddTask,
            dragListener: _dragListener,
            deleteItemHandler: widget.controller.deleteItem,
          );

      },
    );
  }


  void _showAddTask(int index) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      clipBehavior: Clip.hardEdge,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      builder: (context) => SingleChildScrollView(
        child: AddTaskForm(
          addTaskHandler: (
              String title,
              String due_date,
              String color,
              bool status
            ) {
            widget.controller.addTask(title,due_date,color, status, index);
          },
        ),
      ),
    );
  }

  void _dragListener(DragUpdateDetails details) {
    if (details.localPosition.dx > MediaQuery.of(context).size.width - 40) {
      _scrollController.jumpTo(_scrollController.offset + 10);
    } else if (details.localPosition.dx < 20) {
      _scrollController.jumpTo(_scrollController.offset - 10);
    }
  }
}
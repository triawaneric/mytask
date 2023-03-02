
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:mytask/bloc/auth/auth_bloc.dart';
import 'package:mytask/bloc/kanban/kanban_bloc.dart';
import 'package:mytask/presentation/shared/kanban_board.dart';
import 'package:mytask/presentation/shared/progress_indicator.dart';
import 'package:mytask/presentation/signin/sign_in_screen.dart';
import 'package:mytask/utils/services/kanban_board_controller.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


import '../../data/model/models.dart';


class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _DashboardState();

}

class _DashboardState  extends State<Dashboard>  implements KanbanBoardController {

  late AuthBloc authBloc;

  final taskController = TextEditingController();
  final startDateController = TextEditingController();
  final endDateController = TextEditingController();
  final startTimeController = TextEditingController();
  final endTimeController = TextEditingController();
  final colorController = TextEditingController();





  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    var appLoc = AppLocalizations.of(context)!;

    // Getting the user from the FirebaseAuth Instance

    return Scaffold(
      resizeToAvoidBottomInset : false,

      appBar: AppBar(
        title: Text(
          appLoc.appTitleDashboard,
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),

        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is UnAuthenticated) {
            // Navigate to the sign in screen when the user Signs Out
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => SignIn()),
                  (route) => false,
            );
          }
        },

        child: BlocBuilder<KanbanBloc, KanbanState>(
          builder: (context, state) {
            switch (state.status) {
              case Status.loading:
                return const Center(
                  child: CenteredProgressIndicator(),
                );
              case Status.loaded:
                if (state.columns.isNotEmpty) {
                  return KanbanBoard(
                    controller: this,
                    columns: state.columns,
                  );
                } else {
                  return const SizedBox.shrink();
                }
            }
          },
        ),
      ),


    );
  }




  @override
  void deleteItem(int columnIndex, KTask task) {
    context.read<KanbanBloc>().add(KanbanEvent.deleteTask(columnIndex, task));
  }

  @override
  void handleReOrder(int oldIndex, int newIndex, int column) {
    context
        .read<KanbanBloc>()
        .add(KanbanEvent.reorderTask(column, oldIndex, newIndex));
  }

  @override
  void dragHandler(KData data, int index) {
    context.read<KanbanBloc>().add(KanbanEvent.moveTask(data, index));
  }

  @override
  void addColumn(String title) {
    context.read<KanbanBloc>().add(KanbanEvent.addColumn(title));
  }

  @override
  void addTask(String title, String due_date, String color, bool status, int column) {
    context.read<KanbanBloc>().add(KanbanEvent.addTask(title,due_date, color, status,column));
  }

}

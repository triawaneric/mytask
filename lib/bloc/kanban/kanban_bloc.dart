import 'package:bloc/bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mytask/data/model/data.dart';
import 'package:mytask/utils/services/firestore_service.dart';


import '../../data/model/models.dart';
import 'kanban_event.dart';
import 'kanban_state.dart';

export 'kanban_event.dart';
export 'kanban_state.dart';

class KanbanBloc extends Bloc<KanbanEvent, KanbanState> {
  List<KColumn> columns = Data.getColumns();
  FireStoreService fireStoreService;

  KanbanBloc( this.fireStoreService) : super(KanbanState.initial()) {
    on<KanbanEvent>((event, emit) {
      final currentState = state.copyWith();
      emit(const KanbanState(status: Status.loading));
      event.when(
        getColumns: () => emit(
          currentState.copyWith(columns: columns, status: Status.loaded),
        ),
        addColumn: (title) {
          final updatedColumns = currentState.columns;
          updatedColumns.add(KColumn(
            title: title,
            children: List.of([]),
          ));
          emit(
            currentState.copyWith(
              columns: updatedColumns,
              status: Status.loaded,
            ),
          );
        },
        deleteTask: (column, task) {
          final updatedColumns = currentState.columns;
          updatedColumns[column].children.remove(task);
          emit(
            currentState.copyWith(
              columns: updatedColumns,
              status: Status.loaded,
            ),
          );
        },
        reorderTask: (column, from, to) {
          if (from != to) {
            final updatedColumns = currentState.columns;
            final task = columns[column].children[from];
            updatedColumns[column].children.remove(task);
            updatedColumns[column].children.insert(to, task);
            emit(
              currentState.copyWith(
                columns: updatedColumns,
                status: Status.loaded,
              ),
            );
          }
        },
        moveTask: (data, column) {
          final updatedColumns = currentState.columns;
          updatedColumns[data.from].children.remove(data.task);
          updatedColumns[column].children.add(
              KTask(
                title: data.task.title,
                due_date: data.task.due_date,
                color: data.task.color,
                status: data.task.status,
                lastIndex: column,
              )
          );
          emit(
            currentState.copyWith(
              columns: updatedColumns,
              status: Status.loaded,
            ),
          );
        },

        addTask: (title,due_date,color, status,column)  async{
          final updatedColumns = currentState.copyWith().columns;


          updatedColumns[column].children.add(
              KTask(
                  title: title,
                  due_date: due_date,
                  color: color,
                  status: status,
                  lastIndex: column
              ));
          final newState = state.copyWith(
              columns: List.of(updatedColumns), status: Status.loaded);
          emit(newState);
        },

        updateTask: (column, task) {
          final updatedColumns = currentState.columns;
          updatedColumns[column].children.add(task);
          emit(
            currentState.copyWith(
              columns: updatedColumns,
              status: Status.loaded,
            ),
          );
        },
      );
    });



  }




}
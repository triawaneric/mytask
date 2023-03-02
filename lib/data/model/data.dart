import 'models.dart';

class Data {
  static List<KColumn> getColumns() {
    return List.from([
      KColumn(
        title: 'To Do',
        children: [

        ],
      ),
      KColumn(
        title: 'In Progress',
        children: [

        ],
      ),
      KColumn(
        title: 'Done',
        children: [

        ],
      )
    ]);
  }
}
import 'package:flutter/material.dart';
import 'package:tugas_tabel/user.dart';
import 'package:tugas_tabel/users.dart';

class SortPage extends StatefulWidget {
  const SortPage({ Key? key }) : super(key: key);

  @override
  _SortPageState createState() => _SortPageState();
}

class _SortPageState extends State<SortPage> {
  late List<User> users;
  int? sortColumnIndex;
  bool isAscending = false;

  @override
  void initState() {
    super.initState();
    this.users = List.of(allUsers);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text('Data Tabel'),
      centerTitle: true,
      backgroundColor: Colors.blue,
    ),
    body: buildDataTabel(),
  );

  Widget buildDataTabel() {
    final columns = ['Nama', 'Pekerjaan', 'Age'];

    return ListView(
      children: [
        DataTable(
          sortAscending: isAscending,
          sortColumnIndex: sortColumnIndex,
          columns: getColumns(columns),
          rows: getRows(users),
        )
      ],
    );
  }

  List<DataColumn> getColumns(List<String> columns) => columns
    .map((String column) => DataColumn(
      label: Text(column, style: TextStyle(fontWeight: FontWeight.bold),),
      onSort: onSort,
    ))
    .toList();
    
  List<DataRow> getRows(List<User> users) => users
    .map((User user) {
      final cells = [user.name, user.job, user.age];
      return DataRow(cells: getCells(cells));
    }).toList();

  List<DataCell> getCells(List<dynamic> cells) => 
    cells.map((data) => DataCell(Text('$data'))).toList();

  void onSort(int columnIndex, bool ascending) {
    if (columnIndex == 0) {
      users.sort((user1, user2) => compareString(ascending, user1.name, user2.name));
    } else if (columnIndex == 1) {
      users.sort((user1, user2) => compareString(ascending, user1.job, user2.job));
    } else if (columnIndex == 2) {
      users.sort((user1, user2) => compareString(ascending, '${user1.age}', '${user2.age}'));
    }

    setState(() {
      this.sortColumnIndex = columnIndex;
      this.isAscending = ascending;
    });
  }

  int compareString(bool ascending, String value1, String value2) =>
    ascending ? value1.compareTo(value2) : value2.compareTo(value1);

    
  
}
import 'package:flutter/material.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FragrancesPage extends StatefulWidget {
  const FragrancesPage({super.key});

  @override
  State<FragrancesPage> createState() => _FragrancesPageState();
}

class _FragrancesPageState extends State<FragrancesPage> {
  PlutoGridStateManager? stateManager;

  final List<PlutoColumn> columns = [
    PlutoColumn(
      title: 'Id',
      field: 'id',
      type: PlutoColumnType.text(),
    ),
    PlutoColumn(
      title: 'Nombre',
      field: 'name',
      type: PlutoColumnType.text(),
    ),
    PlutoColumn(
      title: 'Email',
      field: 'email',
      type: PlutoColumnType.text(),
    ),
    PlutoColumn(
      title: 'Status',
      field: 'status',
      type: PlutoColumnType.number(),
    ),
  ];
  final List<PlutoRow> rows = [];

  final List<PlutoColumn> columns2 = [];
  final List<PlutoRow> rows2 = [];

  @override
  void initState() {
    super.initState();
    context.read<FragrancesBloc>().add(GetFragrances());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfumes'),
      ),

      body: BlocBuilder<FragrancesBloc, FragrancesState>(
        builder: (context, state) {
          if(state is GettingUsers) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if(state is UserTable) {
            rows.clear();
            for(var element in state.users) {
              rows.add(
                PlutoRow(
                  cells: {
                    'id': PlutoCell(value: element.id),
                    'name': PlutoCell(value: element.name),
                    'email': PlutoCell(value: element.email),
                    'status': PlutoCell(value: element.status),
                    //'options': PlutoCell(value: ''),
                  },
                ),
              );
            }

            PlutoGridStateManager.initializeRowsAsync(
              columns,
              rows,
            ).then((value) {
              //stateManager!.refRows.addAll(FilteredList(initialList: value));
              stateManager!.notifyListeners();
            });

            return Container(
              padding: const EdgeInsets.all(15),

              child: PlutoGrid(
                columns: columns,
                rows: rows,

                onLoaded: (PlutoGridOnLoadedEvent event) => stateManager = event.stateManager,

                onRowDoubleTap: (PlutoGridOnRowDoubleTapEvent event) {
                  User user = User(
                    id: event.row.toJson()['id'],
                    name: event.row.toJson()['name'],
                    email: event.row.toJson()['email'],
                    status: event.row.toJson()['status'],
                  );

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => UserPage(user: user)),
                  );
                },
              ),
            );
          } else if(state is ErrorGettingUsers) {
            return Center(
              child: Text(state.message, style: const TextStyle(color: Colors.red)),
            );
          } else {
            return Container();
          }
        },
      ),

      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,

        children: [
          FloatingActionButton(
            child: const Icon(Icons.delete),

            onPressed: () {
              if(stateManager!.currentRow != null) {
                context.read<UsersBloc>().add(PressDeleteUserButton(id: stateManager!.currentRow!.toJson()['id']));
                context.read<UsersBloc>().add(GetUsers());
              }
            },
          ),

          SizedBox(height: 10),

          FloatingActionButton(
            child: const Icon(Icons.add),

            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const UserPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
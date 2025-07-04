import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/blocs/home/homebloc.dart';
import 'package:todoapp/blocs/home/homeevent.dart';
import 'package:todoapp/blocs/home/homestate.dart';
import 'package:todoapp/ui/addtaskscreen.dart';
import 'package:todoapp/ui/settingscreen.dart';
import 'package:todoapp/utils/constants.dart';
import 'package:todoapp/utils/databasehelper.dart';
import 'package:todoapp/utils/widgets/customtext.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(db: DatabaseHelper.instance),
      child: MaterialApp(
        title: 'Todo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const MyHomePage(title: 'Todo'),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    context.read<HomeBloc>().add(LoadTask());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Settingscreen()),
              );
            },
            child: Icon(Icons.settings),
          ),
        ],
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is HomeLoaded) {
            return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(
                    state.items?[index].title ?? "",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Customtext(text: state.items?[index].priority ?? ""),
                      Customtext(text: state.items?[index].category ?? ""),
                      Customtext(
                        text: state.items?[index].time.toString() ?? "",
                      ),
                    ],
                  ),
                );
              },
              itemCount: state.items?.length,
            );
          } else {
            return Center(child: Text("No Data Found"));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Addtaskscreen()),
          );
        },
        tooltip: Constants.addTask,
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

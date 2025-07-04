import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/blocs/home/homebloc.dart';
import 'package:todoapp/blocs/home/homeevent.dart';
import 'package:todoapp/models/taskmodel.dart';
import 'package:todoapp/utils/constants.dart';
import 'package:todoapp/utils/widgets/custombutton.dart';
import 'package:todoapp/utils/widgets/customtext.dart';

class Addtaskscreen extends StatefulWidget {
  const Addtaskscreen({super.key});

  @override
  State<Addtaskscreen> createState() => _AddtaskscreenState();
}

class _AddtaskscreenState extends State<Addtaskscreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController minutesController = TextEditingController();
  ValueNotifier<String> initpriority = ValueNotifier("High");
  ValueNotifier<String> initcategory = ValueNotifier("Work");

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text("Add Task"),
        ),
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 15,
            children: [
              TextFormField(
                controller: titleController,
                decoration: InputDecoration(
                  label: Text(Constants.titleHelp),
                  hintText: Constants.titleHelp,
                ),
              ),
              Customtext(text: Constants.priority),
              ValueListenableBuilder(
                valueListenable: initpriority,
                builder: (context, val, child) {
                  return DropdownButtonFormField(
                    value: val,
                    items:
                        ["High", "Medium", "Low"]
                            .map(
                              (p) => DropdownMenuItem(value: p, child: Text(p)),
                            )
                            .toList(),
                    onChanged: (sele) {
                      initpriority.value = sele!;
                    },
                  );
                },
              ),
              Customtext(text: Constants.category),
              ValueListenableBuilder(
                valueListenable: initcategory,
                builder: (context, val, child) {
                  return DropdownButtonFormField(
                    value: val,
                    items:
                        ["Work", "Personal", "Health"]
                            .map(
                              (p) => DropdownMenuItem(value: p, child: Text(p)),
                            )
                            .toList(),
                    onChanged: (sele) {
                      initcategory.value = sele!;
                    },
                  );
                },
              ),
              TextFormField(
                controller: minutesController,
                decoration: InputDecoration(
                  label: Text(Constants.time),
                  hintText: Constants.time,
                ),
                keyboardType: TextInputType.number,
              ),
              Center(child: Custombutton(text: Constants.submit, voidCallback: submit)),
            ],
          ),
        ),
      ),
    );
  }

  void submit() {
    final taskModel = TaskModel();
    taskModel.title = titleController.text.toString();
    taskModel.priority = initpriority.value;
    taskModel.category = initcategory.value;
    taskModel.time = int.parse(minutesController.text);

    context.read<HomeBloc>().add(AddTask(taskModel: taskModel));
    Navigator.pop(context);
  }
}

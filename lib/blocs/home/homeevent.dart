import 'package:todoapp/models/taskmodel.dart';

abstract class HomeEvent{}

class LoadTask extends HomeEvent{}

class AddTask extends HomeEvent{
  final TaskModel taskModel;
  AddTask({required this.taskModel});
}

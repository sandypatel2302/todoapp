import 'package:todoapp/models/taskmodel.dart';

abstract class HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  List<TaskModel>? items;

  HomeLoaded({this.items});
}

class HomeFail extends HomeState {}

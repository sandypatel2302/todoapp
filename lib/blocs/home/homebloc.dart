
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/blocs/home/homeevent.dart';
import 'package:todoapp/blocs/home/homestate.dart';
import 'package:todoapp/utils/databasehelper.dart';

class HomeBloc extends Bloc<HomeEvent,HomeState> {
  final DatabaseHelper db;
  HomeBloc({required this.db}) :super(HomeLoading()){
    on<LoadTask>((event,emit) async {
      final items = await db.getTaskItems();
      emit(HomeLoaded(items: items));
    });

    on<AddTask>((event,emit) async {
      await db.saveTask(event.taskModel.title!, event.taskModel.priority!, event.taskModel.category!, event.taskModel.time!);
      final items = await db.getTaskItems();
      emit(HomeLoaded(items: items));
    });
  }

}


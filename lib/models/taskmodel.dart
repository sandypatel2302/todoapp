
class TaskModel{
  int? id;
  String? title;
  String? priority;
  String? category;
  int? time;

  TaskModel({this.id,this.title,this.priority,this.category,this.time, });
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'priority' : priority,
      'category': category,
      'time' : time,
    };
  }

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
        id: map['id'],
        title: map['title'],
        priority : map['priority'],
        category: map['category'],
        time: map['time']
    );
  }

}
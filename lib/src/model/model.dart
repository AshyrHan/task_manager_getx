import 'package:json_annotation/json_annotation.dart';

part 'model.g.dart';

@JsonSerializable(explicitToJson: true)
class Category {
  Category({
    this.name,
    this.color,
    this.todo,
  });

  String name;
  String color;
  List<Todo> todo;

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}

@JsonSerializable()
class Todo {
  String name;
  String descrip;
  bool isDone;
  //Color color;
  //int category;
  String dateTime;

  Todo({
    this.name,
    this.descrip,
    this.isDone = false,
    // this.color,
    // this.category,
    this.dateTime,
  });

  factory Todo.fromJson(Map<String, dynamic> json) => _$TodoFromJson(json);

  Map<String, dynamic> toJson() => _$TodoToJson(this);
}

////////
//////////
///////////
//////////
///
///
///
///
///
///
///
///
///
///
///
///
///
///
///
///

// class Todo {
//   String name;
//   String descrip;
//   bool isDone;
//   //Color color;
//   int category;
//   String dateTime;

//   Todo({
//     this.name,
//     this.descrip,
//     this.isDone = false,
//     // this.color,
//     this.category,
//     this.dateTime,
//   });

//   factory Todo.fromJson(Map<String, dynamic> json) => Todo(
//         name: json['name'] as String,
//         descrip: json['descrip'] as String,
//         isDone: json['isDone'] as bool,
//         // color: json['color'] as Color,
//         category: json['category'] as int,
//         dateTime: json['dateTime'] as String,
//       );

//   Map<String, dynamic> toJson() => {
//         'name': name,
//         'descrip': descrip,
//         'isDone': isDone,
//         //   'color': color,
//         'category': category,
//         'dateTime': dateTime,
//       };
// }

// class Category {
//   String name;
//   Color color;
//   Category({this.name, this.color});

//   factory Category.fromJson(Map<String, dynamic> json) => Category(
//         name: json['name'] as String,
//         color: json['color'] as Color,
//       );

//   Map<String, dynamic> toJson() => {
//         'name': name,
//         'color': color,
//       };
// }

// List<Category> categoryList = [
//   Category(name: 'Common', color: Colors.red),
//   Category(name: 'Business', color: Colors.red),
//   Category(name: 'Personal', color: Colors.red),
//   Category(name: 'Family', color: Colors.red),
// ];

// class Category {
//   String name;
//   Color color;
//   List<Todo> todo;
//   Category({this.name, this.color, this.todo});

//   factory Category.fromJson(dynamic json) {
//     var todoObjsJson = json['todo'] as List;
//     List<Todo> _todo =
//         todoObjsJson.map((todoJson) => Todo.fromJson(todoJson)).toList();

//     return Category(
//         name: json['name'] as String,
//         color: json['color'] as Color,
//         todo: _todo);
//   }
//   // Map<String, dynamic> toJson() {
//   //    return ('name': name, 'color': color, 'todo': todo);}

//   Map<String, dynamic> toJson() {
//     List<Map> todos =
//         this.todo != null ? this.todo.map((e) => e.toJson()).toList() : null;
//     return {
//       'name': name,
//       'color': color,
//       'todo': todos,
//     };
//   }
// }

// class Category {
//   Category({
//     this.name,
//     this.color,
//     this.todo,
//   });

//   final String name;
//   final String color;
//   final List<Todo> todo;

//   // factory Category.fromRawJson(String str) => Category.fromJson(json.decode(str));

//   // String toRawJson() => json.encode(toJson());

//   factory Category.fromJson(Map<String, dynamic> json) => Category(
//         name: json["name"],
//         color: json["color"],
//         todo: List<Todo>.from(json["todo"].map((x) => Todo.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "name": name,
//         "color": color,
//         "todo": List<dynamic>.from(todo.map((x) => x.toJson())),
//       };
// }

// Map toJson() {
//     List<Map> details = this.details != null ? this.details.map((i)=> i.toJson()).toList() : null;
//     return {
//       'name': name,
//       'Category': category,
//       'status': status,
//       'desc': desc,
//       'details': details
//     };
//   }
// class Category {
//   String name;
//   Color color;
//   List<Todo> todo;
//   Category({this.name, this.color, this.todo});

//   factory Category.fromJson(dynamic json) {
//     // var todoObjsJson = json['todo'] as List;
//     // List<Todo> _todo =
//     //     todoObjsJson.map((todoJson) => Todo.fromJson(todoJson)).toList();

//     return Category(
//         name: json['name'] as String,
//         color: json['color'] as Color,
//         todo: json['todo'] as List);
//   }
//   Map<String, dynamic> toJson() => {'name': name, 'color': color, 'todo': todo};
// }
// class Tutorial {
//   String title;
//   String description;
//   User author;
//   List<Tag> tags;

//   Tutorial(this.title, this.description, this.author, [this.tags]);

//   factory Tutorial.fromJson(dynamic json) {
//     if (json['tags'] != null) {
//       var tagObjsJson = json['tags'] as List;
//       List<Tag> _tags = tagObjsJson.map((tagJson) => Tag.fromJson(tagJson)).toList();

//       return Tutorial(
//         json['title'] as String,
//         json['description'] as String,
//         User.fromJson(json['author']),
//         _tags
//       );
//     } else {
//       return Tutorial(
//         json['title'] as String,
//         json['description'] as String,
//         User.fromJson(json['author'])
//       );
//     }
//   }

// class Todo {
//   String name;
//   String descrip;
//   bool isDone;
//   Color color;
//   int category;
//   String dateTime;

//   Todo({
//     this.name,
//     this.descrip,
//     this.isDone = false,
//     this.color,
//     this.category,
//     this.dateTime,
//   });

//   factory Todo.fromJson(Map<String, dynamic> json) => Todo(
//         name: json['name'] as String,
//         descrip: json['descrip'] as String,
//         isDone: json['isDone'] as bool,
//         color: json['color'] as Color,
//         category: json['category'] as int,
//         dateTime: json['dateTime'] as String,
//       );

//   Map<String, dynamic> toJson() => {
//         'name': name,
//         'descrip': descrip,
//         'isDone': isDone,
//         'color': color,
//         'category': category,
//         'dateTime': dateTime,
//       };
// }

// class Category {
//   String name;
//   Color color;
//   List<Todo> todo;
//   Category({this.name, this.color, this.todo});

//   factory Category.fromJson(dynamic json) {
//     var todoObjsJson = json['todo'] as List;
//     List<Todo> _todo =
//         todoObjsJson.map((todoJson) => Todo.fromJson(todoJson)).toList();

//     return Category(
//         name: json['name'] as String,
//         color: json['color'] as Color,
//         todo: _todo);
//   }
//   Map<String, dynamic> toJson() => {'name': name, 'color': color, 'todo': todo};
// }

/// userId : 1
/// id : 1
/// title : "delectus aut autem"
/// completed : false

class TodoModel {
  int _userId;
  int _id;
  String _title;
  bool _completed;

  int get userId => _userId;
  int get id => _id;
  String get title => _title;
  bool get completed => _completed;

  TodoModel(this._userId, this._id, this._title, this._completed);


  TodoModel.map(dynamic obj) {
    _userId = obj["userId"];
    _id = obj["id"];
    _title = obj["title"];
    _completed = obj["completed"];
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    map["userId"] = _userId;
    map["id"] = _id;
    map["title"] = _title;
    map["completed"] = _completed;
    return map;
  }

}
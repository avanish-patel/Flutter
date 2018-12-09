// model class
class Note {
  // data entities
  int _id;
  String _title;
  String _description;
  String _date;

  // constructors
  Note(this._title, this._date, [this._description]);

  Note.withId(this._id, this._title, this._date, [this._description]);

  // getters and setters
  String get date => _date;

  set date(String value) {
    _date = value;
  }

  String get description => _description;

  set description(String value) {
    _description = value;
  }

  String get title => _title;

  set title(String value) {
    if (value.length <= 250) {
      _title = value;
    }
  }

  int get id => _id;

  // Map in order to map values into DB
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (_id != null) {
      map['id'] = _id;
    }
    map['title'] = _title;
    map['description'] = _description;
    map['date'] = _date;

    return map;
  }

  // Extract values form map
  Note.fromMapObject(Map<String, dynamic> map) {
    this._id = map['id'];
    this._title = map['title'];
    this._description = map['description'];
    this._date = map['date'];
  }

}
class Employee {
  String? key;
  String? name;
  int? age;
  int? since;
  bool? isActive;

  Employee(this.key, this.name, this.age, this.since, this.isActive);

  Employee.fromMap(Map<dynamic, dynamic> map, String dbkey) {
    key = dbkey;
    name = map['name'];
    age = map['age'];
    since = map['since'];
    isActive = map['isActive'];
  }
}

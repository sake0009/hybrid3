import 'dart:convert';
import 'package:hybrid3/hybrid3.dart' as hybrid3;

String jsonString = '''
[
  {"first":"Steve", "last":"Griffith", "email":"griffis@algonquincollege.com"},
  {"first":"Adesh", "last":"Shah", "email":"shaha@algonquincollege.com"},
  {"first":"Tony", "last":"Davidson", "email":"davidst@algonquincollege.com"},
  {"first":"Adam", "last":"Robillard", "email":"robilla@algonquincollege.com"},
  {"first":"Buck", "last":"Rogers", "age":"30", "email":"robilla@algonquincollege.com"}
]
''';

List<Map<String, String>> parseJsonToMapList(String jsonString) {
  return (json.decode(jsonString) as List)
      .map((item) => (item as Map<String, dynamic>)
          .map((key, value) => MapEntry(key, value.toString()))
          .cast<String, String>())
      .toList();
}

void main() {
  var mapList = parseJsonToMapList(jsonString);

  var students = hybrid3.Students(mapList);
  students.sort('first');
  students.plus({
    'first': 'John',
    'last': 'Doe',
    "age": "29",
    'email': 'john.doe@mail.com'
  });
  students.remove('age');
  students.output();
}

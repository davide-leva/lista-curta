import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lista/costants.dart';

class Group {
  Group({
    required this.id,
    required this.title,
    required this.numberOfPeople,
    required this.people,
  });

  String id;
  String title;
  int numberOfPeople;
  List<Person> people;

  factory Group.fromJson(Map<String, dynamic> data) {
    return Group(
      id: data['_id'],
      title: data['title'],
      numberOfPeople: data['numberOfPeople'],
      people: (data['people'] as List)
          .map((json) => Person.fromJson(jsonDecode(json)))
          .toList(),
    );
  }
}

class Party {
  Party({
    required this.id,
    required this.tag,
    required this.title,
    required this.balance,
    required this.date,
  });

  String id;
  String tag;
  String title;
  int balance;
  DateTime date;

  factory Party.fromJson(dynamic data) {
    return Party(
      id: data['_id'],
      tag: data['tag'],
      title: data['title'],
      balance: data['balance'].round(),
      date: DateTime.parse(data['date']),
    );
  }

  int compateTo(Party other) {
    return -date.compareTo(other.date);
  }
}

class Person {
  Person({
    required this.name,
    required this.hasEntered,
    required this.hasPaid,
    required this.discout,
  });

  String name;
  bool hasEntered;
  bool hasPaid;
  double discout;

  factory Person.fromJson(Map<String, dynamic> data) {
    return Person(
      name: data['name'],
      hasEntered: data['hasEntered'],
      hasPaid: data['hasPaid'],
      discout: data['discout'] ?? 0,
    );
  }
}

class Data {
  static final Map<String, String> _headers = {
    'device': kDevice,
    'key': kKey,
    'Content-Type': 'application/json',
  };

  static int totalPeople = 0;
  static late List<Group> groups;
  static late DateTime partyDate;
  static late String partyName;

  static Future<String> get() async {
    http.Response responseParties = await http.get(
      Uri.parse('https://$kEndpoint/main:parties/'),
      headers: _headers,
    );

    List<Party> parties = (jsonDecode(responseParties.body) as List)
        .map((e) => Party.fromJson((e as Map<String, dynamic>)))
        .toList();

    parties.sort((a, b) => a.compateTo(b));
    partyName = parties[0].title;
    partyDate = parties[0].date;

    http.Response responseGroups = await http.get(
      Uri.parse('https://$kEndpoint/${parties[0].tag}:groups/'),
      headers: _headers,
    );

    groups = (jsonDecode(responseGroups.body) as List)
        .map((e) => Group.fromJson(e as Map<String, dynamic>))
        .where((group) => group.numberOfPeople > 0)
        .toList();

    totalPeople = 0;
    groups.forEach((group) {
      List<Person> people = group.people;
      people.sort((a, b) => a.name.compareTo(b.name));
      group.people = people;
      totalPeople += group.numberOfPeople;
    });

    groups.sort((a, b) => a.title.compareTo(b.title));

    return "connesso";
  }
}

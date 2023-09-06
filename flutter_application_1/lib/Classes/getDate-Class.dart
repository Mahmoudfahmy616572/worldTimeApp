// ignore_for_file: file_names, non_constant_identifier_names, unused_local_variable
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:http/http.dart';

class AllCountries {
  final String Flag;
  final String CountryName;
  final String link;
  AllCountries({
    required this.Flag,
    required this.CountryName,
    required this.link,
  });
  late bool isDayTime;
  late String TimeNow;
  late String country;
  late int offset;
  late DateTime RealTime;

  getData() async {
    Response response =
        await get(Uri.parse("http://worldtimeapi.org/api/timezone/$link"));
    Map receivedDateFromApi = jsonDecode(response.body);
    DateTime dateTime = DateTime.parse(receivedDateFromApi["utc_datetime"]);

    int offset = int.parse(receivedDateFromApi["utc_offset"].substring(0, 3));
    DateTime RealTime = dateTime.add(Duration(hours: offset));
    

    if (RealTime.hour > 5 && RealTime.hour < 18) {
      isDayTime = true;
    } else {
      isDayTime = false;
    }
    TimeNow = DateFormat.jm().format(RealTime);
    country = receivedDateFromApi["timezone"];
  }
}

// ignore_for_file: use_build_context_synchronously, unused_local_variable, non_constant_identifier_names
import 'package:flutter_application_1/Classes/getDate-Class.dart';
import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  Map receivedDateFromApi = {};

  List<AllCountries> allCountries = [
    AllCountries(
        link: 'Africa/Cairo', CountryName: 'Egypt - Cairo', Flag: 'egypt.png'),
    AllCountries(
        link: 'Africa/Tunis',
        CountryName: 'Tunisia - Tunis',
        Flag: 'tunisia.jpg'),
    AllCountries(
        link: 'Africa/Algiers',
        CountryName: 'Algeria - Algiers',
        Flag: 'algeria.jpg'),
    AllCountries(
        link: 'Australia/Sydney',
        CountryName: 'Australia - Sydney',
        Flag: 'australia.png'),
    AllCountries(
        link: 'America/Toronto',
        CountryName: 'Canada - Toronto',
        Flag: 'canada.png'),
    AllCountries(
        link: 'Asia/Riyadh',
        CountryName: '	Saudi Arabia - Riyadh',
        Flag: 'sa.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.blue,
          body: SizedBox(
              child: ListView.builder(
                  padding: const EdgeInsets.all(10),
                  itemCount: allCountries.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: ListTile(
                        onTap: () async {
                          AllCountries onClickCountries = allCountries[index];
                          await onClickCountries.getData();
                          Navigator.pop(context, {
                            "time": onClickCountries.TimeNow,
                            "country": onClickCountries.country,
                            "isDayTime": onClickCountries.isDayTime
                          });
                        },
                        leading: CircleAvatar(
                          backgroundImage:
                              AssetImage("assets/${allCountries[index].Flag}"),
                        ),
                        title: Text(
                          allCountries[index].CountryName,
                          style: const TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                      ),
                    );
                  }))),
    );
  }
}

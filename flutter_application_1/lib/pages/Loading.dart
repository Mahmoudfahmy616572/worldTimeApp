// ignore_for_file: file_names, use_build_context_synchronously, unused_local_variable, non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Classes/getDate-Class.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  late bool isDayTime;
  Map receivedDateFromApi = {};
  getDataInLoadinPage() async {
    AllCountries Countries =
        AllCountries(Flag: "egy", CountryName: "Egypt", link: "Africa/Cairo");
    await Countries.getData();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      "time": Countries.TimeNow,
      "country": Countries.country,
      "isDayTime": Countries.isDayTime
    });
  }

  @override
  void initState() {
    getDataInLoadinPage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            SpinKitDualRing(
              lineWidth: 22,
              color: Colors.black,
              size: 50.0,
            ),
          ],
        ),
      )),
    );
  }
}

// ignore_for_file: file_names

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map datachoosefromLocation = {};
  dynamic result;
  @override
  Widget build(BuildContext context) {
    datachoosefromLocation = datachoosefromLocation.isEmpty
        ? ModalRoute.of(context)!.settings.arguments as Map
        : datachoosefromLocation;

    String bgImage =
        datachoosefromLocation["isDayTime"] ? "morning.jpg" : "night.jpg";

    return Scaffold(
      body: SafeArea(
          child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  "assets/$bgImage",
                ),
                fit: BoxFit.cover)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                  onPressed: () async {
                    result =
                        await Navigator.pushNamed(context, "/chooseLocation");

                    setState(() {
                      if (result == null) {
                        datachoosefromLocation = {
                          "time": "...",
                          "country": "pls choose location",
                          "isDayTime": false
                        };
                      } else {
                        datachoosefromLocation = {
                          "time": result["time"],
                          "country": result["country"],
                          "isDayTime": result["isDayTime"]
                        };
                      }
                    });
                  },
                  icon: const Icon(
                    Icons.edit_location,
                    size: 27.0,
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          const Color.fromARGB(198, 3, 40, 176)),
                      padding:
                          MaterialStateProperty.all(const EdgeInsets.all(22)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)))),
                  label: const Text(
                    "Edit Location",
                    style: TextStyle(fontSize: 19),
                  )),
              const SizedBox(
                height: 300,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 0, vertical: 30),
                width: double.infinity,
                color: const Color.fromARGB(103, 0, 0, 0),
                child: Column(
                  children: [
                    Text(
                      datachoosefromLocation["time"],
                      style: const TextStyle(
                          fontSize: 33,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                    Text(
                      datachoosefromLocation["country"],
                      style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}

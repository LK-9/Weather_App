import 'package:flutter/material.dart';
import 'package:weather/services/location.dart';
import 'package:http/http.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    print(location.latitude);
    print(location.longitude);
  }

  // void getData(){
  //   get(url)
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FilledButton(
          onPressed: () {
            // Manually trigger location fetch
            getLocation();
          },
          child: const Text('Get Location'),
        ),
      ),
    );
  }
}

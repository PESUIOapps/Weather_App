// // views/weather_view.dart
// import 'package:flutter/material.dart';
// import '../controllers/weather_controller.dart';
// import '../models/weather_model.dart';

// class WeatherScreen extends StatefulWidget {
//   final WeatherController controller;

//   WeatherScreen({required this.controller});

//   @override
//   _WeatherScreenState createState() => _WeatherScreenState();
// }

// class _WeatherScreenState extends State<WeatherScreen> {
//   final TextEditingController cityController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Weather App (MVC)'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             TextField(
//               controller: cityController,
//               decoration: InputDecoration(labelText: 'Enter city name'),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 final city = cityController.text.trim();
//                 if (city.isNotEmpty) {
//                   widget.controller.fetchWeatherData(city);
//                   setState(() {}); // Update the UI
//                 }
//               },
//               child: Text('Get Weather'),
//             ),
//             if (widget.controller.weatherModel.cityName.isNotEmpty)
//               Column(
//                 children: [
//                   SizedBox(height: 20),
//                   Text(
//                     'City: ${widget.controller.weatherModel.cityName}',
//                     style: TextStyle(fontSize: 20),
//                   ),
//                   SizedBox(height: 10),
//                   Text(
//                     'Temperature: ${widget.controller.weatherModel.temperature}',
//                     style: TextStyle(fontSize: 20),
//                   ),
//                   SizedBox(height: 10),
//                   Image.network(
//                     widget.controller.weatherModel.iconUrl,
//                     height: 100,
//                   ),
//                 ],
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import '../controllers/weather_controller.dart';
import '../models/weather_model.dart';

class WeatherScreen extends StatefulWidget {
  final WeatherController controller;

  WeatherScreen({required this.controller});

  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final TextEditingController cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Weather App',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.lightBlueAccent],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (widget.controller.weatherModel.cityName.isNotEmpty)
              Column(
                children: [
                  Image.network(
                    widget.controller.weatherModel.iconUrl,
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    'City: ${widget.controller.weatherModel.cityName}',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Temperature: ${widget.controller.weatherModel.temperature}',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(height: 16.0),
                ],
              ),
            TextField(
              controller: cityController,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'Enter city name',
                labelStyle: TextStyle(color: Colors.white),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                final city = cityController.text.trim();
                if (city.isNotEmpty) {
                  widget.controller.fetchWeatherData(city);
                  setState(() {}); // Update the UI
                }
              },
              child: Text(
                'Get Weather',
                style: TextStyle(fontSize: 18),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                onPrimary: Colors.blue,
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

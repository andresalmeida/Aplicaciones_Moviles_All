import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:web_socket_channel/io.dart';
import 'package:shake/shake.dart';
import 'dart:async';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late IOWebSocketChannel channel;
  late ShakeDetector detector;
  DateTime? lastGyroEvent;
  double _lightPosition = 0.0;

  @override
  void initState() {
    super.initState();

    channel = IOWebSocketChannel.connect('ws://172.20.10.6:8080');

    detector = ShakeDetector.autoStart(
      onPhoneShake: () {
        channel.sink.add('whatsapp');
      },
      minimumShakeCount: 4,
      shakeSlopTimeMS: 600,
      shakeThresholdGravity: 3.0,
    );

    gyroscopeEvents.listen((GyroscopeEvent event) {
      if (lastGyroEvent == null ||
          DateTime.now().difference(lastGyroEvent!) >
              Duration(milliseconds: 1200)) {
        if (event.y.abs() > 2.5) {
          setState(() {
            _lightPosition = event.y.clamp(-1.0, 1.0);
          });
          if (event.y > 2.5) {
            channel.sink.add('web');
          } else if (event.y < -2.5) {
            channel.sink.add('spreadsheet');
          }
          lastGyroEvent = DateTime.now();
        }
      }
    });
  }

  @override
  void dispose() {
    detector.stopListening();
    channel.sink.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 250,
          height: 250,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.black,
            border: Border.all(
              color: Colors.green.withOpacity(0.3),
              width: 10,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.green.withOpacity(0.5),
                blurRadius: 20,
                spreadRadius: 5,
              ),
            ],
          ),
          child: Stack(
            children: [
              Center(
                child: Text(
                  'GIROSCOPIO',
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Positioned(
                left: 125 + (_lightPosition * 100),
                top: 0,
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.green,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.green,
                        blurRadius: 10,
                        spreadRadius: 5,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

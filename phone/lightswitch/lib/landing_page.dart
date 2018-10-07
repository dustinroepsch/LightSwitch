import 'dart:typed_data';

import 'package:fixnum/fixnum.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'dart:async';
import 'LightSwitchData.pb.dart';
import 'package:quiver/iterables.dart';

class LandingPage extends StatefulWidget {
  final BluetoothDevice device;
  LandingPage({Key key, @required this.device}) : super(key: key);
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  BluetoothDeviceState btState = BluetoothDeviceState.disconnected;
  FlutterBlue _flutterBlue = FlutterBlue.instance;
  StreamSubscription deviceConnection;
  List<BluetoothService> _services = [];
  bool turnLightOn = true;

  @override
  void initState() {
    super.initState();
    deviceConnection = _flutterBlue
        .connect(widget.device, timeout: const Duration(seconds: 4))
        .listen(
          null,
          onDone: _disconnect,
        );

    widget.device.onStateChanged().listen((s) {
      setState(() {
        btState = s;
      });
      _flutterBlue.connect(widget.device);
      widget.device.discoverServices().then((s) {
        setState(() {
          _services = s;
        });
      });
    });
  }

  _disconnect() {
    // Remove all value changed listeners
    // valueChangedSubscriptions.forEach((uuid, sub) => sub.cancel());
    // valueChangedSubscriptions.clear();
    // deviceStateSubscription?.cancel();
    // deviceStateSubscription = null;
    deviceConnection?.cancel();
    deviceConnection = null;
  }

  Future<Null> writeWriteChar(int d) {
    BluetoothCharacteristic writeChar;
    _services.forEach((service) {
      if (service.uuid == Guid("df430000-caf7-4a3c-a9c4-4549cbf100fb")) {
        service.characteristics.forEach((c) {
          if (c.uuid == Guid("df430003-caf7-4a3c-a9c4-4549cbf100fb")) {
            writeChar = c;
          }
        });
      }
    });
    Future<Null> f = widget.device.writeCharacteristic(writeChar, [d],
        type: CharacteristicWriteType.withResponse);

    return f;
  }

  Future<Null> writeDataChar(LightSwitchState data) {
    BluetoothCharacteristic dataChar;
    _services.forEach((service) {
      if (service.uuid == Guid("df430000-caf7-4a3c-a9c4-4549cbf100fb")) {
        service.characteristics.forEach((c) {
          if (c.uuid == Guid("df430001-caf7-4a3c-a9c4-4549cbf100fb")) {
            dataChar = c;
          }
        });
      }
    });
    Uint8List buffer = data.writeToBuffer();
    print('---------------------------------');
    print(buffer);
    var f = widget.device.writeCharacteristic(dataChar, [buffer[0]]);
    for (int i = 1; i < buffer.length; i++) {
      f = f.then((Null n) {
        return widget.device.writeCharacteristic(dataChar, [buffer[i]],
            type: CharacteristicWriteType.withResponse);
      });
    }
    return f;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: const Text("Light Switch"),
      ),
      body: Column(
        children: <Widget>[
          Padding(
              padding: EdgeInsets.all(15.0),
              child: Center(
                  child: SizedBox(
                      width: 300.0,
                      height: 300.0,
                      child: FloatingActionButton(
                        child: Icon(
                          turnLightOn ? Icons.language: Icons.lightbulb_outline,
                          size: 250.0,
                        ),
                        onPressed: _services.length > 0
                            ? () {
                                LightSwitchState testState = LightSwitchState();
                                Time currentTime = Time();
                                currentTime.seconds = Int64(
                                    DateTime.now().millisecondsSinceEpoch ~/
                                        1000);
                                print("-----------");
                                print(currentTime.seconds);
                                testState.timeStampSent = currentTime;
                                testState.lighIsOn = turnLightOn;
                                ScheduledAction action = ScheduledAction();
                                action.turnLightOn = turnLightOn;

                                setState(() {
                                  turnLightOn = !turnLightOn;
                                });
                                Time t = Time();
                                t.seconds = Int64(38);
                                action.timeToAct = t;
                                testState.scheduledActions.add(action);

                                writeWriteChar(1).then((Null b) {
                                  return writeDataChar(testState);
                                }).then((Null c) {
                                  return writeWriteChar(0);
                                });
                              }
                            : null,
                      )))),
              
        ],
      ),
    );
  }
}

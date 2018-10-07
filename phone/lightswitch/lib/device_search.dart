import 'package:flutter_blue/flutter_blue.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:lightswitch/landing_page.dart';

class _DeviceSearchState extends State<DeviceSearch> {
  FlutterBlue _flutterBlue = FlutterBlue.instance;
  StreamSubscription _stateSubscription;
  StreamSubscription _scanSubscription;

  StreamSubscription deviceConnection;

  Map<DeviceIdentifier, ScanResult> scanResults = new Map();

  BluetoothState state = BluetoothState.unknown;

  bool isScanning = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Connect"),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(8.0),
        itemCount: scanResults.length,
        itemBuilder: (BuildContext context, int index) {
          var keys = scanResults.keys.toList();
          var result = scanResults[keys[index]];
          return RaisedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return LandingPage(device: result.device);
                }));
            },
            child: Text(result.device.name, style: Theme.of(context).accentTextTheme.button,),
            color: Theme.of(context).accentColor,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: _startScan,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    // Immediately get the state of FlutterBlue
    _flutterBlue.state.then((s) {
      setState(() {
        state = s;
      });
    });
    // Subscribe to state changes
    _stateSubscription = _flutterBlue.onStateChanged().listen((s) {
      setState(() {
        state = s;
      });
    });
  }

  @override
  void dispose() {
    _stateSubscription?.cancel();
    _stateSubscription = null;
    _scanSubscription?.cancel();
    _scanSubscription = null;
    deviceConnection?.cancel();
    deviceConnection = null;
    super.dispose();
  }

  _startScan() {
    setState(() {
      scanResults.clear();
    });
    print("Scanning!");
    _scanSubscription = _flutterBlue.scan(
        timeout: const Duration(seconds: 5),
        withServices: [
          new Guid('df430000-caf7-4a3c-a9c4-4549cbf100fb')
        ]).listen((scanResult) {
      print('localName: ${scanResult.advertisementData.localName}');
      print(
          'manufacturerData: ${scanResult.advertisementData.manufacturerData}');
      print('serviceData: ${scanResult.advertisementData.serviceData}');
      setState(() {
        scanResults[scanResult.device.id] = scanResult;
      });
    }, onDone: _stopScan);

    setState(() {
      isScanning = true;
    });
  }

  _stopScan() {
    _scanSubscription?.cancel();
    _scanSubscription = null;
    setState(() {
      isScanning = false;
    });
  }
}

class DeviceSearch extends StatefulWidget {
  @override
  _DeviceSearchState createState() => _DeviceSearchState();
}

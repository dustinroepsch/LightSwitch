import 'package:flutter_blue/flutter_blue.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'dart:async';

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
          return Card(
            child: Text(result.device.name),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
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
    print("Scanning!");
    _scanSubscription = _flutterBlue
        .scan(
      timeout: const Duration(seconds: 5),
      /*withServices: [
          new Guid('0000180F-0000-1000-8000-00805F9B34FB')
        ]*/
    )
        .listen((scanResult) {
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

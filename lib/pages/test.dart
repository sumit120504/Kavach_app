import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class LocationApp extends StatefulWidget {
  @override
  _LocationAppState createState() => _LocationAppState();
}

class _LocationAppState extends State<LocationApp> {
  Position? _currentPosition;
  String _permissionStatus = 'Unknown';
  String userName = '';
  String userPhone = '';
  String useraddress = '';
  @override
  void initState() {
    super.initState();
    _checkPermission();
    Geolocator.getPositionStream(
      locationSettings: const LocationSettings(distanceFilter: 2),
    ).listen((Position position) {
      setState(() {
        _currentPosition = position;
      });
    });
  }

  Future<void> _checkPermission() async {
    PermissionStatus permission = await Permission.location.status;

    if (!permission.isGranted) {
      permission = await Permission.location.request();

      if (permission.isDenied) {
        setState(() {
          _permissionStatus = 'Location permission denied';
        });
        return;
      } else if (permission.isPermanentlyDenied) {
        setState(() {
          _permissionStatus = 'Location permission permanently denied';
        });
        openAppSettings(); // Opens the app settings so the user can grant permission
        return;
      }
    }

    // Once permission is granted, check for location services
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      setState(() {
        _permissionStatus = 'Location services are disabled.';
      });
      return;
    }

    setState(() {
      _permissionStatus = 'Permission granted';
    });
    _determinePosition();
    _fetchUserData();
  }

  Future<void> _determinePosition() async {
    _currentPosition = await Geolocator.getCurrentPosition();
    setState(() {});
  }

//Function to fetch the user data
  Future<void> _fetchUserData() async {
    User? user = FirebaseAuth.instance.currentUser;

    DocumentSnapshot userDoc = await FirebaseFirestore.instance
        .collection('profiles')
        .doc(user?.uid)
        .get();
    if (userDoc.exists) {
      setState(() {
        userName = userDoc['full_name'];
        userPhone = userDoc['mobile_number'];
        useraddress = userDoc['address'];
      });
    }
  }

  Future<void> _sendSOS() async {
    if (_currentPosition != null) {
      User? user = FirebaseAuth.instance.currentUser;
      await FirebaseFirestore.instance.collection('sos_requests').add({
        'latitude': _currentPosition!.latitude,
        'longitude': _currentPosition!.longitude,
        'timestamp': Timestamp.now(),
        'userName': userName,
        'userphone': userPhone,
        'useraddress': useraddress,
        'uid': user?.uid
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('SOS sent successfully!')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to get location.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Location Tracker')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Permission Status: $_permissionStatus',
            ),
            SizedBox(height: 20),
            Text(
              _currentPosition != null
                  ? 'Location: ${_currentPosition!.latitude}, ${_currentPosition!.longitude}'
                  : 'Location: Unknown',
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _sendSOS,
              child: Text('Send SOS'),
            ),
          ],
        ),
      ),
    );
  }
}

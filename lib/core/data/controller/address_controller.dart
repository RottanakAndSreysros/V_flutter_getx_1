import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart'; // Import permission_handler

class AddressController extends GetxController {
  var locationMessage = ''.obs;
  RxString currentLocation = "".obs;

  // Method to check and handle location permission and services
  Future<void> _checkLocationPermission() async {
    try {
      // First, check if location services are enabled
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        _showLocationServiceDialog();
      } else {
        // Check for location permission using permission_handler
        PermissionStatus permission = await Permission.location.status;

        if (permission == PermissionStatus.denied) {
          // Request permission if it is denied
          permission = await Permission.location.request();
          if (permission == PermissionStatus.denied) {
            locationMessage.value = "Location permission denied";
            return;
          }
        }

        // If permission is granted, fetch the current location
        if (permission == PermissionStatus.granted) {
          Position position = await Geolocator.getCurrentPosition(
            // ignore: deprecated_member_use
            desiredAccuracy: LocationAccuracy.high,
          );

          // Reverse geocode the location
          List<Placemark>? placemarks = await GeocodingPlatform.instance
              ?.placemarkFromCoordinates(position.latitude, position.longitude);

          if (placemarks != null && placemarks.isNotEmpty) {
            Placemark place = placemarks.first;
            locationMessage.value =
                "Latitude: ${position.latitude}, Longitude: ${position.longitude}";
            currentLocation.value =
                " ${place.country ?? 'Unknown'},${place.locality ?? 'Unknown'},"
                " ${place.subLocality ?? "Unknown"},${place.street ?? 'Unknown'} ";
          } else {
            locationMessage.value = "Unable to fetch address details";
            currentLocation.value = "";
          }
        }
      }
    } catch (e) {
      locationMessage.value = "Error fetching location: $e";
    }
  }

  // Show a dialog prompting user to enable location services
  void _showLocationServiceDialog() {
    Get.dialog(
      AlertDialog(
        title: const Text("Location Services Disabled"),
        content: const Text(
            "Location services are turned off. Please enable them in settings to continue."),
        actions: [
          TextButton(
            child: const Text("OK"),
            onPressed: () {
              Get.back(); // Close the dialog
            },
          ),
          TextButton(
            child: const Text("Open Settings"),
            onPressed: () {
              Geolocator.openLocationSettings();
              Get.back(); // Close the dialog
            },
          ),
        ],
      ),
      barrierDismissible:
          false, // Ensure the dialog can't be dismissed by tapping outside
    );
  }

  @override
  void onInit() {
    super.onInit();
    // Run location permission check immediately when app starts
    _checkLocationPermission();
  }
}

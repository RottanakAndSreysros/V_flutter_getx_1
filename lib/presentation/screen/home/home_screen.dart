import 'package:flutter/material.dart';
import 'package:flutter_2_5_getx_1/core/data/controller/address_controller.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final currenAddress = Get.put(AddressController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              const Icon(
                Icons.location_on,
                color: Colors.amber,
              ),
              Obx(
                () => Text(
                  currenAddress.currentLocation.value.isEmpty
                      ? "Loading..."
                      : currenAddress.currentLocation.value,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Center(
        child: Text("HomeScreen"),
      ),
    );
  }
}

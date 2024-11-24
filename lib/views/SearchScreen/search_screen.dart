import 'dart:async';

import 'package:flutter/material.dart';
import 'package:untitled/modles/countryModel/countryModel.dart';

import '../../views_model/search_controller/search_controller.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Assume your controller is in this file

class CountrySearchApp extends StatelessWidget {
  final CountryController controller = Get.put(CountryController());

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Country Search'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Obx((){
              final country = controller.selectedCountry.value;
              return Column(
                children: [
                  TextField(
                      controller: controller.searchController.value,
                      onChanged: controller.onSearchChanged,
                      decoration: InputDecoration(
                        hintText: "Search for a country...",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        filled: true,
                        fillColor: Colors.grey[100],
                        suffixIcon: InkWell(
                          onTap: () {
                            FocusScope.of(context).unfocus();
                            controller.isHide.value = true;
                            controller.fetchCountries();
                          },
                          child: const Icon(
                            Icons.search,
                            color: Colors.teal,
                          ),
                        ),
                      ),
                    ),
                  const SizedBox(height: 10),
                  if(controller.isHide.value)
                    Container(
                    height: controller.countriesList.isEmpty
                        ? screenWidth * 0.2
                        : controller.countriesList.length > 5
                        ? screenWidth * 0.6
                        : controller.countriesList.length * 80,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          blurRadius: 6,
                          offset: const Offset(0, 3),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Obx(() {
                      if(controller.isLoading.value) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if(controller.countriesList.isEmpty) {
                        return const Center(
                          child: Text(
                            "No countries found.",
                            style: TextStyle(fontSize: 16),
                          ),
                        );
                      }
                      else{
                        return ListView.builder(
                          itemCount: controller.countriesList.length,
                          itemBuilder: (context, index) {
                            final country = controller.countriesList[index];
                            return ListTile(
                              leading: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.network(
                                  country.flags!.png.toString(),
                                  width: 50,
                                  height: 50,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              title: Text(
                                country.name!.common.toString(),
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              subtitle: Text(country.region.toString()),
                              onTap: () {
                                controller.isHide.value = true;
                                controller.selectedCountry.value = country;
                              },
                            );
                          },
                        );
                      }
                    }),
                  ),

                  const SizedBox(height: 20),
                  if(country != null)
                    Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Country: ${country.name!.common}",
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "Population: ${country.population}",
                              style: const TextStyle(fontSize: 16),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "Region: ${country.region}",
                              style: const TextStyle(fontSize: 16),
                            ),
                            const SizedBox(height: 12),
                            Center(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.network(
                                  country.flags!.png.toString(),
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}

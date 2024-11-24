import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../modles/countryModel/countryModel.dart';
import '../../repository/searchCountry/searchReposity.dart';

class CountryController extends GetxController {
  var isLoading = false.obs;
  final searchCountryRepository = SearchCountry();
  RxList<CountryModel> countriesList = <CountryModel>[].obs;
  Rxn<CountryModel> selectedCountry = Rxn<CountryModel>();
  final Rx<TextEditingController> searchController = TextEditingController().obs;
  Rx<bool> isHide = false.obs;

  Timer? _debounce;

  void onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    if (query.isEmpty) {
      countriesList.clear();
      isHide.value =  false;
      isLoading.value = false;
    }
    else {
      _debounce = Timer(const Duration(milliseconds: 150), () {
        fetchCountries();
      });
      isHide.value = true;
      isLoading.value = true;
    }
  }




  Future<void> fetchCountries() async {
    String searchCountry = searchController.value.text.toString();
    if (searchCountry.isEmpty) {
      countriesList.clear();
      return;
    }
    isLoading.value = true;

    try {
      final response = await searchCountryRepository.countryApi(searchCountry);
      isLoading.value = false;
      List<dynamic> countryData = response;
      countriesList.value = countryData
          .map((countryJson) => CountryModel.fromJson(countryJson))
          .toList();
      print("Number of countries: ${countriesList.length}");

    } catch (error) {
      isLoading.value = false;
      print("Error fetching countries: $error");
    }
  }

  @override
  void onClose() {
    _debounce?.cancel();
    super.onClose();
  }

}

import '../../data/network/network_services.dart';

class SearchCountry{
  final _apiServices = NetworkApiServices();

  /// Register Api
  Future<dynamic> countryApi(String countryName) async {
    dynamic response = await _apiServices.apiRequest(url: 'https://restcountries.com/v3.1/name/$countryName',method: HttpMethod.GET);
    print("response ${response}");
    return response;
  }
}
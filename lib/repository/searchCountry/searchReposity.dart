import '../../data/network/network_services.dart';
import '../../utills/resources/app_url/app_url.dart';

class SearchCountry{
  final _apiServices = NetworkApiServices();

  /// Register Api
  Future<dynamic> countryApi(String countryName) async {
    dynamic response = await _apiServices.apiRequest(url: "${AppUrl.countrySearchApiUrl}$countryName",method: HttpMethod.GET);
    print("response ${response}");
    return response;
  }
}
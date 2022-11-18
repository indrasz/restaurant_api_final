import 'package:flutter_test/flutter_test.dart';
import 'package:foodyar_final/src/data/services/api_services.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'api_service_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  group('get restaurant', () {
    test('return top restaurant if the http call completes successfully',
        () async {
      final apiService = ApiService();
      final client = MockClient();

      var response =
          '{"error": false,"message": "success","count": 20, "restaurants": []}';

      when(
        client.get(
          Uri.parse('https://restaurant-api.dicoding.dev/list'),
        ),
      ).thenAnswer((_) async => http.Response(response, 200));

      var restaurantAct = await apiService.getListRestaurant(client);
      expect(restaurantAct.message, 'success');
    });
  });
}

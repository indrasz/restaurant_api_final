import 'package:flutter_test/flutter_test.dart';
import 'package:foodyar_final/src/data/models/restaurant.dart';

var tesRestaurant ={
  "id": "s1knt6za9kkfw1e867",
  "name": "Kafe Kita",
  "description":
  "Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. ...",
  "pictureId": "25",
  "city": "Gorontalo",
  "rating": 4
};
void main(){
  test('test parsing', () async{
    var result = Restaurant.fromJson(tesRestaurant).id;
    expect(result, 's1knt6za9kkfw1e867');
  });
}
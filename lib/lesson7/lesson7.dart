import 'package:http/http.dart' as http;
void main() {
  part5_try_catch();
}

void part1_get() {
  http.get('https://json.flutter.su/echo').then((response) {
    print("Response status: ${response.statusCode}");
    print("Response body: ${response.body}");
  }).catchError((error){
    print("Error: $error");
  });
}

Future<void> part2_get() async {
  var response = await http.get('https://json.flutter.su/echo');
  print("Response status: ${response.statusCode}");
  print("Response body: ${response.body}");
}

Future<void> part3_post() async {
  var response = await http.post('https://json.flutter.su/echo', body: {'name':'test','num':'10'});

  print("Response status: ${response.statusCode}");
  print("Response body: ${response.body}");
}

Future<void> part4_headers() async {
  var response = await http.post('https://json.flutter.su/echo',
      headers: {'Accept':'application/json','Authorization':'Basic YWxhZGRpbjpvcGVuc2VzYW1l'});

  print("Response status: ${response.statusCode}");
  print("Response body: ${response.body}");
}

Future<void> part5_try_catch() async {
  try {
    var response = await http.get('ABRA-KADABRA');
    print("Response status: ${response.statusCode}");
    print("Response body: ${response.body}");
  } catch (error) {
    print(error);
  }
}
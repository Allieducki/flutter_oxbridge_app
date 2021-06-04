import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';
import 'event_model.dart';


class HttpService {
  final String eventsURL = 'http://10.0.2.2:3000/events';

  Future<List<Event>> getEvents() async {
    Response res = await get(Uri.parse(eventsURL));

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<Event> events = body
        .map(
          (dynamic item) => Event.fromJson(item),
        )
        .toList();

      return events;
    } else {
      throw "Unable to retrieve events.";
    }
  }
  Future<dynamic> postRequest (firstname,lastname,emailUsername,password) async {
  var url ='http://10.0.2.2:3000/users/register';
  var body = jsonEncode({ 'firstname':firstname,'lastname':lastname,'emailUsername':emailUsername,'password':password,'role':'user' });

  print("Body: " + body);

  await post(Uri.parse(url),
      headers: {"Content-Type": "application/json"},
      body: body
  ).then((Response response) {
    print("Response status: ${response.statusCode}");
    print("Response body: ${response.contentLength}");
    print(response.headers);
    print(response.request);
  });
  }
}
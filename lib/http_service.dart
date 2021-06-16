import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';
import 'event_model.dart';

class HttpService {
  // event endpoint
  final String eventsURL = 'http://10.0.2.2:3000/events';

  // Gets all events and maps them to an event list
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

  // Gets in the data from the TextFields to the body, and creates a POST method
  Future<dynamic> postRequest(
      firstname, lastname, emailUsername, password) async {
    // user registration endpoint
    var url = 'http://10.0.2.2:3000/users/register';
    var body = jsonEncode({
      'firstname': firstname,
      'lastname': lastname,
      'emailUsername': emailUsername,
      'password': password,
      'role': 'user'
    });

    print("Body: " + body);

    await post(Uri.parse(url),
            headers: {"Content-Type": "application/json"}, body: body)
        .then((Response response) {
      print("Response status: ${response.statusCode}");
      print("Response body: ${response.contentLength}");
      print(response.headers);
      print(response.request);
    });
  }
}

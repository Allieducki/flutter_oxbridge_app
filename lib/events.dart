import 'package:flutter/material.dart';
import 'http_service.dart';
import 'event_model.dart';
import 'register.dart';

class EventsPage extends StatelessWidget {
  final HttpService httpService = HttpService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Events"),
        leading: GestureDetector(
          onTap: () { Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => RegisterPage()
              )
              );
              },
          child: Icon(
            Icons.add_box_rounded,  // add custom icons also
    ),
  ),
      ),
      // Calls the getEvent function to get the events, and then maps them into the right locations, with a title and a subtitle
      body: FutureBuilder(
        future: httpService.getEvents(),
        builder: (BuildContext context, AsyncSnapshot<List<Event>> snapshot) {
          if (snapshot.hasData) {
            List<Event> events = snapshot.data;
            return ListView(
              children: events
                  .map(
                    (Event event) => ListTile(
                      title: Text(event.name),
                      tileColor: Colors.lightBlue.shade50,
                      subtitle: Text(event.eventStart.toString()), 
                      
                    ),
                  )
                  .toList(),
            );
          } else {
            return Center(child: Text("shit ain't working"));
          }
        },
      ),
    );
  }
}
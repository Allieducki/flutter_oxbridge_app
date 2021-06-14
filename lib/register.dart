import 'package:flutter/material.dart';
import 'http_service.dart';

class RegisterPage extends StatelessWidget {
  final HttpService httpService = HttpService();
  final TextEditingController _firstnamecontroller = TextEditingController();
  final TextEditingController _lastnamecontroller = TextEditingController();
  final TextEditingController _emailUsernamecontroller =
      TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  final AlertDialog alert = AlertDialog(
    title: Text("Registration error!"),
    content: Text("you didn't fill out all the fields"),
  );
  final AlertDialog success = AlertDialog(
    title: Text("Account registered!"),
    content: Text("your account has now been registered"),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register User"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextField(
                controller: _firstnamecontroller,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter first name here',
                    prefixIcon: Icon(Icons.login)),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextFormField(
                controller: _lastnamecontroller,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter last name here',
                    prefixIcon: Icon(Icons.login)),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextField(
                controller: _emailUsernamecontroller,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter email here',
                    prefixIcon: Icon(Icons.email)),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextFormField(
                controller: _passwordcontroller,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter password here',
                    prefixIcon: Icon(Icons.lock)),
                obscureText: true,
              ),
            ),
            ElevatedButton(
              child: Text('Create Data'),
              onPressed: () {
                if (_firstnamecontroller.text != "" &&
                    _lastnamecontroller.text != "" &&
                    _emailUsernamecontroller.text != "" &&
                    _passwordcontroller.text != "") {
                  httpService.postRequest(
                      _firstnamecontroller.text,
                      _lastnamecontroller.text,
                      _emailUsernamecontroller.text,
                      _passwordcontroller.text);
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return success;
                      });
                } else {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return alert;
                      });
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

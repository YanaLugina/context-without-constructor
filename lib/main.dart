
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: FirstHome(),
    routes: {
      '/first': (context) => FirstHome(),
      '/second': (context) => SecondHome(),
    }
  ),);
}
class User {
  final String name;
  final int age;

  User({ this.name, this.age });
}

class FirstHome extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First home'),
        centerTitle: true,
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            User user = User(name: 'Marfa', age: 33);
            Navigator.pushNamed(context, '/second', arguments: user);
          },
          child: Text('Ouuuu home'),
        ),
      ),
    );
  }
}

class SecondHome extends StatefulWidget {

  @override
  _SecondHome createState() => _SecondHome();
}

class _SecondHome extends State<SecondHome> {
  User user;

  @override
  Widget build(BuildContext context) {
    RouteSettings settings = ModalRoute.of(context).settings;
    user = settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('${this.user.name} - ${this.user.age}'),
        centerTitle: true,
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go Back'),
        ),
      ),
    );
  }
}

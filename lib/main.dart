import 'package:flutter/material.dart';

void main() => runApp(project_flutter());

class project_flutter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Navigation Test',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
        home: FirstScreen(),
    );
  }
}


class FirstScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Screen'),
      ),
      body: Center(
        child: RaisedButton(
          child: const Text('Go to navbar'),
          onPressed: (){
            Navigator
            .of(context)
                .push(MaterialPageRoute(builder: (_) => SecondScreen()));
          },
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scond Screen'),
      ),
      body: Center(
        child: RaisedButton(
          child: const Text('Go to first one'),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
    );
  }
}
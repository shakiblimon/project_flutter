import 'package:flutter/material.dart';

void main() => runApp(project_flutter());



class project_flutter extends StatelessWidget {

  // New Segment
  Route<dynamic> _parseRoute(RouteSettings settings){
    final List<String> path = settings.name.split('/');

    assert(path[0] == '');

    if(path[1] =='second' && path.length==3){
      final value = double.parse(path[2]);

      return new MaterialPageRoute<double>(
          settings: settings,
          builder:BuildContext context=> SecondScreen(value:value),
        );
    }
    return null;
  }



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Navigation Test',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
        home: FirstScreen(),

      onGenerateRoute: _parseRoute,
    );
  }
}


class FirstScreenWidget extends StatelessWidget {
  @override
  FirstScreenState createState() => new FirstScreen();
}

class FirstScreenState extends State<FirstScreenWidget>{
  var _value = 50.0;

  _navigateUsingConstructor() async{
    _value = await Navigator.of(context).push(
      new MaterialPageRoute(builder: (context) => SecondScreen(value: _value))
    )??1.0;

  }

  _navigateUsingRoute() async {
    _value = await Navigator.of(context).pushNamed('/scond/$_value')??1.0;
  }

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
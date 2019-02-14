import 'package:flutter/material.dart';

void main() => runApp(project_flutter());

class project_flutter extends StatelessWidget{
  Route<dynamic>_parseRoute(RouteSettings settings){
    final List<String>path = settings.name.split('/');
    assert(path[1]=='');

    if (path[1]=='second' && path.length==3){
      final value = double.parse(path[2]);

      return new MaterialPageRoute<double>(
          settings: settings,
          builder: (BuildContext context) => SecondScreenWidget(value: value),
      );
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: 'Navigation  Start',
      theme: new ThemeData(
        primarySwatch: Colors.black,
      ),
      home: new FirstScreenWidget(),

      onGenerateRoute: _parseRoute,
    );
  }
}


class FirstScreenWidget extends StatelessWidget{
  @override
  FirstScreenState createState() => new FirstScreenState();
}

class FirstScreenState extends State<FirstScreenWidget>{
  var _value = 50.0;

  _navigateUsingConstructor() async{
    _value = await Navigator.of(context)
  }
}

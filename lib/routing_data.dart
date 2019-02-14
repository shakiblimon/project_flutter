import 'package:flutter/material.dart';

void main() => runApp(project_flutter());

class project_flutter extends StatelessWidget {
  Route<dynamic> _parseRoute(RouteSettings settings) {
    final List<String>path = settings.name.split('/');
    assert(path[1] == '');

    if (path[1] == 'second' && path.length == 3) {
      final value = double.parse(path[2]);

      return new MaterialPageRoute<double>(
        settings: settings ,
        builder: (BuildContext context) => SecondScreenWidget(value: value) ,
      );
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: 'Navigation  Start' ,
      theme: new ThemeData(
        primarySwatch: Colors.black ,
      ) ,
      home: new FirstScreenWidget() ,

      onGenerateRoute: _parseRoute ,
    );
  }
}


class FirstScreenWidget extends StatelessWidget {
  @override
  FirstScreenState createState() => new FirstScreenState();
}

class FirstScreenState extends State<FirstScreenWidget> {
  var _value = 50.0;

  _navigateUsingConstructor() async {
    _value = await Navigator.of(context).push(
        new MaterialPageRoute(
            builder: (context) => new SecondScreenWidget(value = _value)
        )
    ) ?? 1.0;
  }
}

_navigateUsingRoute() async {
  _value = await Navigator.of(context).pushNamed('/second/$_value') ?? 1.0;
}

@override
 Widget build(buildContext context){
     return new Scaffold(
     appBar: new AppBar(
       title : conts Text('First Screeen'),
       ),
       body : new Center(
         child : new Column(
           mainAxisAligement: MainAxisAlignment.center,
           childer: <Widget>[
             new Slider(
              min : 1.0,
              max : 100.0,
              value: _value,
              onChanged: (value) => setState( ()=> _value = value) ,
             ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new RaisedButton(
                child: const Text('Pas via constructor'),
                onPressed:(){
                  _navigateUsingConstructor();
                    },
                ),
              new RaisedButton(
                child: const Text('Pass via route'),
                  onPressed: (){
                    _navigateUsingRoute();
                    },
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }

  class SecondScreenWidget extends StatefulWidget{
    Scond ScreenWidget({
    this.value: 1.0
  });
    final double value;
    @override

    SecondScreenState createState() => new SecondScreenWidget(value);
  }
























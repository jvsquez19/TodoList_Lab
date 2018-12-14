import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class Tarea{
  String nombre;
  DateTime fecha;
  Tarea(this.nombre,this.fecha);
  Tarea.custom({this.nombre,this.fecha});
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return MainScreenState();
  }
}

class MainScreenState extends State<MainScreen>{
  
  String valor = '';
  List<Tarea> listaTareas= [];

@override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Tarea nueva = Tarea(valor,DateTime.now());
          setState(() {
            listaTareas.add(nueva);
          });
        },
        child: Column(
          children: <Widget>[
            Icon(Icons.add),
            Text('Add')
          ],),
      ),
      appBar: AppBar(title: Text('Cosas por hacer'),),
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            TextField(
              onChanged: (value){
                valor = value;
              },
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: listaTareas.length,
                  itemBuilder: (context,index){
                    Tarea current = listaTareas[index];
                    return ListTile(

                      title: Text(current.nombre),
                      subtitle: Text(current.fecha.toIso8601String().split(' ')[0]),
                    );
                  }),
            )
          ],
        ),
      )
    );
  }
}
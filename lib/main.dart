import 'package:flutter/material.dart';
import 'package:bitsfin/main2.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          top: 100.0,
          left: 40.0,
          right: 40.0,
        ),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 220.0,
              child: Center(
                child: Column(
                  children: <Widget>[
                    Image.asset("assets/logo_RGB.png", width: 230,),
                    Text("Adm/Fin", style: TextStyle(fontSize: 23),)
                  ],
                ),
                // child: Text("assets/logo_RGB.png"),
                
              ),
            ),
            SizedBox(
              height: 0.0,
            ),
            Container(
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: "E-mail",
                  labelStyle: TextStyle(
                    color: Colors.black38,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Container(
              child: TextFormField(
                keyboardType: TextInputType.text,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Senha",
                  labelStyle: TextStyle(
                    color: Colors.black38,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            // Container(
            //   height: 30.0,
            //   alignment: Alignment.centerRight,
            //   child: FlatButton(
            //     child: Text(
            //       "Recuperar Senha",
            //       style: TextStyle(
            //         color: Colors.black45,
            //       ),
            //     ),
            //     onPressed: () {},
            //   ),
            // ),
            SizedBox(
              height: 30.0,
            ),
            Container(
              height: 50.0,
              alignment: Alignment.centerRight,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.3, 1],
                  colors: [Colors.blue, Colors.lightBlueAccent],
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ),
              child: SizedBox.expand(
                child: FlatButton(
                  //NAVIGATOR PARA A PRIMEIRA TELA
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Main2()),
                    );                    
                  },
                  child: Text(
                    "Fazer Login",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      // fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              height: 50.0,
              alignment: Alignment.centerRight,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0, 1],
                  colors: [
                    Colors.blue, Colors.lightBlueAccent,
                  ],
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ),
              child: SizedBox.expand(
                child: FlatButton(
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   //MaterialPageRoute(builder: (context) => cadastro()),
                    // );
                  },
                  child: Text(
                    "Cadastre-se",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      // fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

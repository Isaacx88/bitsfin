import 'package:flutter/material.dart';
import 'package:bitsfin/cadastrarEntrada.dart';
import 'package:bitsfin/visualizarEntradas.dart';


class Main2 extends StatefulWidget {
  @override
  _Main2State createState() => _Main2State();
}

class _Main2State extends State<Main2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text("Entradas e saídas"),
        centerTitle: true,

      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          top: 40.0,
          left: 40.0,
          right: 40.0,
        ),
        child: Column(
          children: <Widget>[
            
            Container(
              height: 50.0,
              alignment: Alignment.centerRight,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.3, 1],
                  colors: [ Colors.green, Colors.green],
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ),
              child: SizedBox.expand(
                child: FlatButton(
                  //NAVIGATOR PARA VISUALIZAR ENTRADAS
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => VisualizarEntradas()),
                    );                    
                  },
                  child: Text(
                    "Visualizar entradas",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
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
                    Colors.green, Colors.green,
                  ],
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ),
              child: SizedBox.expand(
                child: FlatButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CadastrarEntrada()),
                    );
                  },
                  child: Text(
                    "Cadastrar nova entrada",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
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
                    Colors.orange, Colors.redAccent,
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
                    "Visualizar saídas",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
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
                    Colors.orange, Colors.redAccent,
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
                    "Cadastrar nova saída",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
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
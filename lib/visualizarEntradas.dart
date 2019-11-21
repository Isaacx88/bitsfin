import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class VisualizarEntradas extends StatefulWidget {
  @override
  _VisualizarEntradasState createState() => _VisualizarEntradasState();
}

class _VisualizarEntradasState extends State<VisualizarEntradas> {
  String myText = "";
  // DocumentReference documentReference;
  CollectionReference entradas;
  StreamSubscription<DocumentSnapshot> subscription;



        //     projetosPesquisa = Firestore.instance
        // .collection("projetosPesquisa")
        // .document(user.usuario.uid)
        // .collection("projetosPesquisa");

    DocumentReference documentReference = Firestore.instance
            .collection("entradaCollection")
            .document("entradaDocument")
            .collection("entradas").document();


  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
      appBar: AppBar(
        title: Text('Entradas'),
        centerTitle: true,
        backgroundColor: Colors.green,
        //backgroundColor: Theme.of(context).primaryColor,
      ),
      body:

          //Mostrando dados do banco
          new StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance
            .collection("entradaCollection")
            .document("entradaDocument")
            .collection("entradas")
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return new Center(child: CircularProgressIndicator());
          } else {
            return new ListView.builder(
              itemCount: snapshot.data.documents.length,
              itemBuilder: (context, index) {
                DocumentSnapshot ds = snapshot.data.documents[index];

                print("TESTE");
                print("Tamanho da lista: " +
                    snapshot.data.documents.length.toString());
                // print("Usuário: " + user.usuario.displayName);
                // print("Email: " + user.usuario.email);

                return new Column(
                  children: <Widget>[
                    Divider(
                      color: Colors.transparent,
                      height: 2,
                    ),

                    //Card de projeto
                    Card(
                      elevation: 20,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, bottom: 2.0, left: 10, right: 2),
                              child: Row(children: <Widget>[
                                Text(
                                  "Título: ",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.left,
                                ),
                              ]),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(
                                  // top: 8, bottom: 2.0, left: 10, right: 2),
                                  top: 8,
                                  bottom: 2.0,
                                  left: 10,
                                  right: 10),
                              child: Text(
                                ds['titulo'].toString(),
                                style: TextStyle(
                                    fontSize: 20, color: Colors.grey[600]),
                                // textAlign: TextAlign.left,
                                textAlign: TextAlign.justify,
                              ),
                            ),

                            Container(
                              padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
                              child: Divider(
                                color: Colors.black,
                                height: 5,
                              ),
                            ),

                            //Descrição
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 8, bottom: 2.0, left: 10, right: 2),
                              child: Row(children: <Widget>[
                                Text(
                                  "Descrição: ",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.left,
                                ),
                              ]),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 4, bottom: 2.0, left: 10, right: 10),
                              child: Text(
                                ds['descricao'].toString(),
                                maxLines: 3,
                                style: TextStyle(
                                    fontSize: 20, color: Colors.grey[600]),
                                // textAlign: TextAlign.left,
                                textAlign: TextAlign.justify,
                              ),
                            ),

                            Container(
                              padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
                              child: Divider(
                                color: Colors.black,
                                height: 5,
                              ),
                            ),

                          //CONTA
                           Padding(
                              padding: const EdgeInsets.only(
                                  top: 8, bottom: 2.0, left: 10, right: 2),
                              child: Row(children: <Widget>[
                                Text(
                                  "Conta: ",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.left,
                                ),
                              ]),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 4, bottom: 2.0, left: 10, right: 10),
                              child: Text(
                                ds['conta'].toString(),
                                maxLines: 3,
                                style: TextStyle(
                                    fontSize: 20, color: Colors.grey[600]),
                                // textAlign: TextAlign.left,
                                textAlign: TextAlign.justify,
                              ),
                            ),

                            Container(
                              padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
                              child: Divider(
                                color: Colors.black,
                                height: 5,
                              ),
                            ),              

                          //CATEGORIA
                           Padding(
                              padding: const EdgeInsets.only(
                                  top: 8, bottom: 2.0, left: 10, right: 2),
                              child: Row(children: <Widget>[
                                Text(
                                  "Categoria: ",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.left,
                                ),
                              ]),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 4, bottom: 2.0, left: 10, right: 10),
                              child: Text(
                                ds['categoria'].toString(),
                                maxLines: 3,
                                style: TextStyle(
                                    fontSize: 20, color: Colors.grey[600]),
                                // textAlign: TextAlign.left,
                                textAlign: TextAlign.justify,
                              ),
                            ),        

                            Container(
                              padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
                              child: Divider(
                                color: Colors.black,
                                height: 5,
                              ),
                            ),

                            //VALOR

                           Padding(
                              padding: const EdgeInsets.only(
                                  top: 8, bottom: 2.0, left: 10, right: 2),
                              child: Row(children: <Widget>[
                                Text(
                                  "Valor: ",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.left,
                                ),
                              ]),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 4, bottom: 2.0, left: 10, right: 10),
                              child: Text(
                                ds['valor'].toString(),
                                maxLines: 3,
                                style: TextStyle(
                                    fontSize: 20, color: Colors.grey[600]),
                                // textAlign: TextAlign.left,
                                textAlign: TextAlign.justify,
                              ),
                            ),                                                
                            //Botão de ir para a página com mais detalhes
                            // ButtonTheme(
                            //   minWidth: 5.0,
                            //   height: 50.0,
                            //   child: RaisedButton(
                            //       color: Color.fromRGBO(58, 66, 86, .9),
                            //       child: Padding(
                            //         padding: EdgeInsets.symmetric(),
                            //         child: Row(children: <Widget>[
                            //           Text(
                            //             "Ver mais",
                            //             style: TextStyle(
                            //                 fontSize: 20,
                            //                 color: Colors.white,
                            //                 fontWeight: FontWeight.bold),
                            //             textAlign: TextAlign.center,
                            //           ),

                            //           // Icon(Icons.call_received, color: Colors.white,),
                            //         ]),
                            //       ),
                            //       onPressed: () {
                            //         //Ao pressionar, redirecionar para a página com os detalhes
                            //         // Navigator.push(
                            //         //   context,
                            //         //   MaterialPageRoute(
                            //         //     builder: (context) => DetailPagePesquisa(
                            //         //     this.user,
                            //         //     this._nomeFaculdade,
                            //         //     ds["titulo"],
                            //         //     ds["descricao"],
                            //         //     //ds["bolsa"],
                            //         //     ds["nomeProfessor"],
                            //         //     ds["areaProfessor"],
                            //         //     ds["emailProfessor"])
                            //         //     )
                            //         // );
                            //       }),
                            // )
                          ]),
                    ),
                  ],
                );
              },
            );
          }
        },
      ),
    );
  }

  //Lê dados do banco
  void getData() {
    // databaseReference.once().then((DataSnapshot snapshot) {
    //   print('Data : ${snapshot.value}');
    // });
    documentReference.get().then((datasnapshot) {
      if (datasnapshot.exists) {
        setState(() {
          myText = datasnapshot.data['descricao'];
        });
      }
    });
  }

  //Inicialização. Depois inicializar com lista de contas atual
  @override
  void initState() {
    super.initState();
    subscription = documentReference.snapshots().listen((datasnapshot) {
      if (datasnapshot.exists) {
        //Colocar Listview?
        setState(() {
          myText = datasnapshot.data['descricao'];
        });
      }
    });
  }
}

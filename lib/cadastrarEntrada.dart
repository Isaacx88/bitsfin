import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:cloud_firestore/cloud_firestore.dart';





class CadastrarEntrada extends StatefulWidget {
  @override
  _CadastrarEntradaState createState() => _CadastrarEntradaState();
}

class _CadastrarEntradaState extends State<CadastrarEntrada> {
  final _tituloController = TextEditingController();
  final _descController = TextEditingController();
  final _valorController = TextEditingController();


  //Teste combo box (dropdown menu)
  List<String> _categorias = ['Aplicativos',
                              'Confraternização', 
                              'Contadora', 
                              'Eventos MEJ',
                              'Identidade da empresa',
                              'Imersões',
                              'Impostos',
                              'Materiais de Escritório',
                              'Processo seletivo',
                              'Reembolso de gasto\npela empresa',
                              'Reuniões com clientes',
                              'Site',
                              'Tarifas bancárias',
                              'Transferências entre\ncontas internas']; // Option 2
  String _categoriaSelecionada;

  List<String> _conta = ['Banco da Amazônia', 'Stone', 'Caixa da empresa']; // Option 2
  String _contaSelecionada;
  
  CollectionReference addEntrada;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Cadastrar nova entrada"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[


            Card(
              elevation: 0,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Padding(
                        padding: const EdgeInsets.only(top: 8, left: 10),
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.description,
                                size: 20, color: Colors.grey[600]),
                            Text(
                              "Título:",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey[600],
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.left,
                            ),
                          ],
                        )),
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 10.0, left: 10, right: 10),
                      child: TextField(
                        controller: _tituloController, //Colocar devedor
                        decoration:
                            InputDecoration(hintText: "Título da entrada"),
                      ),
                    )
                  ]),
            ),


            Card(
              elevation: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.only(top: 8, left: 10),
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.subject,
                              size: 20, color: Colors.grey[600]),
                          Text(
                            "Descrição: ",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey[600],
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      )),
                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: 10.0, left: 10, right: 10),
                    child: TextField(
                      controller: _descController,
                      decoration:
                          InputDecoration(hintText: "Adicione uma Descrição"),
                    ),
                  )
                ],
              ),
            ),




            Card(
              elevation: 0,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Padding(
                        padding: const EdgeInsets.only(top: 8, left: 10),
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.account_balance,
                                size: 20, color: Colors.grey[600]),
                            Text(
                              "Conta:",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey[600],
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.left,
                            ),
                          ],
                        )),
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 10.0, left: 100, right: 100),
                      child: 
                      
                      DropdownButton(
                          hint: Text('Escolha a conta'), // Not necessary for Option 1
                          value: _contaSelecionada,
                          onChanged: (newValue) {
                            setState(() {
                              _contaSelecionada = newValue;
                            });
                          },
                          items: _conta.map((conta) {
                            return DropdownMenuItem(
                              child: new Text(conta),
                              value: conta,
                            );
                          }).toList(),
                        ),


                    )
                  ]),
            ),

             Card(
              elevation: 0,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Padding(
                        padding: const EdgeInsets.only(top: 8, left: 10),
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.category,
                                size: 20, color: Colors.grey[600]),
                            Text(
                              "Categoria:",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey[600],
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.left,
                            ),
                          ],
                        )),
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 10.0, left: 100, right: 100),
                      child: 
                      
                             DropdownButton(
                              hint: Text('Escolha a categoria'), // Not necessary for Option 1
                              value: _categoriaSelecionada,
                              onChanged: (newValue) {
                                setState(() {
                                  _categoriaSelecionada = newValue;
                                });
                              },
                              items: _categorias.map((categoria) {
                                return DropdownMenuItem(
                                  child: new Text(categoria),
                                  value: categoria,
                                );
                              }).toList(),
                            ),


                    )
                  ]),
            ),

//VALOR


            Card(
              elevation: 0,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Padding(
                        padding: const EdgeInsets.only(top: 8, left: 10),
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.monetization_on,
                                size: 20, color: Colors.grey[600]),
                            Text(
                              "Valor:",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey[600],
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.left,
                            ),
                          ],
                        )),
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 10.0, left: 10, right: 10),
                      child: 
                      
                      
                      // TextField(
                      //   controller: _tituloController, //Colocar devedor
                      //   decoration:
                      //       InputDecoration(hintText: "Título da entrada"),
                      // ),

                TextFormField(
                  
                  scrollPadding: EdgeInsets.all(10),
                  
                  validator: (value) {
                    if (value == "0,00") return "Insira a quantia!";
                  },
                  controller: _valorController,
                  decoration: InputDecoration(
                      labelText: "Valor", labelStyle: TextStyle(fontSize: 20)),
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 30),
                  keyboardType: TextInputType.numberWithOptions(signed: false),
                  
                  // inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],

                ),







                      
                    )
                  ]),
            ),

                Divider(),
                // Linha com os botões
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                      color: Colors.red,
                      child: Text("Cancelar",
                          style: TextStyle(color: Colors.white)),
                      onPressed: () => {Navigator.pop(context)},
                    ),
                    VerticalDivider(),
                    RaisedButton(
                      color: Theme.of(context).primaryColor,
                      child: Text(
                        "Confirmar",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        
                        Map<String, String> dados = <String, String>{
                          "titulo": _tituloController.text,
                          "descricao": _descController.text,
                          "conta": _contaSelecionada,
                          "categoria": _categoriaSelecionada,
                          "valor": _valorController.text,
                          // "categoria" : this.categoria.toString(),
                          // "subcategoria" : this.subcategoria.toString() //CONTA?
                        };

                        //Verifica se as entradas de texto estão vazias
                        //Se estiver vazio, abre o popup de alerta

                        if (_descController.text == "" ||
                                _tituloController.text == "" ||
                                _contaSelecionada == "" ||
                                _categoriaSelecionada == "" ||
                                _valorController.text == ""
                            //num.tryParse(valorController.text) == null
                            ) {
                          // print("Titulo: " + _tituloController.text);
                          // print("Descrição: " + _descController.text);
                          // print("Conta: " + _contaSelecionada);
                          // print("Categoria: " + _categoriaSelecionada);
                          // print("Valor: " + _valorController.text);

                          return new Alert(
                            context: context,
                            type: AlertType.error,
                            title: "AVISO",
                            desc: "Verifique se os dados estão corretos!",
                            buttons: [
                              DialogButton(
                                child: Text(
                                  "OK",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                                onPressed: () => Navigator.pop(context),
                                width: 120,
                              )
                            ],
                          ).show();
                        } else {
                          
                          
                        CollectionReference entradas;

                        entradas = Firestore.instance
                        .collection("entradaCollection")
                        .document("entradaDocument").collection("entradas");

                        entradas.document().setData(dados).whenComplete(() {
                        print("Conta adicionada com sucesso");
                          
                          
                          
                          // addEntrada = Firestore.instance
                          //     .collection("agricultores")
                          //     .document(widget.user.usuario.uid)
                          //     .collection("addEntrada");

                          // addEntrada
                          //     .document()
                          //     .setData(dados)
                          //     .whenComplete(() {
                          //   print("Document Added");
                          // }).catchError((e) => print(e));

                          //Seta novamente os campos para ficar "em branco". Dispose não estava funcionando
                          _descController.text = "";
                          _tituloController.text = "";
                          _valorController.text = "";
                          _contaSelecionada = "";
                          _categoriaSelecionada = "";
                      
                          Navigator.pop(context);
                          // Navigator.pop(context);
                          // Navigator.pop(context);


                          
                        }

                        
                      );
                      }
                      }
                    ),            


          


            Divider(
              height: 20,
              color: Colors.transparent,
            ),





          ],
        ),
          ]),
    )
    );
    }
}

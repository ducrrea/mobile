//página de formulário

import 'package:flutter/material.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  String _nome = "";
  String _email = "";
  String _senha = "";
  String _confirmarSenha = "";
  final bool _aceitarTermos = false;
  final String _sexo = "Feminino";
  final double _idade = 18;
  List<String> interesses = [];
  final String _cidade = "Americana";

  bool _obscureSenha = true;

  final formKey = GlobalKey<FormState>();

  
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Formulário de Cadastro"),),
      body: Padding(
        padding: EdgeInsets.all(8),
        // adicionar elemento e fazer a verificação
        child: Form(
          key: formKey, //chave de validação para o form
          child: SingleChildScrollView(
            child: Column(
              children: [
                //campo texto para nome
                TextFormField(
                  decoration: InputDecoration(labelText: "Digite seu Nome...", border: OutlineInputBorder()),
                  onChanged: (value) => setState(() {_nome = value;}),
                  validator: (value) => value!.isEmpty ? "Campo Obrigatório": null,
                ),
                //campo email
                SizedBox(height: 20,),
                TextFormField(
                  decoration: InputDecoration(labelText: "Digite seu Email...", border: OutlineInputBorder()),
                  onChanged: (value) => setState(() {_nome = value;}),
                  validator: (value) => value!.isEmpty ? "Campo Obrigatório": null,
                ),

                SizedBox(height: 20,),
                TextFormField(
                  decoration: InputDecoration(labelText: "Digite seu Email...", border: OutlineInputBorder()),
                  onChanged: (value) => setState(() {_email = value;}),
                  validator: (value) => value!.contains("@") ? null : "Email Inválido",
                ),

                SizedBox(height: 20,),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Digite sua Senha...", 
                    border: OutlineInputBorder(),
                    suffixIcon: IconButton(
                      onPressed: () => setState(() {
                        _obscureSenha = !_obscureSenha; // inverter o valor para a booleana
                      }), 
                      icon: Icon(_obscureSenha ? Icons.visibility : Icons.visibility_off))),
                  onChanged: (value) => setState(() {_senha = value;}),
                  validator: (value) => value!.length < 6 ? "A senha deve conter no mínimo 6 caracteres" : null,
                  obscureText: _obscureSenha,
                ),
                SizedBox(height: 20,),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Confirme sua Senha..",
                    border: OutlineInputBorder(),
                    suffixIcon: IconButton(onPressed: 
                    () => setState(() {
                    _obscureSenha = !_obscureSenha;}), icon: Icon(
                      _obscureSenha ? Icons.visibility : Icons.visibility_off,))
                  ),
                  onChanged: (value) => setState(() {
                  _confirmarSenha = value;}),
                  validator: (value) => value! != _senha ? "As senhas não correspondem" : null,
                  obscureText: _obscureSenha,
                ),
              ],
            ),
          )),),
    );
  }
}
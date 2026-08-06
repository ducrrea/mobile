import 'package:flutter/material.dart';
import 'json_helper.dart';

class ProdutosPage extends StatefulWidget {
  const ProdutosPage({super.key});

  @override
  State<ProdutosPage> createState() => _ProdutosPageState();
}

class _ProdutosPageState extends State<ProdutosPage> {
  // Controladores para os inputs de texto
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _valorController = TextEditingController();

  // Lista local para armazenar os produtos na memória
  List<dynamic> _produtos = [];

  @override
  void initState() {
    super.initState();
    _carregarProdutos();
  }

  // Busca os dados armazenados através do JsonHelper ao iniciar a tela
  void _carregarProdutos() async {
    List<dynamic> dados = await JsonHelper.lerDados();
    setState(() {
      _produtos = dados;
    });
  }

  // Adiciona um novo produto à lista e salva no arquivo produtos.json
  void _salvarProduto() async {
    String nome = _nomeController.text.trim();
    String valorTexto = _valorController.text.trim();

    if (nome.isNotEmpty && valorTexto.isNotEmpty) {
      double? valor = double.tryParse(valorTexto.replaceAll(',', '.'));

      if (valor != null) {
        Map<String, dynamic> novoProduto = {
          "nome": nome,
          "valor": valor,
        };

        setState(() {
          _produtos.add(novoProduto);
        });

        // Persiste a lista atualizada no disco usando o helper estático
        await JsonHelper.salvarDados(_produtos);

        // Limpa os campos de texto
        _nomeController.clear();
        _valorController.clear();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cadastro de Produtos"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Campo de Texto - Nome do Produto
            TextField(
              controller: _nomeController,
              decoration: const InputDecoration(
                labelText: "Nome do Produto",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),

            // Campo de Texto - Valor do Produto
            TextField(
              controller: _valorController,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(
                labelText: "Valor (R\$)",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),

            // Botão Salvar
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton.icon(
                onPressed: _salvarProduto,
                icon: const Icon(Icons.save),
                label: const Text("Salvar Produto"),
              ),
            ),
            const SizedBox(height: 20),

            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Produtos Cadastrados:",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 8),

            // Listagem de produtos
            Expanded(
              child: _produtos.isEmpty
                  ? const Center(child: Text("Nenhum produto cadastrado."))
                  : ListView.builder(
                      itemCount: _produtos.length,
                      itemBuilder: (context, index) {
                        final produto = _produtos[index];
                        return Card(
                          child: ListTile(
                            leading: const Icon(Icons.shopping_cart, color: Colors.indigo),
                            title: Text(produto["nome"] ?? ""),
                            subtitle: Text("R\$ ${(produto["valor"] ?? 0.0).toStringAsFixed(2)}"),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
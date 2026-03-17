import 'package:flutter/material.dart';

void main() {
  runApp(const PerfilProfissionalApp());
}

class PerfilProfissionalApp extends StatelessWidget {
  const PerfilProfissionalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const PaginaPerfil(),
    );
  }
}

class PaginaPerfil extends StatelessWidget {
  const PaginaPerfil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFF59D),
        elevation: 0, //a gnt coloca isso pra deixar o appbar sem sombra, pra ficar mais clean
        toolbarHeight: 0, // e colocamos isso pra deixar o appbar com altura zero
      ),
      backgroundColor: const Color(0xFFF9F5D7),
      body: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 40),
                color: const Color(0xFFFFF59D),
                child: Column(
                  children: [
                    const Text(
                      "Clara Aguiar",
                      style: TextStyle(
                        fontSize: 32,
                        fontFamily: "Serif", 
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 15),//isso aq é a foto de perfil
                    Container(
                      width: 90,
                      height: 90,
                      decoration: const BoxDecoration(
                        color: Color(0xFFBCBCBC),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          Expanded( //expended é pra ocupar o espaço restante da tela, pra não ficar com aquele espacinho embaixo
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  // Estrelas
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.star, color: Color(0xFFD4C88C), size: 24),
                      Icon(Icons.star, color: Color(0xFFD4C88C), size: 24),
                      Icon(Icons.star, color: Color(0xFFD4C88C), size: 24),
                      Icon(Icons.star, color: Color(0xFFD4C88C), size: 24),
                      Icon(Icons.star, color: Color(0xFFD4C88C), size: 24),
                    ],
                  ),
                  const Text("Brasil - SP", style: TextStyle(color: Color(0xFFA69E7C), fontSize: 12)),
                  const SizedBox(height: 8),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.camera_alt_outlined, size: 20),
                      SizedBox(width: 10),
                      Icon(Icons.facebook_outlined, size: 20),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Me chamo Clara e moro em São Paulo. Tenho habilidades em comunicação, organização e resolução de problemas. Já trabalhei em projetos de marketing digital e em colaboração com equipes criativas.",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, height: 1.5, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 30),

                  Row(//usamos o row pra colocar os 3 badges (seguidores, projetos e local) na mesma linha
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  ),
                  const SizedBox(height: 30),
                  _botaoGrande(Icons.person, "457  Seguidores"),
                  _botaoGrande(Icons.business_center, "Projetos Anteriores"),
                  _botaoGrande(Icons.folder_open, "Baixar Currículo"),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),

          Container(
            color: const Color(0xFFF6EEB4),
            padding: const EdgeInsets.symmetric(vertical: 15),//o edgeinsets é pra colocar um espaçamento interno
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _iconCircle(Icons.arrow_back_ios_new),
                const Icon(Icons.home, size: 35),
                _iconCircle(Icons.arrow_forward_ios),
              ],
            ),
          ),
        ],
      ),
    );
  }
  Widget _botaoGrande(IconData icon, String label) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      height: 75,
      decoration: BoxDecoration(
        color: const Color(0xFFBCA46D),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const SizedBox(width: 25),
          Icon(icon, size: 35, color: Colors.black87),
          const SizedBox(width: 20),
          Text(
            label,
            style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }

  Widget _buildMiniBadge(String valor, String label) {
    return Column(
      children: [
        Text(valor, style: const TextStyle(fontWeight: FontWeight.bold)),
        Text(label, style: const TextStyle(fontSize: 10)),
      ],
    );
  }

  Widget _itemSimples(String texto) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Text(texto, style: const TextStyle(fontSize: 12, color: Colors.grey)),
    );
  }

  Widget _iconCircle(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(color: Colors.black, shape: BoxShape.circle),
      child: Icon(icon, color: Colors.white, size: 18),
    );
  }
}
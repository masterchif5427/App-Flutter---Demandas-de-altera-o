import 'package:flutter/material.dart';

class CuisineFilterWidget extends StatelessWidget {
  final List<Map<String, String>> cuisines = [
    {'name': 'Mexicana', 'imageUrl': 'https://flagcdn.com/w40/mx.png'},
    {'name': 'Árabe', 'imageUrl': 'https://flagcdn.com/w40/sa.png'},
    {'name': 'Francesa', 'imageUrl': 'https://flagcdn.com/w40/fr.png'},
    {'name': 'Portuguesa', 'imageUrl': 'https://flagcdn.com/w40/pt.png'},
    {'name': 'Italiana', 'imageUrl': 'https://flagcdn.com/w40/it.png'},
    {'name': 'Japonesa', 'imageUrl': 'https://flagcdn.com/w40/jp.png'},
  ];

  CuisineFilterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Implementação do Filtro Horizontalmente Rolável (HOME-002)
    // com a alteração/melhoria para incluir as bandeiras (HOME-003 - Atividade 1)
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: cuisines.length,
        itemBuilder: (context, index) {
          final cuisine = cuisines[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: [
                // Uso do ClipRRect para dar um formato arredondado à imagem,
                // como sugerido na Atividade 2, mas aplicado aqui para o filtro.
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    cuisine['imageUrl']!,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return const SizedBox(
                        width: 50,
                        height: 50,
                        child: Center(child: CircularProgressIndicator(strokeWidth: 2)),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(Icons.flag, size: 50);
                    },
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  cuisine['name']!,
                  style: const TextStyle(fontSize: 12),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

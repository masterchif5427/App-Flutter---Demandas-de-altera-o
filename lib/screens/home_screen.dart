import 'package:flutter/material.dart';
import '../widgets/cuisine_filter_widget.dart';
import '../widgets/banner_carousel_widget.dart';
import '../widgets/restaurant_card_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // Dados mock para a listagem de restaurantes (Atividade 3)
  final List<Map<String, dynamic>> restaurants = const [
    {
      'name': 'Restaurante Mexicano Del Sol',
      'category': 'Mexicana',
      'rating': 4.5,
      'imageUrl': 'https://picsum.photos/id/10/400/200',
    },
    {
      'name': 'Le Petit Paris',
      'category': 'Francesa',
      'rating': 4.8,
      'imageUrl': 'https://picsum.photos/id/20/400/200',
    },
    {
      'name': 'Cantina Italiana',
      'category': 'Italiana',
      'rating': 4.2,
      'imageUrl': 'https://picsum.photos/id/30/400/200',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 1. Cabeçalho (HOME-001 - Implementação básica, apesar de BLOCKED)
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
        title: const Text('MiM Pedir'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Descubra o sabor de hoje!',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            // 2. Filtros de Culinária (Atividade 1)
            CuisineFilterWidget(),
            const SizedBox(height: 20),
            // 3. Banner Promocional (Atividade 2)
            const BannerCarouselWidget(),
            const SizedBox(height: 20),
            // 4. Listagem de Restaurantes (HOME-005 - Atividade 3)
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Últimos Restaurantes',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            ...restaurants.map((restaurant) {
              return RestaurantCardWidget(
                name: restaurant['name'],
                category: restaurant['category'],
                rating: restaurant['rating'],
                imageUrl: restaurant['imageUrl'],
              );
            }).toList(),
            const SizedBox(height: 80), // Espaço para a navegação inferior
          ],
        ),
      ),
      // 5. Navegação Inferior (HOME-006 - Implementação básica, apesar de BLOCKED)
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Início',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box),
            label: 'Novo',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.tab),
            label: 'Tab', // Assumindo que "Tab" é um placeholder
          ),
        ],
        currentIndex: 0,
        selectedItemColor: Theme.of(context).primaryColor,
        onTap: (index) {
          // Lógica de navegação aqui
        },
      ),
    );
  }
}

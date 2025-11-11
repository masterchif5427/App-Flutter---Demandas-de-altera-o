import 'package:flutter/material.dart';

class BannerCarouselWidget extends StatefulWidget {
  const BannerCarouselWidget({super.key});

  @override
  State<BannerCarouselWidget> createState() => _BannerCarouselWidgetState();
}

class _BannerCarouselWidgetState extends State<BannerCarouselWidget> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  final List<String> banners = [
    'https://picsum.photos/id/237/800/300',
    'https://picsum.photos/id/238/800/300',
    'https://picsum.photos/id/239/800/300',
  ];

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      int next = _pageController.page!.round();
      if (_currentPage != next) {
        setState(() {
          _currentPage = next;
        });
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Implementação do Banner Promocional deslizável (Carrossel) (HOME-004 - Atividade 2)
    return Column(
      children: [
        SizedBox(
          height: 150,
          child: PageView.builder(
            controller: _pageController,
            itemCount: banners.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ClipRRect( // Uso do ClipRRect (sugerido na Atividade 2)
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.network(
                    banners[index],
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return const Center(child: CircularProgressIndicator());
                    },
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 10),
        // Indicadores de página ("bolinhas" de marcação - Atividade 2)
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: banners.map((url) {
            int index = banners.indexOf(url);
            return Container(
              width: 8.0,
              height: 8.0,
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle, // Uso do BoxShape.circle (sugerido na Atividade 2)
                color: _currentPage == index
                    ? Theme.of(context).primaryColor
                    : Colors.grey.shade300,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

import 'package:card_reorder/provider.dart' show Img, cardsProvider;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'
    show ConsumerWidget, WidgetRef;
import 'card.dart' show ImgCard;

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final cards = ref.watch(cardsProvider);
    return Scaffold(
      // appBar: AppBar(title: const Text('Card Reorder')),
      body: Center(
        child: SizedBox(
            width: size.width * .32,
            height: size.height * .9,
            child: Stack(children: [
              for (Img img in cards) ImgCard(img: img, size: size)
            ])),
      ),
    );
  }
}

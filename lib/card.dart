import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'
    show ConsumerWidget, WidgetRef;
import 'provider.dart' show Img, cardsProvider, lock;

class ImgCard extends ConsumerWidget {
  const ImgCard({super.key, required this.img});
  final Img img;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Align(
      alignment: img.align,
      child: MouseRegion(
        onHover: (_) async =>
            await ref.read(cardsProvider.notifier).update(img),
        child: TweenAnimationBuilder<double>(
          curve: Curves.easeInCubic,
          duration: const Duration(milliseconds: 300),
          tween: Tween<double>(begin: 0, end: 1),
          builder: (context, v, child) => Opacity(opacity: v, child: child!),
          child: SizedBox(
            width: 250,
            height: 350,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                img.path,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

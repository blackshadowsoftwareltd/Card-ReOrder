import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'
    show ConsumerWidget, WidgetRef;
import 'provider.dart' show Img, cardsProvider;

class ImgCard extends ConsumerWidget {
  const ImgCard({super.key, required this.img, required this.size});
  final Img img;
  final Size size;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Align(
      alignment: img.align,
      child: MouseRegion(
        onHover: (_) async =>
            await ref.read(cardsProvider.notifier).update(img),
        child: TweenAnimationBuilder<double>(
          curve: Curves.easeInCubic,
          duration: const Duration(milliseconds: 800),
          tween: Tween<double>(begin: 0, end: 1),
          builder: (context, v, child) => Opacity(opacity: v, child: child!),
          child: InkWell(
            onTap: () async =>
                await ref.read(cardsProvider.notifier).update(img),
            child: SizedBox(
              width: Platform.isAndroid || Platform.isIOS
                  ? size.width
                  : size.width * .18,
              height: size.height * .5,
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
      ),
    );
  }
}

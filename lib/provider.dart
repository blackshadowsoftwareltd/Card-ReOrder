import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final cardsProvider = NotifierProvider<_Cards, List<Img>>(_Cards.new);

class _Cards extends Notifier<List<Img>> {
  @override
  List<Img> build() => [
        Img('assets/flag.jpg', Alignment.bottomRight),
        Img('assets/al_aksa.jpg', Alignment.topCenter),
        Img('assets/bird.jpg', Alignment.centerLeft),
      ];
  Future<void> update(Img img) async {
    if (state.last == img) return;
    // state = [
    //   for (Img i in state)
    //     if (i.path != img.path) i,
    // ];
    state = [...state, img];
  }
}

class Img {
  final String path;
  final Alignment align;
  Img(this.path, this.align);
}

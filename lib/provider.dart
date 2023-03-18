import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'
    show NotifierProvider, Notifier;

final cardsProvider = NotifierProvider<_Cards, List<Img>>(_Cards.new);

class _Cards extends Notifier<List<Img>> {
  @override
  List<Img> build() => [
        Img('assets/flag.jpg', Alignment.bottomRight),
        Img('assets/al_aksa.jpg', Alignment.topCenter),
        Img('assets/heritage.jpg', Alignment.centerLeft),
      ];

  Future<void> update(Img img) async {
    if (state.last == img) return;
    state = [
      for (final x in state)
        if (x.path != img.path) x,
      img
    ];
  }
}

class Img {
  final String path;
  final Alignment align;
  Img(this.path, this.align);
}

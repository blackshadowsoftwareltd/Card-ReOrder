import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'
    show NotifierProvider, Notifier;

final cardsProvider = NotifierProvider<_Cards, List<Img>>(_Cards.new);

class _Cards extends Notifier<List<Img>> {
  @override
  List<Img> build() => [
        Img('assets/flag.jpg', Alignment.bottomRight, null),
        Img('assets/al_aksa.jpg', Alignment.topCenter, null),
        Img('assets/heritage.jpg', Alignment.centerLeft, null),
      ];

  Future<void> update(Img img) async {
    if (state.last == img) return;

    img = img.copyWith(time: DateTime.now());
    final list = [
      for (Img e in state)
        if (e.path == img.path) img else e
    ];
    list.sort((a, b) => a.time!.compareTo(b.time!));
    state = [...list];
  }
}

class Img {
  DateTime? time;
  final String path;
  final Alignment align;
  Img(this.path, this.align, this.time) {
    time = DateTime.now();
  }
  @override
  toString() => 'Img($path, $align, $time)';

  @override
  bool operator ==(Object other) => other is Img && time == other.time;

  @override
  int get hashCode => time.hashCode;
  Img copyWith({
    DateTime? time,
    String? path,
    Alignment? align,
  }) {
    return Img(
      path ?? this.path,
      align ?? this.align,
      time ?? this.time,
    );
  }
}

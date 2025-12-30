import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/gemini_service.dart';

final ringkasanProvider =
    StateNotifierProvider<RingkasanNotifier, RingkasanState>(
  (ref) => RingkasanNotifier(),
);

class RingkasanState {
  final bool loading;
  final String hasil;

  RingkasanState({this.loading = false, this.hasil = ""});
}

class RingkasanNotifier extends StateNotifier<RingkasanState> {
  RingkasanNotifier() : super(RingkasanState());

  Future<void> ringkasMateri(String materi) async {
    state = RingkasanState(loading: true);
    final hasil = await GeminiService.ringkas(materi);
    state = RingkasanState(loading: false, hasil: hasil);
  }
}

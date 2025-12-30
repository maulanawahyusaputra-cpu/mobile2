import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latihan/provider/gemini_provider.dart';
import '../providers/gemini_provider.dart';

class HomePage extends ConsumerWidget {
  HomePage({super.key});

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(ringkasanProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("AI Ringkasan Materi"),
        backgroundColor: Colors.indigo,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: controller,
              maxLines: 5,
              decoration: const InputDecoration(
                labelText: "Masukkan Materi",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                ref
                    .read(ringkasanProvider.notifier)
                    .ringkasMateri(controller.text);
              },
              child: const Text("Ringkas"),
            ),
            const SizedBox(height: 20),
            state.loading
                ? const CircularProgressIndicator()
                : Card(
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Text(state.hasil),
                    ),
                  )
          ],
        ),
      ),
    );
  }
}

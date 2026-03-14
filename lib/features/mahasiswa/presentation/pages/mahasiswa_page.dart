import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trying_flutter/core/constants/app_constants.dart';
import 'package:trying_flutter/features/mahasiswa/presentation/providers/mahasiswa_provider.dart';
import 'package:trying_flutter/features/mahasiswa/presentation/widgets/mahasiswa_widget.dart';

final mahasiswaSearchProvider = StateProvider.autoDispose<String>((ref) => '');

class MahasiswaPage extends ConsumerWidget {
  const MahasiswaPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(mahasiswaNotifierProvider);
    final query = ref.watch(mahasiswaSearchProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Mahasiswa'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh_rounded),
            onPressed: () => ref.invalidate(mahasiswaNotifierProvider),
          ),
        ],
      ),
      body: Column(
        children: [
          // Search bar
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              onChanged: (v) =>
                  ref.read(mahasiswaSearchProvider.notifier).state = v,
              decoration: InputDecoration(
                hintText: 'Cari nama atau email...',
                prefixIcon: const Icon(Icons.search_rounded),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 12, horizontal: 16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide(color: Colors.grey.shade200),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: const BorderSide(color: Color(0xFF667eea), width: 1.5),
                ),
              ),
            ),
          ),

          // List
          Expanded(
            child: state.when(
              loading: () =>
                  const Center(child: CircularProgressIndicator()),
              error: (e, s) => Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.error_outline,
                        size: 56, color: Colors.red),
                    const SizedBox(height: 12),
                    Text('Error: ${e.toString()}',
                        textAlign: TextAlign.center),
                    const SizedBox(height: 12),
                    ElevatedButton.icon(
                      onPressed: () =>
                          ref.invalidate(mahasiswaNotifierProvider),
                      icon: const Icon(Icons.refresh),
                      label: const Text('Coba Lagi'),
                    ),
                  ],
                ),
              ),
              data: (list) {
                final filtered = query.isEmpty
                    ? list
                    : list
                        .where((m) =>
                            m.name
                                .toLowerCase()
                                .contains(query.toLowerCase()) ||
                            m.email
                                .toLowerCase()
                                .contains(query.toLowerCase()))
                        .toList();

                if (filtered.isEmpty) {
                  return const Center(
                    child: Text('Tidak ditemukan',
                        style: TextStyle(color: Colors.grey)),
                  );
                }

                return RefreshIndicator(
                  onRefresh: () async =>
                      ref.invalidate(mahasiswaNotifierProvider),
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    itemCount: filtered.length,
                    itemBuilder: (ctx, i) {
                      final colors = AppConstants.dashboardGradients[
                          i % AppConstants.dashboardGradients.length];
                      return MahasiswaCard(
                        mahasiswa: filtered[i],
                        gradientColors: colors,
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
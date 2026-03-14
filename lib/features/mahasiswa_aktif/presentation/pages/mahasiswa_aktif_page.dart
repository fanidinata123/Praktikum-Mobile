import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trying_flutter/core/constants/app_constants.dart';
import 'package:trying_flutter/features/mahasiswa_aktif/presentation/providers/mahasiswa_aktif_provider.dart';
import 'package:trying_flutter/features/mahasiswa_aktif/presentation/widgets/mahasiswa_aktif_widget.dart';

class MahasiswaAktifPage extends ConsumerWidget {
  const MahasiswaAktifPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(mahasiswaAktifNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mahasiswa Aktif'),
        backgroundColor: const Color(0xFFf093fb),
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh_rounded),
            onPressed: () => ref.invalidate(mahasiswaAktifNotifierProvider),
          ),
        ],
      ),
      body: state.when(
        loading: () => const Center(
          child: CircularProgressIndicator(color: Color(0xFFf093fb)),
        ),
        error: (e, s) => Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.error_outline, size: 56, color: Colors.red),
              const SizedBox(height: 12),
              Text('Error: ${e.toString()}', textAlign: TextAlign.center),
              const SizedBox(height: 12),
              ElevatedButton.icon(
                onPressed: () =>
                    ref.invalidate(mahasiswaAktifNotifierProvider),
                icon: const Icon(Icons.refresh),
                label: const Text('Coba Lagi'),
              ),
            ],
          ),
        ),
        data: (list) => RefreshIndicator(
          onRefresh: () async => ref.invalidate(mahasiswaAktifNotifierProvider),
          child: ListView.builder(
            padding: const EdgeInsets.all(14),
            itemCount: list.length,
            itemBuilder: (ctx, i) {
              final colors = AppConstants.dashboardGradients[
                  i % AppConstants.dashboardGradients.length];
              return MahasiswaAktifCard(
                data: list[i],
                gradientColors: colors,
              );
            },
          ),
        ),
      ),
    );
  }
}
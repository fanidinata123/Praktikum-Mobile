import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trying_flutter/core/widgets/widgets.dart';
import 'package:trying_flutter/core/constants/app_constants.dart';
import 'package:trying_flutter/features/dosen/presentation/providers/dosen_provider.dart';
import 'package:trying_flutter/features/dosen/presentation/widgets/dosen_widget.dart';

/// Halaman Data Dosen — menampilkan list dosen dari repository
class DosenPage extends ConsumerWidget {
  const DosenPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch state dosen dari provider
    final dosenState = ref.watch(dosenNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Dosen'),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh_rounded),
            onPressed: () {
              // Invalidate provider agar data di-reload ulang
              ref.invalidate(dosenNotifierProvider);
            },
            tooltip: 'Refresh',
          ), // IconButton
        ],
      ), // AppBar
      body: dosenState.when(
        // State: Loading — tampilkan indikator loading
        loading: () => const LoadingWidget(),

        // State: Error — tampilkan pesan error dengan tombol retry
        error:
            (error, stack) => CustomErrorWidget(
              message: 'Gagal memuat data dosen: ${error.toString()}',
              onRetry: () {
                ref.read(dosenNotifierProvider.notifier).refresh();
              },
            ), // CustomErrorWidget

        // State: Data berhasil — tampilkan list dosen
        data: (dosenList) {
          return RefreshIndicator(
            onRefresh: () async {
              ref.invalidate(dosenNotifierProvider);
            },
            child: ListView.builder(
              padding: const EdgeInsets.all(AppConstants.paddingMedium),
              itemCount: dosenList.length,
              itemBuilder: (context, index) {
                final dosen = dosenList[index];
                // Pilih warna gradient berdasarkan index
                final gradientColors =
                    AppConstants.dashboardGradients[index %
                        AppConstants.dashboardGradients.length];

                return ModernDosenCard(
                  dosen: dosen,
                  gradientColors: gradientColors,
                  onTap: () {
                    // Navigasi ke detail dosen (opsional)
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Detail: ${dosen.nama}'),
                        duration: const Duration(seconds: 1),
                      ),
                    );
                  },
                );
              },
            ), // ListView.builder
          ); // RefreshIndicator
        },
      ), // dosenState.when
    ); // Scaffold
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trying_flutter/features/dosen/presentation/providers/dosen_provider.dart';
import 'package:trying_flutter/features/dosen/presentation/widgets/dosen_widget.dart';

class DosenPage extends ConsumerWidget {
  const DosenPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dosenState = ref.watch(dosenNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Dosen'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh_rounded),
            onPressed: () => ref.read(dosenNotifierProvider.notifier).refresh(),
            tooltip: 'Refresh',
          ),
        ],
      ),
      body: dosenState.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.error_outline, size: 56, color: Colors.red),
              const SizedBox(height: 12),
              Text(
                'Error: ${error.toString()}',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              ElevatedButton.icon(
                onPressed: () =>
                    ref.read(dosenNotifierProvider.notifier).refresh(),
                icon: const Icon(Icons.refresh),
                label: const Text('Coba Lagi'),
              ),
            ],
          ),
        ),
        data: (dosenList) => DosenListView(
          dosenList: dosenList,
          onRefresh: () =>
              ref.read(dosenNotifierProvider.notifier).refresh(),
          useModernCard: true,
        ),
      ),
    );
  }
}
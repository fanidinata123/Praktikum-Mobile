import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trying_flutter/features/mahasiswa/data/models/mahasiswa_model.dart';
import 'package:trying_flutter/features/mahasiswa/data/repositories/mahasiswa_repository.dart';

/// Provider untuk instance MahasiswaRepository
final mahasiswaRepositoryProvider = Provider<MahasiswaRepository>(
  (ref) => MahasiswaRepository(),
);

/// StateNotifier untuk mengelola state list mahasiswa
class MahasiswaNotifier
    extends StateNotifier<AsyncValue<List<MahasiswaModel>>> {
  final MahasiswaRepository _repository;

  MahasiswaNotifier(this._repository) : super(const AsyncValue.loading()) {
    loadMahasiswaList();
  }

  Future<void> loadMahasiswaList() async {
    state = const AsyncValue.loading();
    try {
      final data = await _repository.getMahasiswaList();
      state = AsyncValue.data(data);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> refresh() async => await loadMahasiswaList();
}

/// Provider utama mahasiswa — autoDispose agar memory dibersihkan saat tidak dipakai
final mahasiswaNotifierProvider = StateNotifierProvider.autoDispose<
    MahasiswaNotifier, AsyncValue<List<MahasiswaModel>>>((ref) {
  return MahasiswaNotifier(ref.watch(mahasiswaRepositoryProvider));
});
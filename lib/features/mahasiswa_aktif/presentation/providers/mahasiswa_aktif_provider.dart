import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trying_flutter/features/mahasiswa_aktif/data/models/mahasiswa_aktif_model.dart';
import 'package:trying_flutter/features/mahasiswa_aktif/data/repositories/mahasiswa_aktif_repository.dart';

final mahasiswaAktifRepositoryProvider = Provider<MahasiswaAktifRepository>(
  (ref) => MahasiswaAktifRepository(),
);

class MahasiswaAktifNotifier
    extends StateNotifier<AsyncValue<List<MahasiswaAktifModel>>> {
  final MahasiswaAktifRepository _repository;

  MahasiswaAktifNotifier(this._repository) : super(const AsyncValue.loading()) {
    loadData();
  }

  Future<void> loadData() async {
    state = const AsyncValue.loading();
    try {
      final data = await _repository.getData();
      state = AsyncValue.data(data);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> refresh() async => await loadData();
}

final mahasiswaAktifNotifierProvider = StateNotifierProvider.autoDispose<
    MahasiswaAktifNotifier,
    AsyncValue<List<MahasiswaAktifModel>>>((ref) {
  return MahasiswaAktifNotifier(ref.watch(mahasiswaAktifRepositoryProvider));
});
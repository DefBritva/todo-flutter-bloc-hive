part of 'archive_bloc.dart';

sealed class ArchiveState extends Equatable {
  final List<Note> archive;
  const ArchiveState({required this.archive});
  @override
  List<Object?> get props => [archive];
  ArchiveState clone({List<Note>? archive});
}

final class ArchivePageState extends ArchiveState {
  const ArchivePageState({required super.archive});

  @override
  ArchivePageState clone({
    List<Note>? archive,
  }) {
    return ArchivePageState(archive: archive ?? this.archive);
  }
}

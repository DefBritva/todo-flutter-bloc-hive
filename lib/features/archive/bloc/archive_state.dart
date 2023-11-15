part of 'archive_bloc.dart';

sealed class ArchiveState extends Equatable {
  const ArchiveState();
}

final class ArchiveInitial extends ArchiveState {
  @override
  List<Object?> get props => [];
}

final class ArchivePageState extends ArchiveState {
  final List<Note> archive;
  const ArchivePageState(this.archive);

  @override
  List<Object?> get props => [archive];
}

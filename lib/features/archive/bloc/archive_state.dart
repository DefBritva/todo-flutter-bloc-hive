part of 'archive_bloc.dart';

sealed class ArchiveState extends Equatable {
  final List<Note> archive;
  const ArchiveState({required this.archive});
  @override
  List<Object?> get props => [archive];
}

final class ArchiveInitial extends ArchiveState {
  const ArchiveInitial({required super.archive});
}

final class ArchivePageState extends ArchiveState {
  const ArchivePageState({required super.archive});
}

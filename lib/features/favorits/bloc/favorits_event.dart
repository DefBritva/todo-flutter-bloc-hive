part of 'favorits_bloc.dart';

sealed class FavoritsEvent extends Equatable {
  const FavoritsEvent();
}

final class CompleteFavoriteTask extends FavoritsEvent {
  final int taskIndex;

  const CompleteFavoriteTask(this.taskIndex);

  @override
  List<Object?> get props => [taskIndex];
}

final class UnfavoriteTask extends FavoritsEvent {
  final int noteIndex;

  const UnfavoriteTask(this.noteIndex);

  @override
  List<Object?> get props => [noteIndex];
}

final class DeleteFavoritePressed extends FavoritsEvent {
  final int indexToDelete;
  const DeleteFavoritePressed({required this.indexToDelete});

  @override
  List<Object?> get props => [indexToDelete];
}

final class DoneFavoriteTask extends FavoritsEvent {
  final int index;

  const DoneFavoriteTask(
    this.index,
  );

  @override
  List<Object?> get props => [index];
}

final class FavoritesOpen extends FavoritsEvent {
  @override
  List<Object?> get props => [];
}

final class ArchiveFavoriteTask extends FavoritsEvent {
  final int index;

  const ArchiveFavoriteTask(this.index);

  @override
  List<Object?> get props => [index];
}

final class DeleteAllFavoritesTasks extends FavoritsEvent {
  @override
  List<Object?> get props => [];
}

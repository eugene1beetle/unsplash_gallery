part of 'image_bloc.dart';

enum Status {
  initial,
  fetching,
  success,
  failure,
}

class ImageState extends Equatable {
  const ImageState({
    this.status = Status.initial,
    this.images = const <UnsplashImage>[],
    this.hasReachedMax = false,
    this.currentPage = 1,
  });

  final Status status;
  final List<UnsplashImage> images;
  final bool hasReachedMax;
  final int currentPage;

  ImageState copyWith({
    Status? status,
    List<UnsplashImage>? images,
    bool? hasReachedMax,
    int? currentPage,
  }) {
    return ImageState(
      status: status ?? this.status,
      images: images ?? this.images,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      currentPage: currentPage ?? this.currentPage,
    );
  }

  @override
  String toString() {
    return 'ImageState{status: $status, images: $images, hasReachedMax: $hasReachedMax, currentPage: $currentPage}';
  }

  @override
  List<Object> get props => [status, images, hasReachedMax, currentPage];
}

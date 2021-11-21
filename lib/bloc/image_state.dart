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
  });

  final Status status;
  final List<UnsplashImage> images;
  final bool hasReachedMax;

  ImageState copyWith({
    Status? status,
    List<UnsplashImage>? images,
    bool? hasReachedMax,
  }) {
    return ImageState(
      status: status ?? this.status,
      images: images ?? this.images,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  String toString() {
    return 'ImageState{status: $status, images: $images, hasReachedMax: $hasReachedMax}';
  }

  @override
  List<Object> get props => [];
}

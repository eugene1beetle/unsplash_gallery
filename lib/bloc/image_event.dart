part of 'image_bloc.dart';

abstract class ImageEvent extends Equatable {
  const ImageEvent();
}

class FetchImages extends ImageEvent {
  @override
  List<Object> get props => [];
}
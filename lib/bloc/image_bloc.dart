import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:unsplash_gallery/api/unsplash_api.dart';

import 'package:unsplash_gallery/model/unsplash_image.dart';

part 'image_event.dart';

part 'image_state.dart';

class ImageBloc extends Bloc<ImageEvent, ImageState> {
  ImageBloc() : super(const ImageState()) {
    on<FetchImages>(_onFetchImages);
  }

  Future<void> _onFetchImages(
      FetchImages event, Emitter<ImageState> emit) async {
    emit(state.copyWith(status: Status.fetching));
    try {
      final images = await UnsplashApi.fetchImages();
      emit(state.copyWith(
        status: Status.success,
        images: [...state.images, ...images],
      ));
    } catch (e) {
      emit(state.copyWith(status: Status.failure));
    }
  }
}

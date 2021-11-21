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
    if (state.hasReachedMax) return;
    emit(state.copyWith(status: Status.fetching, hasReachedMax: true));
    try {
      final images = await UnsplashApi.fetchImages(page: state.currentPage);
      emit(state.copyWith(
        status: Status.success,
        images: [...state.images, ...images],
        currentPage: state.currentPage + 1,
        hasReachedMax: false,
      ));
    } catch (e) {
      emit(state.copyWith(status: Status.failure));
    }
  }
}

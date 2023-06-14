import 'package:api_handling_bloc/Data/Models/Repositories/post_repo.dart';
import 'package:api_handling_bloc/Data/Models/post_model.dart';
import 'package:api_handling_bloc/Logic/Cubits/PostCubit/post_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit() : super(PostLoadingState()) {
    fetchPost();
  }
  PostRepository postrepo = PostRepository();
  void fetchPost() async {
    try {
      List<PostModel> posts = await postrepo.fetchPost();
      emit(PostLoadedState(posts));
    } catch (e) {
      emit(PostErrorState(e.toString()));
    }
  }
}

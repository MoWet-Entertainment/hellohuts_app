
import 'package:hellohuts_app/models/test.dart';
import 'package:hellohuts_app/states/app_state.dart';

class PopupState extends AppState {
  FeedModel _model;
  set setFeedModel(FeedModel model) {
    this._model = model;
  }

  void  handleShareClick() {
    //TODO: Add Share API Here
    print("user wants to share ${_model.postTitle} post");
  }

  void handleNotIntersetedClick() {
    //TODO: Reduce the relative rating of this tagged post from User Suggestions by k factor
    print("user doesnt like ${_model.postTitle} post");
  }

  void handlePostReportClick() {
    //TODO: Handle reporting functionality
    print("user wants to report ${_model.postTitle} post");
  }

  void handleAddToBoard() {
    //TODO: Handle Adding the post to the user board
    print("user wants to add  ${_model.postTitle} post to board");
  }
}

import 'package:hellohuts_app/constants/mock1.dart';
import 'package:hellohuts_app/models/dashboard/documents_model/documents_model.dart';
import 'package:hellohuts_app/states/app_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DocumentState extends AppState {
  DocumentsModel _documentsModel;

  Future<DocumentsModel> get documentsModel async {
    if (_documentsModel == null) {
      return initDocumentsModel();
    }
    return _documentsModel;
  }

  Future<DocumentsModel> initDocumentsModel() async {
     DocumentsModel model =
        DocumentsModel.fromJson(Mock.documents);
    return Future.delayed(Duration(seconds: 3), () {
      _documentsModel = model;
      return model;
    });
  }
}

final _documentsState = Provider((ref) => DocumentState());
final documentStateProvider =
    FutureProvider<DocumentsModel>((ref) async {
  final model = ref.read(_documentsState);
  return model.documentsModel;
});

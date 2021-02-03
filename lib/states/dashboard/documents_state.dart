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
    DocumentsModel model = DocumentsModel.fromJson(Mock.documents);
    _documentsModel = model;
    print(model.toString());
    return Future.delayed(Duration(seconds: 3), () {
      return model;
    });
  }
}

final documentState = Provider((ref) => DocumentState());
final documentsStateProvider = FutureProvider<DocumentsModel>((ref) async {
  final model = ref.read(documentState);
  return model.documentsModel;
});

import 'dart:convert';

import 'package:hellohuts_app/constants/json_constants.dart';


List<File> fileFromJson(String str) {
    final jsonData = json.decode(str);
    return new List<File>.from(jsonData.map((x) => File.fromJson(x)));
}

String fileToJson(List<File> data) {
    final dyn = new List<dynamic>.from(data.map((x) => x.toJson()));
    return json.encode(dyn);
}

class File {
    String fileName;
    DateTime dateModified;
    int size;

    File({
        this.fileName,
        this.dateModified,
        this.size,
    });

    factory File.fromJson(Map<String, dynamic> json) {
      
      return new File(
        fileName: json[JsonConstants.fileName],
        dateModified: DateTime.parse(json[JsonConstants.updatedAt]),
        size: json[JsonConstants.size],
    );
    }

    Map<String, dynamic> toJson() => {
        JsonConstants.fileName: fileName,
        JsonConstants.updatedAt: dateModified,
        JsonConstants.size: size,
    };
}
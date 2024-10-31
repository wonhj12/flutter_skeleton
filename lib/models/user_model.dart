import 'package:flutter/material.dart';

class UserModel with ChangeNotifier {
  /// 사용자 이름
  String? name;

  UserModel({
    this.name,
  });

  /// 모델 데이터를 초기화하는 함수
  void reset() {
    name = null;
  }

  /// 이름 설정하는 함수
  void setName(String name) {
    this.name = name;
  }

  // 모델 프린트 형식
  @override
  String toString() {
    return 'name: $name';
  }
}

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tdd_project/password_generator.dart';

import 'test_helper.mocks.dart';

void main() {
  late PassWord password;
  late MockPassWord mockPassWord;
  setUp(
    () {
      password = PassWord();
      mockPassWord = MockPassWord();
    },
  );
  group('genPwd', () {
    const String goodPassword = 'uTop58cNq';

    test(
      'doit retourner "Error" si le nombre entré est inférieur à 8',
      () async {
        when(mockPassWord.genPwd(any)).thenReturn('Error');

        final result = password.genPwd(3);

        expect(result, 'Error');
      },
    );
    test(
      'doit retourner un mot de passe dont la taille est égale au paramètre entré',
      () async {
        when(mockPassWord.genPwd(any)).thenReturn(goodPassword);

        final result = password.genPwd(9);

        expect(result.length, goodPassword.length);
      },
    );
    test(
      'doit contenir au moins une lettre en minuscule',
      () async {
        when(mockPassWord.genPwd(any)).thenReturn(goodPassword);

        final result = password.genPwd(9);

        expect(result, contains(RegExp('[a-z]')));
      },
    );

    test(
      'doit contenir au moins une lettre en majuscule',
      () async {
        when(mockPassWord.genPwd(any)).thenReturn(goodPassword);

        final result = password.genPwd(9);

        expect(result, contains(RegExp('[A-Z]')));
      },
    );

    test(
      'doit contenir au moins un chiffre',
      () async {
        when(mockPassWord.genPwd(any)).thenReturn(goodPassword);

        final result = password.genPwd(9);

        expect(result, contains(RegExp('[0-9]')));
      },
    );
  });
}

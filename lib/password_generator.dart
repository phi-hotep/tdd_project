import 'dart:math';

class PassWord {
  String genPwd(int passwordLenght) {
    if (passwordLenght < 8) {
      return 'Error';
    } else {
      var charMin = 'abcdefghijklmnopqrstuvwxyz';
      var charMaj = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
      var charNum = '0123456789';
      var char = '$charMin$charMaj$charNum';
      return List<dynamic>.generate(passwordLenght, (index) {
        return char[Random.secure().nextInt(char.length)];
      }).join('');
    }
  }
}

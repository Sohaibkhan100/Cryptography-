class RailFenceCipher {
  static String encrypt(String text, int rails) {
    List<StringBuffer> fence = List.generate(rails, (index) => StringBuffer());
    int rail = 0;
    bool down = false;

    for (int i = 0; i < text.length; i++) {
      fence[rail].write(text[i]);

      if (rail == 0 || rail == rails - 1) {
        down = !down;
      }

      rail += down ? 1 : -1;
    }

    String encryptedText = '';
    for (int i = 0; i < rails; i++) {
      encryptedText += fence[i].toString();
    }

    return encryptedText;
  }

  static String decrypt(String text, int rails) {
    List<String> result = List.filled(text.length, '');

    int n = text.length;
    int index = 0;

    for (int rail = 0; rail < rails; rail++) {
      int stepDown = 2 * (rails - rail - 1);
      int stepUp = 2 * rail;

      bool down = false;
      int i = rail;
      while (i < n) {
        result[i] = text[index++];
        if (rail == 0 || rail == rails - 1) {
          i += 2 * (rails - 1);
        } else if (down) {
          i += stepDown;
          down = false;
        } else {
          i += stepUp;
          down = true;
        }
      }
    }

    return result.join('');
  }
}

void main() {
  String text = "Sohaib khan";
  int rails = 3;

  String encryptedText = RailFenceCipher.encrypt(text, rails);
  print("Encrypted text: $encryptedText");

  String decryptedText = RailFenceCipher.decrypt(encryptedText, rails);
  print("Decrypted text: $decryptedText");
}

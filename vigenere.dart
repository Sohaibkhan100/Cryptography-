void Encrypter(String plainText, String key) {
  const Keytable = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
  String encryptedText = '';
  int keyIndex = 0;

  for (int i = 0; i < plainText.length; i++) {
    if (plainText[i] == ' ') {
      encryptedText += ' ';
      continue;
    }
    int charIndex = Keytable.indexOf(plainText[i].toUpperCase());
    int keyCharIndex = Keytable.indexOf(key[keyIndex].toUpperCase());
    int encryptedIndex = (charIndex + keyCharIndex) % Keytable.length;
    encryptedText += Keytable[encryptedIndex];
    // Move to the next character in the key
    keyIndex = (keyIndex + 1) % key.length;
  }

  print("Original text: $plainText");
  print("Encrypted text: $encryptedText");

  Decrypter(encryptedText, key);
}

void Decrypter(String encryptedText, String key) {
  const Keytable = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
  String decryptedText = '';
  int keyIndex = 0;

  for (int i = 0; i < encryptedText.length; i++) {
    if (encryptedText[i] == ' ') {
      decryptedText += ' ';
      continue;
    }
    int charIndex = Keytable.indexOf(encryptedText[i].toUpperCase());
    int keyCharIndex = Keytable.indexOf(key[keyIndex].toUpperCase());
    int decryptedIndex = (charIndex - keyCharIndex) % Keytable.length;
    // Handling negative indices
    if (decryptedIndex < 0) {
      decryptedIndex += Keytable.length;
    }
    decryptedText += Keytable[decryptedIndex];
    // Move to the next character in the key
    keyIndex = (keyIndex + 1) % key.length;
  }

  print("Decrypted text: ${decryptedText.toLowerCase()}");
}

void main() {
  String text = "world";
  String key = "happy";
  Encrypter(text, key);
}

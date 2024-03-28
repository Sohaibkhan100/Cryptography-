void Encrypter(String plainText, int shift) {
  const Keytable = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
  String encryptedText = '';

  for (int i = 0; i < plainText.length; i++) {
    if (plainText[i] == ' ') {
      encryptedText += ' ';
      continue;
    }
    int charIndex = Keytable.indexOf(plainText[i].toUpperCase());
    int encryptedIndex = (charIndex + shift) % Keytable.length;
    encryptedText += Keytable[encryptedIndex];
  }
  print("Original text: $plainText");
  print("Encrypted text: $encryptedText");

  Decrypter(encryptedText, shift);
 
}

void Decrypter(String encryptedText, int shift) {
  const Keytable = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
  String decryptedText = '';

  for (int i = 0; i < encryptedText.length; i++) {
    if (encryptedText[i] == ' ') {
      decryptedText += ' ';
      continue;
    }
    int charIndex = Keytable.indexOf(encryptedText[i].toUpperCase());
    int decryptedIndex = (charIndex - shift) % Keytable.length;
    // Handling negative indices
    if (decryptedIndex < 0) {
      decryptedIndex += Keytable.length;
    }
    decryptedText += Keytable[decryptedIndex];
  }

  print("Decrypted text: ${decryptedText.toLowerCase()}");
}

void main() {
  String text = "sohaibKhan";
  int shift = 3;
  Encrypter(text, shift);
  

}

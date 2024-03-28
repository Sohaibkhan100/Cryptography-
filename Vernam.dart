import 'dart:math';

String vernamEncrypt(String plainText, String oneTimePad) {
  if (plainText.length != oneTimePad.length) {
    throw Exception("Plain text and one-time pad length must be equal.");
  }

  String encryptedText = '';

  for (int i = 0; i < plainText.length; i++) {
    // Convert characters to ASCII values and perform bitwise XOR operation
    int encryptedChar = plainText.codeUnitAt(i) ^ oneTimePad.codeUnitAt(i);
    encryptedText += String.fromCharCode(encryptedChar);
  }

  return encryptedText;
}

String vernamDecrypt(String encryptedText, String oneTimePad) {
  if (encryptedText.length != oneTimePad.length) {
    throw Exception("Encrypted text and one-time pad length must be equal.");
  }

  String decryptedText = '';

  for (int i = 0; i < encryptedText.length; i++) {
    // Convert characters to ASCII values and perform bitwise XOR operation
    int decryptedChar = encryptedText.codeUnitAt(i) ^ oneTimePad.codeUnitAt(i);
    decryptedText += String.fromCharCode(decryptedChar);
  }

  return decryptedText;
}

void main() {
  String text = "hello";
  String oneTimePad = generateOneTimePad(text.length);
  
  print("Original text: $text");
  print("One-time pad: $oneTimePad");
  
  String encryptedText = vernamEncrypt(text, oneTimePad);
  print("Encrypted text: $encryptedText");
  
  String decryptedText = vernamDecrypt(encryptedText, oneTimePad);
  print("Decrypted text: $decryptedText");
}

String generateOneTimePad(int length) {
  String alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
  Random random = Random();
  String pad = '';
  for (int i = 0; i < length; i++) {
    pad += alphabet[random.nextInt(alphabet.length)];
  }
  return pad;
}

class MorseCode {
  static Map<String, String> _codeMap = {
    'A': '.-', 'B': '-...', 'C': '-.-.', 'D': '-..', 'E': '.', 'F': '..-.', 'G': '--.', 'H': '....', 'I': '..', 'J': '.---',
    'K': '-.-', 'L': '.-..', 'M': '--', 'N': '-.', 'O': '---', 'P': '.--.', 'Q': '--.-', 'R': '.-.', 'S': '...', 'T': '-',
    'U': '..-', 'V': '...-', 'W': '.--', 'X': '-..-', 'Y': '-.--', 'Z': '--..',
    '0': '-----', '1': '.----', '2': '..---', '3': '...--', '4': '....-', '5': '.....', '6': '-....', '7': '--...', '8': '---..', '9': '----.',
    '.': '.-.-.-', ',': '--..--', '?': '..--..', "'": '.----.', '!': '-.-.--', '/': '-..-.', '(': '-.--.', ')': '-.--.-', '&': '.-...', ':': '---...',
    ';': '-.-.-.', '=': '-...-', '+': '.-.-.', '-': '-....-', '_': '..--.-', '"': '.-..-.', '\$': '...-..-', '@': '.--.-.'
  };

  static Map<String, String> _reverseCodeMap = Map.fromEntries(_codeMap.entries.map((entry) => MapEntry(entry.value, entry.key)));

  static String encrypt(String text) {
    text = text.toUpperCase();
    List<String> chars = text.split('');
    List<String> morseCodeList = chars.map((char) => _codeMap[char] ?? '').toList();
    return morseCodeList.join(' ');
  }

  static String decrypt(String morseCode) {
    List<String> codeWords = morseCode.split(' ');
    List<String> chars = codeWords.map((code) => _reverseCodeMap[code] ?? '').toList();
    return chars.join('');
  }
}

void main() {
  String text = "Sohaib khan";
  String encryptedText = MorseCode.encrypt(text);
  print("Encrypted text: $encryptedText");

  String decryptedText = MorseCode.decrypt(encryptedText);
  print("Decrypted text: $decryptedText");
}

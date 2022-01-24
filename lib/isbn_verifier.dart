/// This [isValid] function verifies whether a given String is a valid ISBN or not
///
/// The formula used to verify the String is as follows:
/// (x1 * 10 + x2 * 9 + x3 * 8 + x4 * 7 + x5 * 6 + x6 * 5 + x7 * 4 + x8 * 3 + x9 * 2 + x10 * 1) mod 11 == 0
/// Throws an [Illegal]
bool isValid(String isbnString) {
  if (isbnString.length != 10) {
    return false;
  }

  List<String> cleanString = isbnString.replaceAll("-", "").split("");
  List<int> isbnNums = List.empty(growable: true);
  for (var i = 0; i < cleanString.length; i++) {
    var str = cleanString[i];
    int? num = int.tryParse(str);

    // If [num] is null, then it could not have been parsed to a number
    // If [str] is an X, it's good, otherwise, return _false_
    if (num == null && str != "X") {
      return false;
    } else if (num != null) {
      isbnNums.add(num);
    } else {
      isbnNums.add(10);
    }
  }

  return false;
}

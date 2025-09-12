


import 'Commons.dart';

/// A class that converts an amount in Indian currency to words.
class AmountToWords {
  /// A map that stores the words corresponding to the digits in Indian currency (0-19, 20, 30, 40, 50, 60, 70, 80, 90).
  final Map<int, String> _words = {
    0: '',
    1: 'One',
    2: 'Two',
    3: 'Three',
    4: 'Four',
    5: 'Five',
    6: 'Six',
    7: 'Seven',
    8: 'Eight',
    9: 'Nine',
    10: 'Ten',
    11: 'Eleven',
    12: 'Twelve',
    13: 'Thirteen',
    14: 'Fourteen',
    15: 'Fifteen',
    16: 'Sixteen',
    17: 'Seventeen',
    18: 'Eighteen',
    19: 'Nineteen',
    20: 'Twenty',
    30: 'Thirty',
    40: 'Forty',
    50: 'Fifty',
    60: 'Sixty',
    70: 'Seventy',
    80: 'Eighty',
    90: 'Ninety'
  };

  final Map<int, String> _words1 = {
    0: '',
    1: '1',
    2: '2',
    3: '3',
    4: '4',
    5: '5',
    6: '6',
    7: '7',
    8: '8',
    9: '9',
    10: '10',
    11: '11',
    12: '12',
    13: '13',
    14: '14',
    15: '15',
    16: '16',
    17: '17',
    18: '18',
    19: '19',
    20: '20',
    30: '30',
    40: '40',
    50: '50',
    60: '60',
    70: '70',
    80: '80',
    90: '90'
  };

  final List<String> _digits = ['', 'Hundred', 'Thousand', 'Lakh', 'Crore'];
  final List<String> _digits1 = ['', 'Hundred', 'k', 'L', 'Cr.'];

  // words
  String convertAmountToWords(double number, {bool ignoreDecimal = false}) {
    if (number < 0) {
      return "Zero";
    }
    if (number > 999999999) {
      return "Number is too large";
    }

    int wholeNumber = number.floor();
    int decimal = ((number - wholeNumber) * 100).round();
    String hundred;
    int digitsLength = wholeNumber.toString().length;
    int i = 0;
    List<String> str = [];
    while (i < digitsLength) {
      int divider = (i == 2) ? 10 : 100;
      int currentNumber = wholeNumber % divider;
      wholeNumber = wholeNumber ~/ divider;
      i += (divider == 10) ? 1 : 2;
      if (currentNumber > 0) {
        String plural = (str.isNotEmpty && currentNumber > 9) ? 's' : '';
        hundred = (str.length == 1 && str[0] != '') ? 'and ' : '';
        str.add((currentNumber < 21)
            ? '${_words[currentNumber]} ${_digits[str.length]}$plural $hundred'
            : '${_words[(currentNumber / 10).floor() * 10]} ${_words[currentNumber % 10]} ${_digits[str.length]}$plural $hundred');
      } else {
        str.add('');
      }
    }
    String rupees = str.reversed.join('');
    String paise;

    int paisaLength = decimal.toString().length;
    int j = 0;
    List<String> str2 = [];

    if (decimal > 0) {
      while (j < paisaLength) {
        int divider = (j == 2) ? 10 : 100;
        int currentNumber = decimal % divider;
        decimal = decimal ~/ divider;
        j += (divider == 10) ? 1 : 2;
        if (currentNumber > 0) {
          String plural = (str2.isNotEmpty && currentNumber > 9) ? 's' : '';
          hundred = (str2.length == 1 && str2[0] != '') ? 'and ' : '';
          str2.add((currentNumber < 21)
              ? '${_words[currentNumber]} ${_digits[str2.length]}$plural $hundred'
              : '${_words[(currentNumber / 10).floor() * 10]} ${_words[currentNumber % 10]} ${_digits[str2.length]}$plural $hundred');
        } else {
          str2.add('');
        }
      }
    } else {
      str2.add('');
    }

    paise = str2.reversed.join('');

    if (rupees == '') {
      rupees = 'Zero';
    }

    if (ignoreDecimal) {
      return '${rupees.trim()} (INR)';
    }

    return '${rupees.trim()} Rupees ${paise != '' ? ' and ${paise.trim()} Paise' : ''}';
  }

  String convertAmountToWordsShortForms(double number, {bool ignoreDecimal = false}) {
    if (number < 0) {
      return "Zero";
    }
    if (number > 999999999) {
      return "Number is too large";
    }
    int wholeNumber = number.floor();
    int decimal = ((number - wholeNumber) * 100).round();
    String hundred;
    int digitsLength = wholeNumber.toString().length;
    int i = 0;
    List<String> str = [];
    while (i < digitsLength) {
      int divider = (i == 2) ? 10 : 100;
      int currentNumber = wholeNumber % divider;
      wholeNumber = wholeNumber ~/ divider;
      i += (divider == 10) ? 1 : 2;
      if (currentNumber > 0) {
        String plural = (str.isNotEmpty && currentNumber > 9) ? '' : '';
        hundred = (str.length == 1 && str[0] != '') ? ' and ' : '';
        str.add((currentNumber < 21)
            ? '${_words[currentNumber]} ${_digits1[str.length]}$plural $hundred'
            : '${_words[(currentNumber / 10).floor() * 10]} ${_words[currentNumber % 10]} ${_digits1[str.length]}$plural $hundred');
      } else {
        str.add('');
      }
    }
    String rupees = str.reversed.join('');
    String paise;

    int paisaLength = decimal.toString().length;
    int j = 0;
    List<String> str2 = [];

    if (decimal > 0) {
      while (j < paisaLength) {
        int divider = (j == 2) ? 10 : 100;
        int currentNumber = decimal % divider;
        decimal = decimal ~/ divider;
        j += (divider == 10) ? 1 : 2;
        if (currentNumber > 0) {
          String plural = (str2.isNotEmpty && currentNumber > 9) ? 's' : '';
          hundred = (str2.length == 1 && str2[0] != '') ? ' and ' : '';
          str2.add((currentNumber < 21)
              ? '${_words[currentNumber]} ${_digits1[str2.length]}$plural $hundred'
              : '${_words[(currentNumber / 10).floor() * 10]} ${_words[currentNumber % 10]} ${_digits1[str2.length]}$plural $hundred');
        } else {
          str2.add('');
        }
      }
    } else {
      str2.add('');
    }

    paise = str2.reversed.join('');

    if (rupees == '') {
      rupees = 'Zero';
    }

    if (ignoreDecimal) {
      return '$rupees';
    }

    return '$rupees Rupees${paise != '' ? ' and $paise Paise' : ''}';
  }

  // numbers
  String convertAmountToWords1(double number, {bool ignoreDecimal = false}) {
    if (number < 0) {
      return "Zero";
    }
    if (number > 999999999) {
      return "Number is too large";
    }
    int wholeNumber = number.floor();
    int decimal = ((number - wholeNumber) * 100).round();
    String hundred;
    int digitsLength = wholeNumber.toString().length;
    int i = 0;
    List<String> str = [];

    printF("---------------------------------------------------");

    while (i < digitsLength) {
      int divider = (i == 2) ? 10 : 100;
      int currentNumber = wholeNumber % divider;
      wholeNumber = wholeNumber ~/ divider;
      i += (divider == 10) ? 1 : 2;
      if (currentNumber > 0) {
        String plural = (str.isNotEmpty && currentNumber > 9) ? 's' : '';
        hundred = (str.length == 1 && str[0] != '') ? 'and ' : '';

        str.add((currentNumber < 21)
            ? '${currentNumber} ${_digits[str.length]}$plural $hundred'
            : '${currentNumber} ${_digits[str.length]}$plural $hundred');
      } else {
        str.add('');
      }
    }

    String rupees = str.reversed.join('');
    String paise;

    int paisaLength = decimal.toString().length;
    int j = 0;
    List<String> str2 = [];

    if (decimal > 0) {
      while (j < paisaLength) {
        int divider = (j == 2) ? 10 : 100;
        int currentNumber = decimal % divider;
        decimal = decimal ~/ divider;
        j += (divider == 10) ? 1 : 2;
        if (currentNumber > 0) {
          String plural = (str2.isNotEmpty && currentNumber > 9) ? 's' : '';
          hundred = (str2.length == 1 && str2[0] != '') ? 'and ' : '';
          str2.add((currentNumber < 21)
              ? '${currentNumber} ${_digits[str2.length]}$plural $hundred'
              : '${currentNumber} ${_digits[str2.length]}$plural $hundred');
        } else {
          str2.add('');
        }
      }
    } else {
      str2.add('');
    }

    paise = str2.reversed.join('');

    if (rupees == '') {
      rupees = 'Zero';
    }

    if (ignoreDecimal) {
      return '${rupees.trim()} (INR)';
    }

    return '${rupees.trim()} Rupees${paise != '' ? ' and ${paise.trim()} Paise' : ''}';
  }

  // withhout suffixs
  String convertAmountToWords2(double number, {bool ignoreDecimal = false}) {
    if (number < 0) {
      return "Zero";
    }
    if (number > 999999999) {
      return "Number is too large";
    }
    int wholeNumber = number.floor();
    int decimal = ((number - wholeNumber) * 100).round();
    String hundred;
    int digitsLength = wholeNumber.toString().length;
    int i = 0;
    List<String> str = [];

    while (i < digitsLength) {
      int divider = (i == 2) ? 10 : 100;
      int currentNumber = wholeNumber % divider;
      wholeNumber = wholeNumber ~/ divider;
      i += (divider == 10) ? 1 : 2;
      if (currentNumber > 0) {
        String plural = (str.isNotEmpty && currentNumber > 9) ? '' : '';
        hundred = (str.length == 1 && str[0] != '') ? 'and ' : '';

        str.add((currentNumber < 21)
            ? '${currentNumber}\n${_digits[str.length]}$plural $hundred'
            : '${currentNumber}\n${_digits[str.length]}$plural $hundred');
      } else {
        str.add('');
      }
    }

    String rupees = str.reversed.join('');

    String paise;

    int paisaLength = decimal.toString().length;
    int j = 0;
    List<String> str2 = [];

    if (decimal > 0) {
      while (j < paisaLength) {
        int divider = (j == 2) ? 10 : 100;
        int currentNumber = decimal % divider;
        decimal = decimal ~/ divider;
        j += (divider == 10) ? 1 : 2;
        if (currentNumber > 0) {
          String plural = (str2.isNotEmpty && currentNumber > 9) ? '' : '';
          hundred = (str2.length == 1 && str2[0] != '') ? 'and ' : '';
          str2.add((currentNumber < 21)
              ? '${currentNumber} ${_digits[str2.length]}$plural $hundred'
              : '${currentNumber} ${_digits[str2.length]}$plural $hundred');
        } else {
          str2.add('');
        }
      }
    } else {
      str2.add('');
    }

    paise = str2.reversed.join('');

    if (rupees == '') {
      rupees = 'Zero';
    }

    if (ignoreDecimal) {
      return '${rupees.trim()} (INR)';
    }

    return '${rupees.trim()}';
  }

  String convertAmountToWordsShortForms1(double number, {bool ignoreDecimal = false}) {
    if (number < 0) {
      return "Zero";
    }
    if (number > 999999999) {
      return "Number is too large";
    }
    int wholeNumber = number.floor();
    int decimal = ((number - wholeNumber) * 100).round();
    String hundred;
    int digitsLength = wholeNumber.toString().length;
    int i = 0;
    List<String> str = [];
    while (i < digitsLength) {
      int divider = (i == 2) ? 10 : 100;
      int currentNumber = wholeNumber % divider;
      wholeNumber = wholeNumber ~/ divider;
      i += (divider == 10) ? 1 : 2;
      if (currentNumber > 0) {
        String plural = (str.isNotEmpty && currentNumber > 9) ? '' : '';
        hundred = (str.length == 1 && str[0] != '') ? ' and ' : '';
        str.add((currentNumber < 21)
            ? '${_words1[currentNumber]} ${_digits1[str.length]}$plural $hundred'
            : '${_words1[(currentNumber / 10).floor() * 10]} ${_words1[currentNumber % 10]} ${_digits1[str.length]}$plural $hundred');
      } else {
        str.add('');
      }
    }
    String rupees = str.reversed.join('');
    String paise;

    int paisaLength = decimal.toString().length;
    int j = 0;
    List<String> str2 = [];

    if (decimal > 0) {
      while (j < paisaLength) {
        int divider = (j == 2) ? 10 : 100;
        int currentNumber = decimal % divider;
        decimal = decimal ~/ divider;
        j += (divider == 10) ? 1 : 2;
        if (currentNumber > 0) {
          String plural = (str2.isNotEmpty && currentNumber > 9) ? 's' : '';
          hundred = (str2.length == 1 && str2[0] != '') ? ' and ' : '';
          str2.add((currentNumber < 21)
              ? '${_words1[currentNumber]} ${_digits1[str2.length]}$plural $hundred'
              : '${_words1[(currentNumber / 10).floor() * 10]} ${_words1[currentNumber % 10]} ${_digits1[str2.length]}$plural $hundred');
        } else {
          str2.add('');
        }
      }
    } else {
      str2.add('');
    }

    paise = str2.reversed.join('');

    if (rupees == '') {
      rupees = 'Zero';
    }

    if (ignoreDecimal) {
      return '$rupees';
    }

    return '$rupees Rupees${paise != '' ? ' and $paise Paise' : ''}';
  }

  // rupees and only format
  String convertAmountToWordsOnly(double number, {bool ignoreDecimal = false}) {
    if (number < 0) {
      return "Zero";
    }
    if (number > 999999999) {
      return "Number is too large";
    }

    int wholeNumber = number.floor();
    int decimal = ((number - wholeNumber) * 100).round();
    String hundred;
    int digitsLength = wholeNumber.toString().length;
    int i = 0;
    List<String> str = [];
    while (i < digitsLength) {
      int divider = (i == 2) ? 10 : 100;
      int currentNumber = wholeNumber % divider;
      wholeNumber = wholeNumber ~/ divider;
      i += (divider == 10) ? 1 : 2;
      if (currentNumber > 0) {
        String plural = (str.isNotEmpty && currentNumber > 9) ? 's' : '';
        hundred = (str.length == 1 && str[0] != '') ? 'and ' : '';
        str.add((currentNumber < 21)
            ? '${_words[currentNumber]} ${_digits[str.length]}$plural $hundred'
            : '${_words[(currentNumber / 10).floor() * 10]} ${_words[currentNumber % 10]} ${_digits[str.length]}$plural $hundred');
      } else {
        str.add('');
      }
    }
    String rupees = str.reversed.join('');
    String paise;

    int paisaLength = decimal.toString().length;
    int j = 0;
    List<String> str2 = [];

    if (decimal > 0) {
      while (j < paisaLength) {
        int divider = (j == 2) ? 10 : 100;
        int currentNumber = decimal % divider;
        decimal = decimal ~/ divider;
        j += (divider == 10) ? 1 : 2;
        if (currentNumber > 0) {
          String plural = (str2.isNotEmpty && currentNumber > 9) ? 's' : '';
          hundred = (str2.length == 1 && str2[0] != '') ? 'and ' : '';
          str2.add((currentNumber < 21)
              ? '${_words[currentNumber]} ${_digits[str2.length]}$plural $hundred'
              : '${_words[(currentNumber / 10).floor() * 10]} ${_words[currentNumber % 10]} ${_digits[str2.length]}$plural $hundred');
        } else {
          str2.add('');
        }
      }
    } else {
      str2.add('');
    }

    paise = str2.reversed.join('');

    if (rupees == '') {
      rupees = 'Zero';
    }

    printF(">>>rupees ${rupees}");

    if (ignoreDecimal) {
      return 'Rupees ${rupees.trim()} Only';
    }

    return 'Rupees ${rupees.trim()}${paise != '' ? 'and ${paise.trim()} Paise' : ''} Only';
  }
}

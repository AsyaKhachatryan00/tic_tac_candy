class Util {
  static String calculateWinner(List<String> data, int filed) {
    // Horizontal matches
    if (data[0] == data[1] && data[0] == data[2] && data[0] != '') {
      return data[0];
    }
    if (data[3] == data[4] && data[3] == data[5] && data[3] != '') {
      return data[3];
    }
    if (data[6] == data[7] && data[6] == data[8] && data[6] != '') {
      return data[6];
    }

    if (data[0] == data[3] && data[0] == data[6] && data[0] != '') {
      return data[0];
    }

    if (data[1] == data[4] && data[1] == data[7] && data[1] != '') {
      return data[1];
    }

    if (data[2] == data[5] && data[2] == data[8] && data[2] != '') {
      return data[2];
    }

    if (data[0] == data[4] && data[0] == data[8] && data[0] != '') {
      return data[0];
    }

    if (data[6] == data[4] && data[6] == data[2] && data[6] != '') {
      return data[6];
    }

    if (filed == 9) {
      return 'draw';
    }

    return '';
  }
}

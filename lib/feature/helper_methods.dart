bool isWhite(int index) {
  final int x = index %
      8; // . It is the remainder of index divided by 8 i.e. the column number.
  final int y = index ~/
      8; // . It is the integer division of index by 8 i.e. the row number.
  return (x + y) % 2 == 0;
}

bool isInBoard(int row, int col) {
  return row >= 0 && row < 8 && col >= 0 && col < 8;
}

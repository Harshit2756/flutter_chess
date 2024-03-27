import 'package:chess/components/piece.dart';

class Knight {
  void initialPosition(List<List<ChessPiece?>> newBoard) {
    // ~ Add the black knights
    newBoard[0][1] = ChessPiece(
      ChessPieceType.knight,
      false,
      'assets/Images/Knight_48.png',
    );
    newBoard[0][6] = ChessPiece(
      ChessPieceType.knight,
      false,
      'assets/Images/Knight_48.png',
    );
    // ~ Add the white knights
    newBoard[7][1] = ChessPiece(
      ChessPieceType.knight,
      true,
      'assets/Images/Knight_48.png',
    );
    newBoard[7][6] = ChessPiece(
      ChessPieceType.knight,
      true,
      'assets/Images/Knight_48.png',
    );
  }

  void validMoves(
      int row,
      int col,
      ChessPiece selectedPiece,
      List<List<ChessPiece?>> board,
      int direction,
      List<List<int>> candidateMoves) {}
}

import 'package:chess/components/piece.dart';

class King {
  void initialPosition(List<List<ChessPiece?>> newBoard) {
    // ~ Add the black king
    newBoard[0][4] = ChessPiece(
      ChessPieceType.king,
      false,
      'assets/Images/black/king.png',
    );
    // ~ Add the white king
    newBoard[7][4] = ChessPiece(
      ChessPieceType.king,
      true,
      'assets/Images/white/king.png',
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

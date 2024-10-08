import 'package:chess/components/piece.dart';

class Queen {
  void initialPosition(List<List<ChessPiece?>> newBoard) {
    // ~ Add the black queen
    newBoard[0][3] = ChessPiece(
      ChessPieceType.queen,
      false,
      'assets/Images/black/queen.png',
    );
    // ~ Add the white queen
    newBoard[7][3] = ChessPiece(
      ChessPieceType.queen,
      true,
      'assets/Images/white/queen.png',
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

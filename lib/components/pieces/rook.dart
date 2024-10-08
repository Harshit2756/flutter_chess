import 'package:chess/components/piece.dart';

class Rook {
  void initialPosition(List<List<ChessPiece?>> newBoard) {
    // ~ Add the black rooks
    newBoard[0][0] = ChessPiece(
      ChessPieceType.rook,
      false,
      'assets/Images/black/rook.png',
    );
    newBoard[0][7] = ChessPiece(
      ChessPieceType.rook,
      false,
      'assets/Images/black/rook.png',
    );
    // ~ Add the white rooks
    newBoard[7][0] = ChessPiece(
      ChessPieceType.rook,
      true,
      'assets/Images/white/rook.png',
    );
    newBoard[7][7] = ChessPiece(
      ChessPieceType.rook,
      true,
      'assets/Images/white/rook.png',
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

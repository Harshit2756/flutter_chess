import 'package:chess/components/piece.dart';

class Bishop {
  void initialPosition(List<List<ChessPiece?>> newBoard) {
    // ~ Add the black bishops
    newBoard[0][2] = ChessPiece(
      ChessPieceType.bishop,
      false,
      'assets/Images/black/bishop.png',
    );
    newBoard[0][5] = ChessPiece(
      ChessPieceType.bishop,
      false,
      'assets/Images/black/bishop.png',
    );
    // ~ Add the white bishops
    newBoard[7][2] = ChessPiece(
      ChessPieceType.bishop,
      true,
      'assets/Images/white/bishop.png',
    );
    newBoard[7][5] = ChessPiece(
      ChessPieceType.bishop,
      true,
      'assets/Images/white/bishop.png',
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

class ChessPiece {
  final ChessPieceType type;
  final bool isWhite;
  final String imagePath;

  ChessPiece(
    this.type,
    this.isWhite,
    this.imagePath,
  );
}

enum ChessPieceType {
  pawn,
  rook,
  knight,
  bishop,
  queen,
  king,
}

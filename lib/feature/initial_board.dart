import 'package:chess/components/piece.dart';
import 'package:chess/components/pieces/bishop.dart';
import 'package:chess/components/pieces/king.dart';
import 'package:chess/components/pieces/knight.dart';
import 'package:chess/components/pieces/pawn.dart';
import 'package:chess/components/pieces/queen.dart';
import 'package:chess/components/pieces/rook.dart';

List<List<ChessPiece?>> initialBoard() {
  // initialize the board with null values, meaning no piece is present
  List<List<ChessPiece?>> newBoard = List.generate(8, (index) {
    return List.generate(8, (index) => null);
  });

  //  Add the pawns
  Pawn().initialPosition(newBoard);

  // * Add the rooks
  Rook().initialPosition(newBoard);

  // * Add the knights
  Knight().initialPosition(newBoard);

  // * Add the bishops
  Bishop().initialPosition(newBoard);

  // * Add the queens
  Queen().initialPosition(newBoard);

  // * Add the kings
  King().initialPosition(newBoard);

  return newBoard;
}

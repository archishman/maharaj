type color = Black | White

type colorless_piece = Pawn | Knight | Bishop | Rook | Queen | King

type piece = colorless_piece * color

type castle_type = Kingside of color | Queenside of color

type pos 

type t

(** [newBoard] represents a new chess board in the normal starting position*)
val newBoard : t

(**[boardFromFen fenStr] represents a chess board as described by [fenStr] in FEN notation*)
val boardFromFen : string -> t

(** [boardToFen board] is the FEN representation of [board] *)
val boardToFen : t -> string

(** [pieceInPos board p] is the [piece] in position [p] in [board]*)
val pieceInPos : t -> pos -> piece option

(** [getHalfMoves board] is the number on the half move clock in [board]*)
val getHalfMoves : t -> int

(** [setHalfMoves board n] is [board] modified to have its half move clock set to [n]*)
val setHalfMoves : t -> int -> t

(** [getEnPassentSquare board] is [Some p] if [p] is a legal en passent square, and [None]
there are no legal en passent squares*)
val getEnPassentSquare : t -> pos option
 
(** [setEnPassentSquare board pos] is [board] with legal en passent square [pos]*)
val setEnPassentSquare : t -> pos -> t

(** [getColorToMove board] is the [color] whose iurn it is to move next*)
val getColorToMove : t -> color

(** [setColorToMove board col] is [board] with [color] as the next to move*)
val setColorToMove : t -> color -> t

(** [getCastleRights board castle] represents whether castling is legal in [castle_type]*)
val getCastleRights : t -> castle_type -> bool

(** [setCastleRights board castle rights] is [board] with castling rights in [castle] set to [rights]*)
val setCastleRights : t -> castle_type -> bool -> t

(**  [generateMoves board] is a list of board positions that are the result of legal moves from [board]*)
val generateMoves : t -> t list

(**  [isLegalMove board1 board2] represents whether it is legal to move from [board1] to [board2]*)
val isLegalMove : t -> t -> bool


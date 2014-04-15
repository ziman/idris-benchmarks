FalseElim  =
	____

mkForeignPrim  =
	____

mkLazyForeignPrim  =
	____

prim__concat {op0} {op1} =
	LStrConcat({op0}, {op1})

run__IO {e0} =
	{e0}(TheWorld)

unsafePerformPrimIO  =
	____

{runMain0}  =
	force{ run__IO(Main.main) }

Main.fmt {e0} {e1} =
	case {e1} of 
	| Main.I({e3}) => LStrConcat("1", Main.fmt(____, {e3}))
	| Main.N() => ""
	| Main.O({e6}) => LStrConcat("0", Main.fmt(____, {e6}))

Main.main  =
	Prelude.putStr(LStrConcat(Main.fmt(____, Main.pow(____, 100000, Main.I(Main.N))), "\n"))

Main.pow {e0} {e1} {e2} =
	case {e1} of 
	| 0 => {e2}
	| _ => let {e3} = LMinus (ATInt ITBig)({e1}, 1) in Main.O(Main.pow(____, {e3}, {e2}))

Prelude.putStr {e0} {w0} =
	foreign{ putStr({e0} : FString) : FUnit }

Decidable.Equality.Char instance of Decidable.Equality.DecEq, method decEq, primitiveEq  =
	____

Decidable.Equality.Float instance of Decidable.Equality.DecEq, method decEq, primitiveEq  =
	____

Decidable.Equality.Int instance of Decidable.Equality.DecEq, method decEq, primitiveEq  =
	____

Decidable.Equality.Integer instance of Decidable.Equality.DecEq, method decEq, primitiveEq  =
	____

Decidable.Equality.String instance of Decidable.Equality.DecEq, method decEq, primitiveEq  =
	____

Decidable.Equality.Char instance of Decidable.Equality.DecEq, method decEq, primitiveNotEq  =
	____

Decidable.Equality.Float instance of Decidable.Equality.DecEq, method decEq, primitiveNotEq  =
	____

Decidable.Equality.Int instance of Decidable.Equality.DecEq, method decEq, primitiveNotEq  =
	____

Decidable.Equality.Integer instance of Decidable.Equality.DecEq, method decEq, primitiveNotEq  =
	____

Decidable.Equality.String instance of Decidable.Equality.DecEq, method decEq, primitiveNotEq  =
	____

data = 4

data Delay 0

data Ex_intro 0

data Exists 2

data FAny 0

data FFloat 0

data FFun 0

data FFunction 0

data FIntT 0

data FManagedPtr 0

data FPtr 0

data FString 0

data FTy 0

data FUnit 0

data Foreign 1

data IO 1

data IT16 0

data IT16x8 0

data IT32 0

data IT32x4 0

data IT64 0

data IT64x2 0

data IT8 0

data IT8x16 0

data ITChar 0

data ITNative 0

data IntTy 0

data Lazy' 2

data LazyCodata 0

data LazyEval 0

data LazyType 0

data MkIO 1

data PrimIO 1

data Symbol_ 1

data TheWorld 0

data World 0

data __Elim 1

data prim__IO 1

data refl 0

data {__False0} 0

data {__II0} 0

data {__Infer0} 0

data {__MkPair0} 2

data {__Pair0} 2

data {__Unit0} 0

data {__infer0} 0

data Decidable.Equality.DecEq 1

data Main.Bin 1

data Main.I 1

data Main.N 0

data Main.O 1

data Prelude.Algebra.AbelianGroup 1

data Prelude.Algebra.BoundedJoinSemilattice 1

data Prelude.Algebra.BoundedLattice 1

data Prelude.Algebra.BoundedMeetSemilattice 1

data Prelude.Algebra.Group 1

data Prelude.Algebra.JoinSemilattice 1

data Prelude.Algebra.Lattice 1

data Prelude.Algebra.MeetSemilattice 1

data Prelude.Algebra.Monoid 1

data Prelude.Algebra.Ring 1

data Prelude.Algebra.RingWithUnity 1

data Prelude.Algebra.Semigroup 1

data Prelude.Algebra.VerifiedAbelianGroup 1

data Prelude.Algebra.VerifiedBoundedJoinSemilattice 1

data Prelude.Algebra.VerifiedBoundedLattice 1

data Prelude.Algebra.VerifiedBoundedMeetSemilattice 1

data Prelude.Algebra.VerifiedGroup 1

data Prelude.Algebra.VerifiedJoinSemilattice 1

data Prelude.Algebra.VerifiedLattice 1

data Prelude.Algebra.VerifiedMeetSemilattice 1

data Prelude.Algebra.VerifiedMonoid 1

data Prelude.Algebra.VerifiedRing 1

data Prelude.Algebra.VerifiedRingWithUnity 1

data Prelude.Algebra.VerifiedSemigroup 1

data Prelude.Applicative.Alternative 1

data Prelude.Applicative.Applicative 1

data Prelude.Basics.Dec 1

data Prelude.Basics.No 0

data Prelude.Basics.Yes 0

data Prelude.Bool.Bool 0

data Prelude.Bool.False 0

data Prelude.Bool.True 0

data Prelude.Bool.oh 0

data Prelude.Bool.so 1

data Prelude.Cast.Cast 2

data Prelude.Classes.EQ 0

data Prelude.Classes.Eq 1

data Prelude.Classes.GT 0

data Prelude.Classes.Integral 1

data Prelude.Classes.LT 0

data Prelude.Classes.MaxBound 1

data Prelude.Classes.MinBound 1

data Prelude.Classes.Num 1

data Prelude.Classes.Ord 1

data Prelude.Classes.Ordering 0

data Prelude.Either.Either 2

data Prelude.Either.Left 0

data Prelude.Either.Right 0

data Prelude.Fin.Fin 1

data Prelude.Fin.IsJust 2

data Prelude.Fin.ItIsJust 0

data Prelude.Fin.fS 0

data Prelude.Fin.fZ 0

data Prelude.Foldable.Foldable 1

data Prelude.Functor.Functor 1

data Prelude.List.:: 0

data Prelude.List.List 1

data Prelude.List.Nil 0

data Prelude.Maybe.Just 0

data Prelude.Maybe.Maybe 1

data Prelude.Maybe.Nothing 0

data Prelude.Monad.Monad 1

data Prelude.Nat.Additive 0

data Prelude.Nat.LTE 2

data Prelude.Nat.Multiplicative 0

data Prelude.Nat.Nat 0

data Prelude.Nat.S 0

data Prelude.Nat.Z 0

data Prelude.Nat.getAdditive 0

data Prelude.Nat.getMultiplicative 0

data Prelude.Nat.lteSucc 0

data Prelude.Nat.lteZero 0

data Prelude.Stream.:: 0

data Prelude.Stream.Stream 1

data Prelude.Strings.StrCons 0

data Prelude.Strings.StrM 1

data Prelude.Strings.StrNil 0

data Prelude.Traversable.Traversable 1

data Prelude.Uninhabited.Uninhabited 1

data Prelude.Vect.:: 0

data Prelude.Vect.Nil 0

data Prelude.Vect.Vect 2

data Prelude.Enum 1

data Prelude.FHandle 0

data Prelude.File 0

data Prelude.Mode 0

data Prelude.Read 0

data Prelude.ReadWrite 0

data Prelude.Show 1

data Prelude.Write 0

data constructor of __Elim 0

data constructor of Decidable.Equality.DecEq 0

data constructor of Prelude.Algebra.AbelianGroup 0

data constructor of Prelude.Algebra.BoundedJoinSemilattice 0

data constructor of Prelude.Algebra.BoundedLattice 0

data constructor of Prelude.Algebra.BoundedMeetSemilattice 0

data constructor of Prelude.Algebra.Group 0

data constructor of Prelude.Algebra.JoinSemilattice 0

data constructor of Prelude.Algebra.Lattice 0

data constructor of Prelude.Algebra.MeetSemilattice 0

data constructor of Prelude.Algebra.Monoid 0

data constructor of Prelude.Algebra.Ring 0

data constructor of Prelude.Algebra.RingWithUnity 0

data constructor of Prelude.Algebra.Semigroup 0

data constructor of Prelude.Algebra.VerifiedAbelianGroup 0

data constructor of Prelude.Algebra.VerifiedBoundedJoinSemilattice 0

data constructor of Prelude.Algebra.VerifiedBoundedLattice 0

data constructor of Prelude.Algebra.VerifiedBoundedMeetSemilattice 0

data constructor of Prelude.Algebra.VerifiedGroup 0

data constructor of Prelude.Algebra.VerifiedJoinSemilattice 0

data constructor of Prelude.Algebra.VerifiedLattice 0

data constructor of Prelude.Algebra.VerifiedMeetSemilattice 0

data constructor of Prelude.Algebra.VerifiedMonoid 0

data constructor of Prelude.Algebra.VerifiedRing 0

data constructor of Prelude.Algebra.VerifiedRingWithUnity 0

data constructor of Prelude.Algebra.VerifiedSemigroup 0

data constructor of Prelude.Applicative.Alternative 0

data constructor of Prelude.Applicative.Applicative 0

data constructor of Prelude.Cast.Cast 0

data constructor of Prelude.Classes.Eq 0

data constructor of Prelude.Classes.Integral 0

data constructor of Prelude.Classes.MaxBound 0

data constructor of Prelude.Classes.MinBound 0

data constructor of Prelude.Classes.Num 0

data constructor of Prelude.Classes.Ord 0

data constructor of Prelude.Foldable.Foldable 0

data constructor of Prelude.Functor.Functor 0

data constructor of Prelude.Monad.Monad 0

data constructor of Prelude.Traversable.Traversable 0

data constructor of Prelude.Uninhabited.Uninhabited 0

data constructor of Prelude.Enum 0

data constructor of Prelude.Show 0
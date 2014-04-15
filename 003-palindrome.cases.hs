FalseElim  =
	____

Force {e0} {e1} {e2} =
	force{ {e2} }

io_bind {e0} {e1} {e2} {e3} w =
	prim_io_bind(____, ____, {e2}(w), \ {b0} => case block in io_bind(____, ____, ____, ____, w, ____, {e3}({b0})))

io_return {e0} {e1} w =
	{e1}

mkForeignPrim  =
	____

mkLazyForeignPrim  =
	____

prim__addBigInt {op0} {op1} =
	LPlus (ATInt ITBig)({op0}, {op1})

prim__concat {op0} {op1} =
	LStrConcat({op0}, {op1})

prim__eqChar {op0} {op1} =
	LEq (ATInt ITChar)({op0}, {op1})

prim__eqString {op0} {op1} =
	LStrEq({op0}, {op1})

prim__readString {op0} =
	LReadStr({op0})

prim__stdin  =
	LStdIn()

prim__strCons {op0} {op1} =
	LStrCons({op0}, {op1})

prim__strHead {op0} =
	LStrHead({op0})

prim__strRev {op0} =
	LStrRev({op0})

prim__strTail {op0} =
	LStrTail({op0})

prim_io_bind {e0} {e1} {e2} {e3} =
	{e3}({e2})

really_believe_me {e0} {e1} {e2} =
	{e2}

run__IO {e0} =
	{e0}(TheWorld)

unsafePerformPrimIO  =
	____

{Main.isPalinU28} {e0} {e1} {e2} {e3} {e4} {e5} {e6} =
	case {e6} of 
	| Prelude.Basics.No() => Prelude.Maybe.Nothing
	| Prelude.Basics.Yes() => Prelude.Functor.Maybe instance of Prelude.Functor.Functor, method map(____, ____, ____, Main.isPalinU(____, {e1}, ____, {e4}))

{Prelude.Strings.ltrim46} {e0} {e1} =
	case {e1} of 
	| Prelude.Strings.StrCons({e2}, {e3}) => Prelude.Bool.boolElim(____, Prelude.Char.isSpace({e2}), lazy{ Prelude.Strings.ltrim({e3}) }, lazy{ LStrCons({e2}, {e3}) })
	| Prelude.Strings.StrNil() => ""

{Prelude.Strings.strM25} {e0} {e1} =
	case {e1} of 
	| Prelude.Either.Left() => really_believe_me(____, ____, Prelude.Strings.StrCons(LStrHead({e0}), LStrTail({e0})))
	| Prelude.Either.Right() => really_believe_me(____, ____, Prelude.Strings.StrNil)

{Prelude.Strings.unpack27} {e0} {e1} =
	case {e1} of 
	| Prelude.Strings.StrCons({e2}, {e3}) => Prelude.List.::({e2}, Prelude.Strings.unpack({e3}))
	| Prelude.Strings.StrNil() => Prelude.List.Nil

{runMain0}  =
	force{ run__IO(Main.main) }

Decidable.Equality.decEq {e0} {e1} {e2} {e3} =
	{e1}({e2}, {e3})

Decidable.Equality.Char instance of Decidable.Equality.DecEq, method decEq {e0} {e1} =
	Prelude.Bool.boolElim(____, Prelude.Classes.intToBool(LEq (ATInt ITChar)({e0}, {e1})), lazy{ Prelude.Basics.Yes }, lazy{ Prelude.Basics.No })

Main.build {e0} {e1} {e2} {e3} {e4} =
	case {e2} of 
	| 0 => Main.nil
	| _ => case {e4} of 
	    | Prelude.Vect.::({e7}, {e8}) => case {e3} of 
	    .   | Prelude.Vect.::({e11}, {e12}) => case LMinus (ATInt ITBig)({e2}, 1) of 
	    .       | 0 => Main.one
	    .       | _ => let {e15} = LMinus (ATInt ITBig)(LMinus (ATInt ITBig)({e2}, 1), 1) in Main.two({e11}, Main.build(____, ____, {e15}, {e12}, {e8}), {e7})
	    | Prelude.Vect.Nil() => Main.nil

Main.eq  =
	____

Main.isPalinU {e0} {e1} {e2} {e3} =
	case {e3} of 
	| Main.nil() => Prelude.Maybe.Just
	| Main.one() => Prelude.Maybe.Just
	| Main.two({e14}, {e15}, {e16}) => {Main.isPalinU28}(____, {e1}, ____, ____, {e15}, ____, Decidable.Equality.decEq(____, {e1}, {e14}, {e16}))

Main.main  =
	io_bind(____, ____, io_bind(____, ____, \ w => LReadStr(prim__stdin), \ {b0} => io_return(____, {Prelude.Strings.unpack27}(____, {Prelude.Strings.strM25}({Prelude.Strings.ltrim46}(____, {Prelude.Strings.strM25}(LStrRev({Prelude.Strings.ltrim46}(____, {Prelude.Strings.strM25}(LStrRev({b0}), Prelude.Either.choose(Prelude.Bool.not(Prelude.Classes.intToBool(LStrEq(LStrRev({b0}), ""))))))), Prelude.Either.choose(Prelude.Bool.not(Prelude.Classes.intToBool(LStrEq(LStrRev({Prelude.Strings.ltrim46}(____, {Prelude.Strings.strM25}(LStrRev({b0}), Prelude.Either.choose(Prelude.Bool.not(Prelude.Classes.intToBool(LStrEq(LStrRev({b0}), ""))))))), "")))))), Prelude.Either.choose(Prelude.Bool.not(Prelude.Classes.intToBool(LStrEq({Prelude.Strings.ltrim46}(____, {Prelude.Strings.strM25}(LStrRev({Prelude.Strings.ltrim46}(____, {Prelude.Strings.strM25}(LStrRev({b0}), Prelude.Either.choose(Prelude.Bool.not(Prelude.Classes.intToBool(LStrEq(LStrRev({b0}), ""))))))), Prelude.Either.choose(Prelude.Bool.not(Prelude.Classes.intToBool(LStrEq(LStrRev({Prelude.Strings.ltrim46}(____, {Prelude.Strings.strM25}(LStrRev({b0}), Prelude.Either.choose(Prelude.Bool.not(Prelude.Classes.intToBool(LStrEq(LStrRev({b0}), ""))))))), "")))))), "")))))))), \ input => Prelude.putStr(LStrConcat(Main.case block in main(____, ____, Main.isPalinU(____, \ {meth0} => \ {meth1} => Decidable.Equality.Char instance of Decidable.Equality.DecEq, method decEq({meth0}, {meth1}), ____, Main.toU(____, input))), "\n")))

Main.toU {e0} {e1} =
	Main.build(____, ____, Prelude.List.length(____, {e1}), Prelude.Vect.fromList(____, {e1}), Prelude.Vect.reverse(____, ____, Prelude.Vect.fromList(____, {e1})))

Main.case block in main {e0} {e1} {e2} =
	case {e2} of 
	| Prelude.Maybe.Just() => "yes"
	| Prelude.Maybe.Nothing() => "no"

Prelude.Bool.boolElim {e0} {e1} {e2} {e3} =
	case {e1} of 
	| Prelude.Bool.False() => force{ {e3} }
	| Prelude.Bool.True() => force{ {e2} }

Prelude.Bool.not {e0} =
	case {e0} of 
	| Prelude.Bool.False() => Prelude.Bool.True
	| Prelude.Bool.True() => Prelude.Bool.False

Prelude.Bool.|| {e0} {e1} =
	case {e0} of 
	| Prelude.Bool.False() => {e1}
	| Prelude.Bool.True() => Prelude.Bool.True

Prelude.Char.isSpace {e0} =
	Prelude.Bool.||(Prelude.Bool.||(Prelude.Bool.||(Prelude.Bool.||(Prelude.Bool.||(Prelude.Bool.||(Prelude.Classes.intToBool(LEq (ATInt ITChar)({e0}, ' ')), Prelude.Classes.intToBool(LEq (ATInt ITChar)({e0}, '\t'))), Prelude.Classes.intToBool(LEq (ATInt ITChar)({e0}, '\r'))), Prelude.Classes.intToBool(LEq (ATInt ITChar)({e0}, '\n'))), Prelude.Classes.intToBool(LEq (ATInt ITChar)({e0}, '\f'))), Prelude.Classes.intToBool(LEq (ATInt ITChar)({e0}, '\v'))), Prelude.Classes.intToBool(LEq (ATInt ITChar)({e0}, '\160')))

Prelude.Classes.intToBool {e0} =
	case {e0} of 
	| 0 => Prelude.Bool.False
	| _ => Prelude.Bool.True

Prelude.Either.choose {e0} =
	case {e0} of 
	| Prelude.Bool.False() => Prelude.Either.Right
	| Prelude.Bool.True() => Prelude.Either.Left

Prelude.Functor.Maybe instance of Prelude.Functor.Functor, method map {e0} {e1} {e2} {e3} =
	case {e3} of 
	| Prelude.Maybe.Just() => Prelude.Maybe.Just
	| Prelude.Maybe.Nothing() => Prelude.Maybe.Nothing

Prelude.List.length {e0} {e1} =
	case {e1} of 
	| Prelude.List.::({e4}, {e5}) => LPlus (ATInt ITBig)(1, Prelude.List.length(____, {e5}))
	| Prelude.List.Nil() => 0

Prelude.Strings.ltrim {e0} =
	{Prelude.Strings.ltrim46}(____, {Prelude.Strings.strM25}({e0}, Prelude.Either.choose(Prelude.Bool.not(Prelude.Classes.intToBool(LStrEq({e0}, ""))))))

Prelude.Strings.unpack {e0} =
	{Prelude.Strings.unpack27}(____, {Prelude.Strings.strM25}({e0}, Prelude.Either.choose(Prelude.Bool.not(Prelude.Classes.intToBool(LStrEq({e0}, ""))))))

Prelude.Vect.fromList {e0} {e1} =
	Prelude.Vect.reverse(____, ____, Prelude.Vect.fromList'(____, ____, Prelude.Vect.Nil, {e1}))

Prelude.Vect.fromList' {e0} {e1} {e2} {e3} =
	case {e3} of 
	| Prelude.List.::({e6}, {e7}) => Prelude.Vect.fromList'(____, ____, Prelude.Vect.::({e6}, {e2}), {e7})
	| Prelude.List.Nil() => {e2}

Prelude.Vect.reverse {e0} {e1} {e2} =
	Prelude.Vect.reverse, reverse'(____, ____, ____, ____, ____, ____, Prelude.Vect.Nil, ____, {e2})

Prelude.Vect.reverse'_lemma_1 a n xs m l acc prf value =
	value

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

Prelude.Vect.reverse, reverse' {e0} {e1} {e2} {e3} {e4} {e5} {e6} {e7} {e8} =
	case {e8} of 
	| Prelude.Vect.::({e12}, {e13}) => Prelude.Vect.reverse, reverse'(____, ____, ____, ____, ____, ____, Prelude.Vect.::({e12}, {e6}), ____, {e13})
	| Prelude.Vect.Nil() => Prelude.Vect.reverse'_lemma_1(____, ____, ____, ____, ____, ____, ____, {e6})

case block in io_bind {e0} {e1} {e2} {e3} {e4} {e5} {e6} =
	{e6}({e4})

data = 4

data Delay 1

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

data Main.Palindrome 2

data Main.U 2

data Main.nil 0

data Main.one 0

data Main.p0 0

data Main.p1 0

data Main.p2 0

data Main.two 3

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

data Prelude.List.:: 2

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

data Prelude.Strings.StrCons 2

data Prelude.Strings.StrM 1

data Prelude.Strings.StrNil 0

data Prelude.Traversable.Traversable 1

data Prelude.Uninhabited.Uninhabited 1

data Prelude.Vect.:: 2

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

data constructor of Decidable.Equality.DecEq 1

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
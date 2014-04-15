FalseElim  =
	____

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

prim__fromStrBigInt {op0} =
	LStrInt ITBig({op0})

prim__readString {op0} =
	LReadStr({op0})

prim__stdin  =
	LStdIn()

prim_io_bind {e0} {e1} {e2} {e3} =
	{e3}({e2})

run__IO {e0} =
	{e0}(TheWorld)

unsafePerformPrimIO  =
	____

{Main.natToBin28} {e0} {e1} {e2} =
	case {e2} of 
	| Parity.even({e3}) => Prelude.Monad.Maybe instance of Prelude.Monad.Monad, method >>=(____, ____, Main.natToBin({e0}, {e3}), \ jbin => Main.ntbEven(____, ____, ____, ____, Main.#(jbin, Main.b1)))
	| Parity.odd({e4}) => Prelude.Monad.Maybe instance of Prelude.Monad.Monad, method >>=(____, ____, Main.natToBin({e0}, LPlus (ATInt ITBig)({e4}, 1)), \ jbin => Main.ntbOdd(____, ____, ____, ____, Main.#(jbin, Main.b0)))

{Parity.parity18} {e0} {e1} =
	case {e1} of 
	| Parity.even({e2}) => Parity.parity_lemma_1(____, Parity.even(LPlus (ATInt ITBig)({e2}, 1)))
	| Parity.odd({e3}) => Parity.parity_lemma_2(____, Parity.odd(LPlus (ATInt ITBig)({e3}, 1)))

{runMain0}  =
	force{ run__IO(Main.main) }

Main.adc {e0} {e1} {e2} {e3} {e4} {e5} {e6} =
	case {e5} of 
	| Main.#({e10}, {e11}) => case {e4} of 
	.   | Main.#({e15}, {e16}) => Main.case block in adc(____, ____, ____, ____, {e15}, ____, ____, ____, {e10}, ____, ____, Main.addBit(____, ____, ____, {e16}, {e11}, {e6}))
	| Main.zero() => Main.adc_lemma_1(____, ____, Main.#(Main.zero, {e6}))

Main.adc_lemma_1 c carry value =
	value

Main.adc_lemma_2 c w v bit0 num0 b0 v1 bit1 num1 b1 bc x x1 bx bx1 b value =
	value

Main.addBit {e0} {e1} {e2} {e3} {e4} {e5} =
	case {e5} of 
	| Main.b0() => case {e4} of 
	.   | Main.b0() => case {e3} of 
	.   .   | Main.b0() => {__MkPair0}(Main.b0, {__MkPair0}(Main.b0, refl))
	.   .   | Main.b1() => {__MkPair0}(Main.b0, {__MkPair0}(Main.b1, refl))
	.   | Main.b1() => case {e3} of 
	.       | Main.b0() => {__MkPair0}(Main.b0, {__MkPair0}(Main.b1, refl))
	.       | Main.b1() => {__MkPair0}(Main.b1, {__MkPair0}(Main.b0, refl))
	| Main.b1() => case {e4} of 
	    | Main.b0() => case {e3} of 
	    .   | Main.b0() => {__MkPair0}(Main.b0, {__MkPair0}(Main.b1, refl))
	    .   | Main.b1() => {__MkPair0}(Main.b1, {__MkPair0}(Main.b0, refl))
	    | Main.b1() => case {e3} of 
	        | Main.b0() => {__MkPair0}(Main.b1, {__MkPair0}(Main.b0, refl))
	        | Main.b1() => {__MkPair0}(Main.b1, {__MkPair0}(Main.b1, refl))

Main.iter {e0} {e1} {e2} {e3} {e4} {e5} {e6} =
	case {e3} of 
	| 0 => {e4}
	| _ => let {e7} = LMinus (ATInt ITBig)({e3}, 1) in Main.iter(____, ____, ____, {e7}, Main.adc(____, ____, ____, ____, {e5}, {e6}, Main.b0), {e5}, {e6})

Main.main  =
	io_bind(____, ____, Main.readNum("width"), \ w => io_bind(____, ____, Main.readNum("x"), \ x => io_bind(____, ____, Main.readNum("y"), \ y => io_bind(____, ____, Main.readNum("iters"), \ iters => Prelude.putStr(LStrConcat(Prelude.Binary w k instance of Prelude.Show, method show(____, ____, ____, ____, Main.iter(____, ____, ____, iters, Main.adc(____, ____, ____, ____, Main.case block in Main.main, bin(____, ____, Main.natToBin(w, x)), Main.case block in Main.main, bin(____, ____, Main.natToBin(w, y)), Main.b0), Main.case block in Main.main, bin(____, ____, Main.natToBin(w, x)), Main.case block in Main.main, bin(____, ____, Main.natToBin(w, y)))), "\n"))))))

Main.natToBin {e0} {e1} =
	case {e1} of 
	| 0 => case {e0} of 
	.   | 0 => Prelude.Maybe.Just(Main.zero)
	.   | _ => let {e4} = LMinus (ATInt ITBig)({e0}, 1) in Prelude.Monad.Maybe instance of Prelude.Monad.Monad, method >>=(____, ____, Main.natToBin({e4}, 0), \ x => Prelude.Maybe.Just(Main.pad(____, ____, x)))
	| _ => let {e2} = LMinus (ATInt ITBig)({e1}, 1) in case {e0} of 
	    | 0 => Prelude.Maybe.Nothing
	    | _ => let {e3} = LMinus (ATInt ITBig)({e0}, 1) in {Main.natToBin28}({e3}, ____, Parity.parity({e2}))

Main.ntbEven w j class jbin value =
	Prelude.Maybe.Just(value)

Main.ntbOdd w j class jbin value =
	Prelude.Maybe.Just(value)

Main.pad {e0} {e1} {e2} =
	case {e2} of 
	| Main.#({e6}, {e7}) => Main.#(Main.pad(____, ____, {e6}), {e7})
	| Main.zero() => Main.#(Main.zero, Main.b0)

Main.readNum {e0} =
	io_bind(____, ____, Prelude.putStr(LStrConcat("Enter ", LStrConcat({e0}, ": "))), \ {bindx0} => io_bind(____, ____, \ w => LReadStr(prim__stdin), \ {b0} => io_return(____, LStrInt ITBig({b0}))))

Main.case block in adc {e0} {e1} {e2} {e3} {e4} {e5} {e6} {e7} {e8} {e9} {e10} {e11} =
	case {e11} of 
	| {__MkPair0}({e22}, {e23}) => case {e23} of 
	    | {__MkPair0}({e26}, {e27}) => Main.adc_lemma_2(____, ____, ____, ____, ____, ____, ____, ____, ____, ____, ____, ____, ____, ____, ____, ____, Main.#(Main.adc(____, ____, ____, ____, {e4}, {e8}, {e22}), {e26}))

Main.case block in Main.main, bin {e0} {e1} {e2} =
	case {e2} of 
	| Prelude.Maybe.Just({e4}) => {e4}
	| _ => error "Error"

Parity.parity {e0} =
	case {e0} of 
	| 0 => Parity.even(0)
	| _ => let {e1} = LMinus (ATInt ITBig)({e0}, 1) in case {e1} of 
	    | 0 => Parity.odd(0)
	    | _ => let {e2} = LMinus (ATInt ITBig)({e1}, 1) in {Parity.parity18}(____, Parity.parity({e2}))

Parity.parity_lemma_1 j value =
	value

Parity.parity_lemma_2 j value =
	value

Prelude.Monad.Maybe instance of Prelude.Monad.Monad, method >>= {e0} {e1} {e2} {e3} =
	case {e2} of 
	| Prelude.Maybe.Just({e6}) => {e3}({e6})
	| Prelude.Maybe.Nothing() => Prelude.Maybe.Nothing

Prelude.putStr {e0} {w0} =
	foreign{ putStr({e0} : FString) : FUnit }

Prelude.show {e0} {e1} {e2} =
	{e1}({e2})

Prelude.Binary w k instance of Prelude.Show, method show {e0} {e1} {e2} {e3} {e4} =
	case {e4} of 
	| Main.#({e8}, {e9}) => LStrConcat(Prelude.show(____, Binary w k instance of Prelude.Show(____, ____), {e8}), Prelude.Bit n instance of Prelude.Show, method show(____, ____, {e9}))
	| Main.zero() => ""

Prelude.Bit n instance of Prelude.Show, method show {e0} {e1} {e2} =
	case {e2} of 
	| Main.b0() => "0"
	| Main.b1() => "1"

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

Binary w k instance of Prelude.Show {e0} {e1} {meth0} =
	Prelude.Binary w k instance of Prelude.Show, method show(____, ____, ____, ____, {meth0})

case block in io_bind {e0} {e1} {e2} {e3} {e4} {e5} {e6} =
	{e6}({e4})

data = 4

data Delay 0

data Ex_intro 1

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

data Main.# 2

data Main.Binary 2

data Main.Bit 1

data Main.b0 0

data Main.b1 0

data Main.zero 0

data Parity.Parity 1

data Parity.even 1

data Parity.odd 1

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

data Prelude.Maybe.Just 1

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

data constructor of Prelude.Show 1
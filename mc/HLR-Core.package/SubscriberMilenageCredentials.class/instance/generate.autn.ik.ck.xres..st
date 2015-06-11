as yet unclassified
generate: aRand autn: anAutn ik: aIk ck: aCk xres: aXres
	| sqnForC |
	sqnForC := self buildSqn.
	Milenage generate: opc amf: #[16r12 16r34] ki: ki sqn: sqnForC rand: aRand autn: anAutn ik: aIk ck: aCk res: aXres.
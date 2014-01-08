sreskc
generateSRESKc: aRand
	| version |
	
	"Not very object orientated... select the algorithm to use?"
	version := self a3a8Version.
	version = 1
		ifTrue: [^COMP128 COMP128_v1: self ki rand: aRand].
	version = 2
		ifTrue: [^COMP128 COMP128_v2: self ki rand: aRand].
	version = 3
		ifTrue: [^COMP128 COMP128_v3: self ki rand: aRand].
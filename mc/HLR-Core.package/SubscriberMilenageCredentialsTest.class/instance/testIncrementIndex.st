tests-as yet unclassified
testIncrementIndex
	credential sqn: 16rFFFFFFFFFFFE.

	credential incrementSqn.
	self assert: credential sqn equals: 16rFFFFFFFFFFFF.

	credential incrementSqn.
	self assert: credential sqn equals: 16r20.
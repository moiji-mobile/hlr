tests-as yet unclassified
testResetSqn
	credential resetSqn: 16rFFFFFFFFFFFF.
	self assert: credential sqn equals: 16r20.

	credential resetSqn: 16rFFFFFFFFFFFE.
	self assert: credential sqn equals: 16r20.

	credential resetSqn: 32.
	self assert: credential sqn equals: 64.
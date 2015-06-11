as yet unclassified
testSqn
	credential sqn: 68006444871038.
	self assert: credential buildSqn size equals: 6.
	self assert: credential buildSqn asInteger equals: 68006444871038.

	credential incrementSqn.
	self assert: credential sqn equals: 68006444871039.
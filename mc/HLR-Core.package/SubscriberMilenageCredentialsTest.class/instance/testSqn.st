as yet unclassified
testSqn
	credential sqn: 68006444871038.
	self assert: credential ind equals: 30.
	self assert: credential seq equals: 2125201402219.
	self assert: credential buildSqn size equals: 6.
	self assert: credential buildSqn asInteger equals: 68006444871038.
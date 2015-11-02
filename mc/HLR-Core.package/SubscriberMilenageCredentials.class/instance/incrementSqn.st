as yet unclassified
incrementSqn
	| curSqn |
	curSqn := sqn ifNil: [0].
	self privSetSQN: curSqn + 1.
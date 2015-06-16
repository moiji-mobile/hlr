as yet unclassified
rand: numberOfBytes
	| rand |
	rand := ByteArray new: numberOfBytes.
	^(self intRand: rand size: rand size) = 1
		ifTrue: [ rand ]
		ifFalse: [ nil ]
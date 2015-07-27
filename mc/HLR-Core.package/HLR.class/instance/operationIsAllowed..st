as yet unclassified
operationIsAllowed: anOperationName
	operationFilter ifNil: [
		^true].
	^operationFilter includes: anOperationName
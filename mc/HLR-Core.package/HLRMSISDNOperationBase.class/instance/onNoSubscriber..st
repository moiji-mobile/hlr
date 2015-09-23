as yet unclassified
onNoSubscriber: aString
	"We would like to return unknownSubscriber this is not available
	in all cases."
	(invocation errorNamed: 'unknownSubscriber') isNil
		ifTrue: [
			self endWithErrorNamed: 'unexpectedDataValue']
		ifFalse: [
			self endWithErrorNamed: 'unknownSubscriber' ]

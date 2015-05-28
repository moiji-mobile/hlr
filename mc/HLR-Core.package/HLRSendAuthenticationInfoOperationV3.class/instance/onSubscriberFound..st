as yet unclassified
onSubscriberFound: subscriber
	^subscriber credentials supportsMutualAuthentication
		ifTrue: [
			self maybeResyncSqn: subscriber.
			self respondWithQuinTuplets: subscriber.]
		ifFalse: [super onSubscriberFound: subscriber ].
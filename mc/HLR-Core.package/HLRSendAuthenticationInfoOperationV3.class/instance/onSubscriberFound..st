as yet unclassified
onSubscriberFound: subscriber
	^subscriber credentials supportsMutualAuthentication
		ifTrue: [self respondWithQuinTuplets: subscriber]
		ifFalse: [super onSubscriberFound: subscriber ].
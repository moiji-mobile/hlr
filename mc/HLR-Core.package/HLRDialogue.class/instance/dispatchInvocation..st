as yet unclassified
dispatchInvocation: anInvocation
	| selector |
	selector := anInvocation normalizedOperationName.

	"Abort the entire dialogue in case we don't know the invocation."
	(self respondsTo: selector)
		ifFalse: [^self requestTcUAbort: self newUAbort serviceUser].

	self perform: selector with: anInvocation.
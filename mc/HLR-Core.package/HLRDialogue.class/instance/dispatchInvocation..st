as yet unclassified
dispatchInvocation: anInvocation
	| selector |
	selector := anInvocation normalizedOperationName.

	"Abort the entire dialogue in case we don't know the invocation."
	(self respondsTo: selector)
		ifFalse: [^self requestTcUAbort: (self uAbortCause: 0)].

	self perform: anInvocation normalizedOperationName with: anInvocation.
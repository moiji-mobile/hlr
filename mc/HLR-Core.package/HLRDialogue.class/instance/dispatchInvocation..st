as yet unclassified
dispatchInvocation: anInvocation
	| selector |
	selector := anInvocation normalizedOperationName.

	"Abort the entire dialogue in case we don't know the invocation."
	(self respondsTo: selector)
		ifFalse: [^self requestTcUAbort: self newUAbort serviceUser].

	"Depending on routing it is best to use the real address"
	hlr updateAddress ifTrue: [
		self transaction address: hlr hlrSCCPAddress].	

	self perform: selector with: anInvocation.
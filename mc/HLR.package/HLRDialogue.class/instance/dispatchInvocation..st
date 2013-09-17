as yet unclassified
dispatchInvocation: anInvocation
	| selector |
	selector := self findSelectorForInvocation: anInvocation operation.
	selector ifNil: [
		^ self abort].

	self perform: selector with: anInvocation.
invoke
insertSuccess: anInvoke
	pendingInvokes remove: anInvoke.

	"We needed to wait for the start of the dialogue."
	pendingRequests ifTrue: [
		pendingRequests := false.
		self doExecute.
		blockHandling := false.
		^self checkDone.
	].
	
	self checkDone.
invoke
insertSuccess: anInvoke
	pendingInvokes remove: anInvoke.
	
	"We still wait for invokes or have already failed."
	pendingInvokes isEmpty ifFalse: [^self].
	failed ifTrue: [^self].

	onSuccessBlock value.
	
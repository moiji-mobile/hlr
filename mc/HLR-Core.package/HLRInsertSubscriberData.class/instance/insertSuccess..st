invoke
insertSuccess: anInvoke
	pendingInvokes remove: anInvoke.
	self checkDone.
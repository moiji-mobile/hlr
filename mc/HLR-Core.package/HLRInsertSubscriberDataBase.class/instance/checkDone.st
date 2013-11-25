private
checkDone
	"We still wait for invokes or have already failed."
	pendingInvokes isEmpty ifFalse: [^self].
	failed ifTrue: [^self].
	blockHandling ifTrue: [^self].

	needsEnd ifTrue: [
		dialogue requestTcEnd: false].
	self signalSuccess: 'done'
	
execution
start
	| subscriber |
	
	"TODO: not very object orientated..."
	self flag: #todo.

	database shouldForceFailure ifTrue: [ 
		^systemFailure value: 'Failure forced!'].

	"Start the query for the IMSI"
	imsi ifNotNil: [
		subscriber := database findImsi: imsi.
		^subscriber isNil
			ifTrue: [onFailure value: 'Failed to find IMSI']
			ifFalse: [onSuccess value: subscriber]].

	"Start he query for the MSISDN"
	msisdn ifNotNil: [
		subscriber := database findMSISDN: msisdn.
		^subscriber isNil
			ifTrue: [onFailure value: 'Failed to find MSISDN']
			ifFalse: [onSuccess value: subscriber]].

	^onFailure value: 'Unknown search criteria..'
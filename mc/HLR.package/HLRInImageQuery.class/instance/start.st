execution
start
	| subscriber |

	"Start the query for the IMSI"

	subscriber := database findImsi: imsi.
	subscriber isNil
		ifTrue: [onFailure value: 'Failed to find IMSI']
		ifFalse: [onSuccess value: subscriber].
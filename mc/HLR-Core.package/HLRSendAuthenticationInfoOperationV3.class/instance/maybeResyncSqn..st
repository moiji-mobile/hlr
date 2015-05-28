as yet unclassified
maybeResyncSqn: aSubscriber 
	"Check if we need to resync"
	invocation argument re_synchronisationInfo ifNotNil: [:info |
		| res |
		res := aSubscriber credentials verifyAuts: info auts rand: info rand.
		logger logDebug: 'AUTS response' with: { 'result' -> res key. 'sqn' -> res value }.
		res key = 0 ifTrue: [
			aSubscriber credentials resetSqn: res value asInteger].].
as yet unclassified
updateSQN: aSubscriber 
	| res |
	sqnUpdate params: Dictionary new.
	sqnUpdate at: 1 bind: aSubscriber credentials sqn.
	sqnUpdate at: 2 bind: aSubscriber imsi.
	sqnUpdate at: 3 bind: aSubscriber credentials initialSqn.

	"The interface needs to be considered async"
	res := sqnUpdate execute.
	logger logDebug: 'SQNupdate' with: {'updated' -> res affectedRows. 'imsi' -> aSubscriber imsi}.
as yet unclassified
updateSQN: aSubscriber 
	sqnUpdate params: Dictionary new.
	sqnUpdate at: 1 bind: aSubscriber credentials buildSqn.
	sqnUpdate at: 2 bind: aSubscriber imsi.
	sqnUpdate at: 3 bind: aSubscriber credentials initialSqn.

	"The interface needs to be considered async"
	sqnUpdate execute
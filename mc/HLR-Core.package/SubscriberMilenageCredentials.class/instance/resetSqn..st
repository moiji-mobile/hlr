as yet unclassified
resetSqn: anInteger
	"We don't want to update initialSqn due a re-sync. Otherwise the
	incremental DB update might fail" 
	self privSetSQN: anInteger + 32.
	
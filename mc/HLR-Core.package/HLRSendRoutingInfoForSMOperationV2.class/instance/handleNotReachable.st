as yet unclassified
handleNotReachable
	"Dispatch for the poor"
	highPriority
		ifTrue: [self handleNotReachableHighPriority]
		ifFalse: [self handleNotReachableLowPriority]
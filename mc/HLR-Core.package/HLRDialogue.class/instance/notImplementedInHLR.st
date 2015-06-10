as yet unclassified
notImplementedInHLR
	"Just close the dialogue as if nothing has happened"
	logger logDebug: 'notImplemented silently aborting' with: {}.
	self requestTcEnd: true.
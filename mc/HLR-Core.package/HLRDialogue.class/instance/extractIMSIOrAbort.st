as yet unclassified
extractIMSIOrAbort
	| destinationReference |

	userInformation ifNil: [
		self requestTcUAbort: self newUAbort serviceUser.
		^nil].
	destinationReference := (userInformation find: 'destinationReference') contents.
	(destinationReference isNil or: [destinationReference isEmpty]) ifTrue: [
		self requestTcUAbort: self newUAbort serviceUser.
		^nil].
	^destinationReference fromE212
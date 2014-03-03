as yet unclassified
testDefaultLookUp
	| profile |
	profile := BearerServiceProfile defaultVoyageProfile: dataBase.
	self deny: profile isNil.
	self assert: profile class equals: BearerServiceProfile.

	"Verify the side effect!"
	self assert: profile equals: BearerServiceProfile defaultProfile.

	"Some clean-up"
	dataBase voyageRepository remove: profile.


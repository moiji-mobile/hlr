as yet unclassified
testDefaultLookUp
	| profile |
	profile := TeleServiceProfile defaultVoyageProfile: dataBase.
	self deny: profile isNil.
	self assert: profile class equals: TeleServiceProfile.

	"Verify the side effect!"
	self assert: profile equals: TeleServiceProfile defaultProfile.

	"Some clean-up"
	dataBase voyageRepository remove: profile.


as yet unclassified
testDefaultLookUp
	| profile |
	profile := TeleServiceProfileGPRS defaultVoyageProfile: dataBase.
	self deny: profile isNil.
	self assert: profile class equals: TeleServiceProfileGPRS.

	"Verify the side effect!"
	self assert: profile equals: TeleServiceProfileGPRS defaultProfile.

	"Some clean-up"
	dataBase voyageRepository remove: profile.


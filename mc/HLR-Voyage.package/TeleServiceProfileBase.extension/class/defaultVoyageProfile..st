*HLR-Voyage
defaultVoyageProfile: aDatabase
	| profile |
	profile := aDatabase voyageRepository selectOne: self where: Dictionary new.
	profile ifNil: [
		profile := self defaultProfile.
		aDatabase voyageRepository save: profile].

	"Update the default profile now"
	defaultProfile := profile.
	^profile.
as yet unclassified
watchdogProcess
	| sccpRx tcapSuccess |
	tcapSuccess := self readResetSuccessCounter.
	sccpRx := self endPoint networkService readResetRxCounter.

	logger logNotice: 'AuC watchdog stats' with: { 'sccpRx' -> sccpRx. 'tcapSuccess' -> tcapSuccess }.
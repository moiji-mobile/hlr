watchdog
watchdogProcess
	| sccpRx tcapSuccess |
	tcapSuccess := self readResetSuccessCounter.
	sccpRx := self endPoint networkService readResetRxCounter.

	logger logNotice: 'watchdog stats' with: { 'sccpRx' -> sccpRx. 'tcapSuccess' -> tcapSuccess }.
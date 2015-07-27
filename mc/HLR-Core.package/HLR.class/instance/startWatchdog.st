watchdog
startWatchdog
	watchdogProc := [
		[self
			watchdogSleep;
			watchdogProcess] repeat.
	] newProcess.

	watchdogProc name: self class name, ' Watchdog'.
	watchdogProc resume.
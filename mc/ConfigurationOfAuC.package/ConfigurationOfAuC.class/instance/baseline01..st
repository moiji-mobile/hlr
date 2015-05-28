baselines
baseline01: spec
	<version: '0.1-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec repository: 'http://smalltalkhub.com/mc/osmocom/AuthenticationCenter/main/'.
		spec 
			project: 'HLR' with: [
				spec
					className: #ConfigurationOfHLR;
					versionString: #'development';
					repository: 'http://smalltalkhub.com/mc/osmocom/HomeLocationRegister/main/' ];
			project: 'Garage' with: [
				spec
					className: #ConfigurationOfGarage;
					versionString: '0.2';
					loads: #('mysql' );
					repository: 'http://smalltalkhub.com/mc/DBXTalk/Garage/main/' ].
		spec package: #AuC with: [
				spec requires: #('HLR' 'Garage' ). ]. ].

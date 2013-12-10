as yet unclassified
baseline01: spec 
        <version: '0.1-baseline'>
        
	spec for: #common do: [
		spec blessing: #baseline.
                spec repository: 'http://smalltalkhub.com/mc/osmocom/Osmocom/main'.    
                spec 
				package: 'HLR-Core' with: [ spec requires: #('TCAP' 'ASN1') ];
				package: 'HLR-Camel' with: [ spec requires: #('HLR-Core') ];
				package: 'HLR-Voyage' with: [ spec requires: #('HLR-Core') ] .

			spec
				project: 'Phexample' with: [
					spec
						className: 'ConfigurationOfPhexample';
						versionString: '1.2';
						repository: 'http://smalltalkhub.com/mc/Phexample/Phexample/main' ].	
			spec
				project: 'Osmocom' with: [
					spec
						className: 'ConfigurationOfOsmocom';
						versionString: #'bleedingEdge';
						file: 'ConfigurationOfOsmocom';
						repository: 'http://smalltalkhub.com/mc/osmocom/Osmocom/main' ].

			spec
				project: 'TCAP' with: [
					spec
						className: 'ConfigurationOfTCAP';
						versionString: #'bleedingEdge';
						file: 'ConfigurationOfTCAP';
						repository: 'http://smalltalkhub.com/mc/osmocom/Osmocom/main' ].

			spec
				project: 'ASN1' with: [
					spec
						className: 'ConfigurationOfASN1';
						versionString: #development;
						file: 'ConfigurationOfASN1';
						repository: 'http://smalltalkhub.com/mc/NorbertHartl/ASN1/main' ].
                spec
				group: 'default' with: #('HLR-Core' 'HLR-Camel' 'HLR-Voyage') ].
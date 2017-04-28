baselines
baseline01: spec
	<version: '0.1-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec repository: 'http://smalltalkhub.com/mc/UdoSchneider/Magma/main/'.
		spec project: 'OSProcess' with: [
				spec
					className: #ConfigurationOfOSProcess;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo50/main/' ].
		spec 
			package: 'BrpExtensions';
			package: 'Ma-Ascii-Report' with: [
				spec requires: #('Ma-Core' ). ];
			package: 'Ma-Client-Server-Core' with: [
				spec requires: #('Ma-Core' 'Ma-Serializer-Core' 'Ma-Statistics' 'OSProcess' ). ];
			package: 'Ma-Client-Server-Tester' with: [
				spec requires: #('Ma-Client-Server-Core' 'Ma-Core' ). ];
			package: 'Ma-Collections' with: [
				spec requires: #('Ma-Core' ). ];
			package: 'Ma-Core' with: [
				spec requires: #(#'Ma-Pharo' ). ];
			package: #'Ma-Pharo';
			package: 'Ma-Search' with: [
				spec requires: #('Ma-Core' ). ];
			package: 'Ma-Serializer-Core' with: [
				spec requires: #('Ma-Collections' 'Ma-Core' 'Ma-Statistics' ). ];
			package: 'Ma-Serializer-Tests' with: [
				spec requires: #('Ma-Collections' 'Ma-Core' 'Ma-Search' 'Ma-Serializer-Core' ). ];
			package: 'Ma-Statistics' with: [
				spec requires: #('Ma-Ascii-Report' 'Ma-Core' ). ];
			package: 'Magma-Client' with: [
				spec requires: #('Ma-Ascii-Report' 'Ma-Client-Server-Core' 'Ma-Collections' 'Ma-Core' 'Ma-Serializer-Core' 'Ma-Statistics' 'SOLHashTables' 'WriteBarrier' ). ];
			package: 'Magma-Server' with: [
				spec requires: #('Ma-Client-Server-Core' 'Ma-Collections' 'Ma-Core' 'Ma-Search' 'Ma-Serializer-Core' 'WriteBarrier' 'Magma-Client' ). ];
			package: 'Magma-Tester' with: [
				spec requires: #('Ma-Client-Server-Core' 'Ma-Client-Server-Tester' 'Ma-Collections' 'Ma-Core' 'Ma-Client-Server-Core' 'Ma-Client-Server-Tester' 'Magma-Client' 'Magma-Server' 'SOLHashTables' ). ];
			package: 'Magma-Tools' with: [
				spec requires: #('Ma-Core' 'Ma-Serializer-Core' 'Magma-Client' 'Magma-Server' 'WriteBarrier' ). ];
			package: 'SOLHashTables';
			package: 'WriteBarrier' with: [
				spec requires: #('BrpExtensions' ). ].
		spec 
			group: 'MaBase' with: #(#'Ma-Pharo' 'Ma-Core' 'Ma-Search' 'Ma-Collections' 'Ma-Ascii-Report' 'Ma-Statistics' 'Ma-Serializer-Core' 'Ma-Serializer-Tests' 'BrpExtensions' );
			group: 'MaClientServer' with: #('Ma-Client-Server-Core' 'Ma-Client-Server-Tester' );
			group: 'Magma' with: #('SOLHashTables' 'WriteBarrier' 'Magma-Server' 'Magma-Client' 'Magma-Tester' 'Magma-Tools' ). ].

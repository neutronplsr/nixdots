{ 
lib,
stdenv,
fetchurl,

}:


stdenv.mkDerivation {	

	pname = "SAO Image DS9";

	version = "8.5";

	src = fetchurl {
		url = "https://ds9.si.edu/download/source/ds9.8.5.tar.gz";
		sha256 = "6uU3ozVNsrOMiO31Jnsn5u3gPOiqY6XXtw9oOvGU8Pc=";
	};

	installPhase = ''
		runHook preInstall
		cd SAOImageDS9
		SAOImageDS9/unix/configure
		make
		runHook postInstall
	'';

}

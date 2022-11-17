nombresRomains = {
	"M": 1000,
	"C":  100,
    "X":   10,
    "V":    5,
    "I":    1
};

convertir = function(s) {
	t = s.split("").map(function(c) { return nombresRomains[c]});
	resultat =  t.reduce(function (acc, n) {
		return acc + n;
	}, 0);
	if (t[0] < t[1])
		resultat = resultat - 2 * t[0];
	if (t[2] && t[2] < t[3])
		resultat = resultat - 2 * t[2];
	if (t[4] && t[4] < t[5])
		resultat = resultat - 2 * t[4];
	return resultat;

}

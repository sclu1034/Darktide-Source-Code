local spline_matrices = {
	[0] = {
		0.869683,
		-0.278639,
		-0.407445,
		0,
		0.345074,
		-0.247024,
		0.905485,
		0,
		-0.352952,
		-0.928084,
		-0.118681,
		0,
		0.235187,
		-0.072382,
		0.090882,
		1
	},
	{
		0.913238,
		0.153432,
		-0.377433,
		0,
		-0.121468,
		-0.781722,
		-0.611683,
		0,
		-0.3889,
		0.604458,
		-0.695261,
		0,
		-0.052756,
		0.221145,
		-0.751739,
		1
	},
	[0.0333333333333] = {
		0.869683,
		-0.278639,
		-0.407445,
		0,
		0.345074,
		-0.247024,
		0.905485,
		0,
		-0.352952,
		-0.928084,
		-0.118681,
		0,
		0.235187,
		-0.072382,
		0.090882,
		1
	},
	[0.0666666666667] = {
		0.869683,
		-0.278639,
		-0.407445,
		0,
		0.345074,
		-0.247024,
		0.905485,
		0,
		-0.352952,
		-0.928084,
		-0.118681,
		0,
		0.235187,
		-0.072382,
		0.090882,
		1
	},
	[0.133333333333] = {
		0.981563,
		-0.059344,
		-0.181693,
		0,
		0.190816,
		0.248968,
		0.949529,
		0,
		-0.011113,
		-0.966692,
		0.255701,
		0,
		0.211832,
		0.222466,
		0.052576,
		1
	},
	[0.166666666667] = {
		0.996668,
		0.051958,
		-0.062877,
		0,
		0.013868,
		0.651693,
		0.758356,
		0,
		0.080379,
		-0.756701,
		0.648801,
		0,
		0.173404,
		0.433211,
		0.002163,
		1
	},
	[0.1] = {
		0.920445,
		-0.20495,
		-0.332832,
		0,
		0.316924,
		-0.107077,
		0.942387,
		0,
		-0.228781,
		-0.972898,
		-0.033605,
		0,
		0.229244,
		0.018334,
		0.08265,
		1
	},
	[0.233333333333] = {
		0.959321,
		0.066449,
		-0.274387,
		0,
		-0.279509,
		0.360327,
		-0.889966,
		0,
		0.039732,
		0.930456,
		0.364243,
		0,
		-0.083971,
		0.766405,
		-0.324434,
		1
	},
	[0.266666666667] = {
		0.931698,
		0.044381,
		-0.360513,
		0,
		-0.350541,
		-0.150227,
		-0.92442,
		0,
		-0.095186,
		0.987655,
		-0.124409,
		0,
		-0.164666,
		0.742295,
		-0.478041,
		1
	},
	[0.2] = {
		0.966078,
		0.040655,
		-0.25503,
		0,
		-0.063789,
		0.994497,
		-0.083103,
		0,
		0.250248,
		0.096552,
		0.963355,
		0,
		0.06777,
		0.63704,
		-0.147344,
		1
	},
	[0.333333333333] = {
		0.938825,
		0.035339,
		-0.342577,
		0,
		-0.179511,
		-0.798695,
		-0.574337,
		0,
		-0.293911,
		0.600698,
		-0.743491,
		0,
		-0.202704,
		0.58753,
		-0.718215,
		1
	},
	[0.366666666667] = {
		0.939658,
		0.055616,
		-0.337565,
		0,
		-0.029533,
		-0.969828,
		-0.241995,
		0,
		-0.340839,
		0.237362,
		-0.909664,
		0,
		-0.171975,
		0.520372,
		-0.715327,
		1
	},
	[0.3] = {
		0.935706,
		0.031368,
		-0.351383,
		0,
		-0.297073,
		-0.467139,
		-0.832784,
		0,
		-0.190268,
		0.883627,
		-0.427786,
		0,
		-0.212911,
		0.656455,
		-0.682939,
		1
	},
	[0.433333333333] = {
		0.918425,
		0.115252,
		-0.378434,
		0,
		-0.046218,
		-0.918808,
		-0.39199,
		0,
		-0.392885,
		0.377504,
		-0.838529,
		0,
		-0.132473,
		0.372887,
		-0.722246,
		1
	},
	[0.466666666667] = {
		0.9105,
		0.145667,
		-0.387003,
		0,
		-0.075346,
		-0.861788,
		-0.501642,
		0,
		-0.406587,
		0.485904,
		-0.773682,
		0,
		-0.106823,
		0.310626,
		-0.729308,
		1
	},
	[0.4] = {
		0.931268,
		0.083116,
		-0.354728,
		0,
		-0.027078,
		-0.955148,
		-0.294888,
		0,
		-0.363328,
		0.284225,
		-0.887248,
		0,
		-0.150333,
		0.444298,
		-0.717656,
		1
	},
	[0.533333333333] = {
		0.902051,
		0.183998,
		-0.390447,
		0,
		-0.126934,
		-0.751504,
		-0.647402,
		0,
		-0.412543,
		0.633551,
		-0.654539,
		0,
		-0.076308,
		0.234471,
		-0.738903,
		1
	},
	[0.566666666667] = {
		0.90279,
		0.184182,
		-0.388648,
		0,
		-0.130119,
		-0.744342,
		-0.655,
		0,
		-0.409926,
		0.641898,
		-0.648019,
		0,
		-0.072862,
		0.228781,
		-0.739809,
		1
	},
	[0.5] = {
		0.904945,
		0.170299,
		-0.389965,
		0,
		-0.105786,
		-0.797621,
		-0.59381,
		0,
		-0.41217,
		0.578618,
		-0.703788,
		0,
		-0.086955,
		0.26249,
		-0.73535,
		1
	},
	[0.633333333333] = {
		0.905886,
		0.179139,
		-0.38377,
		0,
		-0.129228,
		-0.746014,
		-0.653272,
		0,
		-0.403324,
		0.641384,
		-0.652654,
		0,
		-0.067467,
		0.224144,
		-0.741279,
		1
	},
	[0.666666666667] = {
		0.907527,
		0.176233,
		-0.381231,
		0,
		-0.128426,
		-0.747784,
		-0.651402,
		0,
		-0.399877,
		0.640125,
		-0.656002,
		0,
		-0.064524,
		0.221592,
		-0.742236,
		1
	},
	[0.6] = {
		0.904283,
		0.181821,
		-0.386282,
		0,
		-0.129817,
		-0.74484,
		-0.654493,
		0,
		-0.406719,
		0.641993,
		-0.649942,
		0,
		-0.070291,
		0.226527,
		-0.74046,
		1
	},
	[0.733333333333] = {
		0.910632,
		0.170126,
		-0.376573,
		0,
		-0.126494,
		-0.752798,
		-0.645984,
		0,
		-0.393381,
		0.635887,
		-0.664002,
		0,
		-0.058793,
		0.217048,
		-0.744328,
		1
	},
	[0.766666666667] = {
		0.911958,
		0.167104,
		-0.374711,
		0,
		-0.125517,
		-0.755879,
		-0.642566,
		0,
		-0.390611,
		0.633027,
		-0.668356,
		0,
		-0.056254,
		0.215889,
		-0.745336,
		1
	},
	[0.7] = {
		0.909132,
		0.173198,
		-0.378789,
		0,
		-0.127489,
		-0.750072,
		-0.648951,
		0,
		-0.396516,
		0.638274,
		-0.659834,
		0,
		-0.061594,
		0.218968,
		-0.743288,
		1
	},
	[0.833333333333] = {
		0.913828,
		0.161534,
		-0.372592,
		0,
		-0.12393,
		-0.762793,
		-0.634656,
		0,
		-0.386729,
		0.626141,
		-0.677043,
		0,
		-0.052512,
		0.215526,
		-0.747253,
		1
	},
	[0.866666666667] = {
		0.914241,
		0.159136,
		-0.372611,
		0,
		-0.123474,
		-0.766467,
		-0.630303,
		0,
		-0.385898,
		0.622257,
		-0.681087,
		0,
		-0.05159,
		0.216159,
		-0.748154,
		1
	},
	[0.8] = {
		0.913046,
		0.164214,
		-0.373338,
		0,
		-0.124637,
		-0.759238,
		-0.638767,
		0,
		-0.388347,
		0.629755,
		-0.672752,
		0,
		-0.054114,
		0.215409,
		-0.746312,
		1
	},
	[0.933333333333] = {
		0.914031,
		0.155704,
		-0.374572,
		0,
		-0.122776,
		-0.773899,
		-0.621294,
		0,
		-0.386619,
		0.61387,
		-0.688251,
		0,
		-0.051651,
		0.218628,
		-0.749849,
		1
	},
	[0.966666666667] = {
		0.913681,
		0.154513,
		-0.375915,
		0,
		-0.122184,
		-0.777708,
		-0.616637,
		0,
		-0.38763,
		0.60934,
		-0.691699,
		0,
		-0.052115,
		0.22004,
		-0.750738,
		1
	},
	[0.9] = {
		0.914243,
		0.157179,
		-0.373437,
		0,
		-0.123202,
		-0.770196,
		-0.625795,
		0,
		-0.385981,
		0.618137,
		-0.684781,
		0,
		-0.051431,
		0.21722,
		-0.749012,
		1
	},
	[1.03333333333] = {
		0.912741,
		0.152433,
		-0.379036,
		0,
		-0.120668,
		-0.785801,
		-0.606593,
		0,
		-0.390312,
		0.5994,
		-0.698839,
		0,
		-0.053505,
		0.22192,
		-0.752818,
		1
	},
	[1.06666666667] = {
		0.912235,
		0.151492,
		-0.380628,
		0,
		-0.119825,
		-0.789813,
		-0.60153,
		0,
		-0.391752,
		0.594345,
		-0.702342,
		0,
		-0.054288,
		0.222343,
		-0.75394,
		1
	},
	[1.13333333333] = {
		0.911369,
		0.149699,
		-0.383401,
		0,
		-0.118176,
		-0.797118,
		-0.592147,
		0,
		-0.39426,
		0.584973,
		-0.708777,
		0,
		-0.055643,
		0.222053,
		-0.756144,
		1
	},
	[1.16666666667] = {
		0.911099,
		0.14881,
		-0.384387,
		0,
		-0.117453,
		-0.800165,
		-0.588167,
		0,
		-0.395099,
		0.581026,
		-0.711552,
		0,
		-0.056052,
		0.2213,
		-0.757135,
		1
	},
	[1.1] = {
		0.911763,
		0.150587,
		-0.382116,
		0,
		-0.118981,
		-0.793626,
		-0.596658,
		0,
		-0.393106,
		0.589475,
		-0.705682,
		0,
		-0.055027,
		0.222394,
		-0.755063,
		1
	},
	[1.23333333333] = {
		0.910944,
		0.146979,
		-0.385459,
		0,
		-0.116657,
		-0.80446,
		-0.582439,
		0,
		-0.395693,
		0.575536,
		-0.715672,
		0,
		-0.056254,
		0.218485,
		-0.758642,
		1
	},
	[1.2] = {
		0.910981,
		0.147907,
		-0.385016,
		0,
		-0.116876,
		-0.802652,
		-0.584885,
		0,
		-0.395542,
		0.577818,
		-0.713914,
		0,
		-0.056208,
		0.220117,
		-0.757989,
		1
	}
}

return spline_matrices

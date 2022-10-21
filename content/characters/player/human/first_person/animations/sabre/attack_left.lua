local spline_matrices = {
	[0] = {
		0.334413,
		0.800575,
		-0.49724,
		0,
		0.835956,
		-0.495597,
		-0.235717,
		0,
		-0.435139,
		-0.336844,
		-0.834979,
		0,
		0.235717,
		0.015711,
		-0.550465,
		1
	},
	[0.0166666666667] = {
		0.179233,
		0.752268,
		-0.63401,
		0,
		0.887372,
		-0.401876,
		-0.225978,
		0,
		-0.424789,
		-0.5221,
		-0.739571,
		0,
		0.281944,
		0.020549,
		-0.501272,
		1
	},
	[0.0333333333333] = {
		0.031912,
		0.653995,
		-0.755826,
		0,
		0.931337,
		-0.293919,
		-0.214997,
		0,
		-0.362759,
		-0.697067,
		-0.618469,
		0,
		0.330557,
		0.030646,
		-0.447943,
		1
	},
	[0.05] = {
		-0.089457,
		0.514005,
		-0.85311,
		0,
		0.963858,
		-0.171136,
		-0.20418,
		0,
		-0.250947,
		-0.840543,
		-0.480118,
		0,
		0.378853,
		0.047343,
		-0.392304,
		1
	},
	[0.0666666666667] = {
		-0.17095,
		0.350175,
		-0.920953,
		0,
		0.98017,
		-0.034625,
		-0.195107,
		0,
		-0.10021,
		-0.936044,
		-0.337312,
		0,
		0.423644,
		0.071431,
		-0.336452,
		1
	},
	[0.0833333333333] = {
		-0.207147,
		0.184915,
		-0.960675,
		0,
		0.975548,
		0.112781,
		-0.188645,
		0,
		0.073463,
		-0.976262,
		-0.203756,
		0,
		0.461893,
		0.102988,
		-0.28225,
		1
	},
	[0.116666666667] = {
		-0.16442,
		-0.073678,
		-0.983635,
		0,
		0.887459,
		0.424233,
		-0.18012,
		0,
		0.430562,
		-0.902551,
		-0.004366,
		0,
		0.509433,
		0.186201,
		-0.183344,
		1
	},
	[0.133333333333] = {
		-0.107947,
		-0.144449,
		-0.983607,
		0,
		0.796624,
		0.579338,
		-0.172506,
		0,
		0.594759,
		-0.802186,
		0.052533,
		0,
		0.515228,
		0.236441,
		-0.139774,
		1
	},
	[0.15] = {
		-0.044972,
		-0.170614,
		-0.984311,
		0,
		0.669074,
		0.726531,
		-0.156501,
		0,
		0.741834,
		-0.665615,
		0.081479,
		0,
		0.506879,
		0.291868,
		-0.100667,
		1
	},
	[0.166666666667] = {
		0.012528,
		-0.152531,
		-0.988219,
		0,
		0.500327,
		0.856638,
		-0.125878,
		0,
		0.865746,
		-0.492855,
		0.087047,
		0,
		0.482353,
		0.352334,
		-0.066512,
		1
	},
	[0.183333333333] = {
		0.052398,
		-0.044259,
		-0.997645,
		0,
		0.232705,
		0.972056,
		-0.030902,
		0,
		0.971135,
		-0.230538,
		0.061234,
		0,
		0.421941,
		0.442082,
		-0.066938,
		1
	},
	[0.1] = {
		-0.201671,
		0.038771,
		-0.978686,
		0,
		0.945858,
		0.267167,
		-0.184322,
		0,
		0.254326,
		-0.96287,
		-0.090551,
		0,
		0.491125,
		0.1415,
		-0.230977,
		1
	},
	[0.216666666667] = {
		-0.071148,
		0.314954,
		-0.946436,
		0,
		-0.271091,
		0.907021,
		0.322216,
		0,
		0.959921,
		0.279495,
		0.020849,
		0,
		0.170733,
		0.592614,
		-0.056065,
		1
	},
	[0.233333333333] = {
		-0.002186,
		0.097377,
		-0.995245,
		0,
		-0.628019,
		0.774365,
		0.077145,
		0,
		0.778195,
		0.625202,
		0.059462,
		0,
		0.050058,
		0.649167,
		-0.046931,
		1
	},
	[0.25] = {
		-0.06432,
		0.053535,
		-0.996492,
		0,
		-0.990874,
		0.115107,
		0.070141,
		0,
		0.118458,
		0.991909,
		0.045643,
		0,
		-0.121,
		0.610335,
		-0.038361,
		1
	},
	[0.266666666667] = {
		-0.024948,
		0.118954,
		-0.992586,
		0,
		-0.955445,
		-0.294953,
		-0.011333,
		0,
		-0.294115,
		0.948078,
		0.121012,
		0,
		-0.299187,
		0.498283,
		-0.072738,
		1
	},
	[0.283333333333] = {
		0.201799,
		0.257393,
		-0.945001,
		0,
		-0.833676,
		-0.461272,
		-0.303664,
		0,
		-0.514064,
		0.849103,
		0.121499,
		0,
		-0.421429,
		0.35543,
		-0.092262,
		1
	},
	[0.2] = {
		0.043026,
		0.060766,
		-0.997224,
		0,
		-0.075388,
		0.9955,
		0.057408,
		0,
		0.996226,
		0.072709,
		0.047413,
		0,
		0.306185,
		0.538378,
		-0.077747,
		1
	},
	[0.316666666667] = {
		0.180956,
		0.275295,
		-0.944176,
		0,
		-0.782943,
		-0.540668,
		-0.307698,
		0,
		-0.595194,
		0.794915,
		0.117703,
		0,
		-0.493266,
		0.026773,
		-0.088062,
		1
	},
	[0.333333333333] = {
		0.198732,
		0.212873,
		-0.956656,
		0,
		-0.798551,
		-0.530726,
		-0.283984,
		0,
		-0.568174,
		0.820375,
		0.064518,
		0,
		-0.502356,
		-0.055435,
		-0.09477,
		1
	},
	[0.35] = {
		0.226612,
		0.198075,
		-0.953632,
		0,
		-0.782637,
		-0.545779,
		-0.29934,
		0,
		-0.579763,
		0.814182,
		0.031341,
		0,
		-0.502652,
		-0.060063,
		-0.099869,
		1
	},
	[0.366666666667] = {
		0.259915,
		0.182965,
		-0.948139,
		0,
		-0.7646,
		-0.560704,
		-0.317802,
		0,
		-0.589772,
		0.807549,
		-0.00584,
		0,
		-0.501154,
		-0.064588,
		-0.108358,
		1
	},
	[0.383333333333] = {
		0.298343,
		0.167688,
		-0.939613,
		0,
		-0.744141,
		-0.575613,
		-0.339004,
		0,
		-0.5977,
		0.800344,
		-0.046946,
		0,
		-0.497907,
		-0.068969,
		-0.120151,
		1
	},
	[0.3] = {
		0.178331,
		0.336414,
		-0.924675,
		0,
		-0.765567,
		-0.542922,
		-0.345171,
		0,
		-0.618147,
		0.769455,
		0.160727,
		0,
		-0.46868,
		0.198966,
		-0.083972,
		1
	},
	[0.416666666667] = {
		0.388949,
		0.137279,
		-0.910974,
		0,
		-0.694703,
		-0.605745,
		-0.387893,
		0,
		-0.605067,
		0.783727,
		-0.140236,
		0,
		-0.486443,
		-0.077189,
		-0.153206,
		1
	},
	[0.433333333333] = {
		0.440045,
		0.122513,
		-0.889579,
		0,
		-0.665117,
		-0.621102,
		-0.41455,
		0,
		-0.603307,
		0.774095,
		-0.191828,
		0,
		-0.478374,
		-0.081057,
		-0.17413,
		1
	},
	[0.45] = {
		0.494071,
		0.108312,
		-0.862648,
		0,
		-0.631943,
		-0.636703,
		-0.44188,
		0,
		-0.597112,
		0.763465,
		-0.246129,
		0,
		-0.468829,
		-0.08481,
		-0.197708,
		1
	},
	[0.466666666667] = {
		0.550159,
		0.0949,
		-0.82965,
		0,
		-0.595004,
		-0.652549,
		-0.469202,
		0,
		-0.585915,
		0.75178,
		-0.30254,
		0,
		-0.457855,
		-0.088481,
		-0.223706,
		1
	},
	[0.483333333333] = {
		0.607312,
		0.082506,
		-0.790167,
		0,
		-0.554219,
		-0.668613,
		-0.49578,
		0,
		-0.569221,
		0.739019,
		-0.36033,
		0,
		-0.445499,
		-0.092099,
		-0.251868,
		1
	},
	[0.4] = {
		0.341515,
		0.152401,
		-0.927438,
		0,
		-0.720947,
		-0.590601,
		-0.362528,
		0,
		-0.602995,
		0.792442,
		-0.091826,
		0,
		-0.492977,
		-0.073169,
		-0.13515,
		1
	},
	[0.516666666667] = {
		0.720311,
		0.061684,
		-0.690903,
		0,
		-0.461396,
		-0.701126,
		-0.543632,
		0,
		-0.517944,
		0.710364,
		-0.476568,
		0,
		-0.416847,
		-0.099239,
		-0.313562,
		1
	},
	[0.533333333333] = {
		0.773751,
		0.053673,
		-0.631212,
		0,
		-0.409844,
		-0.717367,
		-0.563393,
		0,
		-0.48305,
		0.694625,
		-0.533066,
		0,
		-0.400685,
		-0.102763,
		-0.346475,
		1
	},
	[0.55] = {
		0.823544,
		0.04749,
		-0.56526,
		0,
		-0.355428,
		-0.733421,
		-0.579452,
		0,
		-0.442092,
		0.678114,
		-0.587126,
		0,
		-0.383416,
		-0.10624,
		-0.380321,
		1
	},
	[0.566666666667] = {
		0.86857,
		0.043256,
		-0.493675,
		0,
		-0.298734,
		-0.749134,
		-0.591232,
		0,
		-0.395403,
		0.661004,
		-0.637754,
		0,
		-0.365155,
		-0.109648,
		-0.414746,
		1
	},
	[0.583333333333] = {
		0.907845,
		0.041039,
		-0.417293,
		0,
		-0.240454,
		-0.764349,
		-0.598291,
		0,
		-0.343511,
		0.643495,
		-0.684043,
		0,
		-0.346046,
		-0.112962,
		-0.44939,
		1
	},
	[0.5] = {
		0.664425,
		0.071361,
		-0.74394,
		0,
		-0.509626,
		-0.684836,
		-0.520847,
		0,
		-0.546645,
		0.725195,
		-0.418655,
		0,
		-0.431809,
		-0.095683,
		-0.281919,
		1
	},
	[0.616666666667] = {
		0.966183,
		0.042643,
		-0.254306,
		0,
		-0.122217,
		-0.792685,
		-0.597256,
		0,
		-0.227053,
		0.608139,
		-0.760667,
		0,
		-0.305981,
		-0.119219,
		-0.517916,
		1
	},
	[0.633333333333] = {
		0.984351,
		0.046326,
		-0.170021,
		0,
		-0.063838,
		-0.805547,
		-0.589083,
		0,
		-0.16425,
		0.590718,
		-0.789983,
		0,
		-0.285432,
		-0.122132,
		-0.55114,
		1
	},
	[0.65] = {
		0.994997,
		0.051759,
		-0.085456,
		0,
		-0.006951,
		-0.817408,
		-0.576018,
		0,
		-0.099667,
		0.57373,
		-0.812958,
		0,
		-0.26483,
		-0.124887,
		-0.583287,
		1
	},
	[0.666666666667] = {
		0.99827,
		0.058772,
		-0.001734,
		0,
		0.04779,
		-0.828206,
		-0.558383,
		0,
		-0.034253,
		0.557334,
		-0.829581,
		0,
		-0.243104,
		-0.126845,
		-0.61275,
		1
	},
	[0.683333333333] = {
		0.994518,
		0.067173,
		0.080131,
		0,
		0.09983,
		-0.837909,
		-0.536602,
		0,
		0.031097,
		0.54166,
		-0.840022,
		0,
		-0.215148,
		-0.125347,
		-0.632744,
		1
	},
	[0.6] = {
		0.940573,
		0.040849,
		-0.337127,
		0,
		-0.18135,
		-0.778913,
		-0.600339,
		0,
		-0.287115,
		0.625801,
		-0.725216,
		0,
		-0.326257,
		-0.116158,
		-0.483894,
		1
	},
	[0.716666666667] = {
		0.968071,
		0.087345,
		0.234968,
		0,
		0.19419,
		-0.854051,
		-0.482584,
		0,
		0.158523,
		0.512804,
		-0.843743,
		0,
		-0.162432,
		-0.122142,
		-0.664145,
		1
	},
	[0.733333333333] = {
		0.946674,
		0.098736,
		0.30669,
		0,
		0.23599,
		-0.860555,
		-0.451392,
		0,
		0.219355,
		0.499697,
		-0.837966,
		0,
		-0.138241,
		-0.12057,
		-0.675953,
		1
	},
	[0.75] = {
		0.920767,
		0.110768,
		0.374056,
		0,
		0.274036,
		-0.866087,
		-0.418089,
		0,
		0.277654,
		0.487467,
		-0.827819,
		0,
		-0.115758,
		-0.119084,
		-0.685485,
		1
	},
	[0.766666666667] = {
		0.891052,
		0.123301,
		0.436833,
		0,
		0.308318,
		-0.870716,
		-0.383137,
		0,
		0.333116,
		0.476078,
		-0.813869,
		0,
		-0.095111,
		-0.117721,
		-0.692986,
		1
	},
	[0.783333333333] = {
		0.858196,
		0.136219,
		0.494919,
		0,
		0.338893,
		-0.874516,
		-0.346948,
		0,
		0.385554,
		0.465474,
		-0.79667,
		0,
		-0.076392,
		-0.116514,
		-0.698687,
		1
	},
	[0.7] = {
		0.984246,
		0.076763,
		0.159268,
		0,
		0.148736,
		-0.846517,
		-0.511162,
		0,
		0.095585,
		0.526798,
		-0.844599,
		0,
		-0.18815,
		-0.123754,
		-0.649816,
		1
	},
	[0.816666666667] = {
		0.785449,
		0.162883,
		0.597108,
		0,
		0.389403,
		-0.879929,
		-0.272196,
		0,
		0.481077,
		0.446312,
		-0.754567,
		0,
		-0.045005,
		-0.114703,
		-0.705489,
		1
	},
	[0.833333333333] = {
		0.746583,
		0.176534,
		0.641443,
		0,
		0.409651,
		-0.881681,
		-0.234146,
		0,
		0.524214,
		0.437577,
		-0.730566,
		0,
		-0.032463,
		-0.114175,
		-0.706908,
		1
	},
	[0.85] = {
		0.706613,
		0.190379,
		0.681508,
		0,
		0.426793,
		-0.88288,
		-0.195883,
		0,
		0.564398,
		0.429277,
		-0.705107,
		0,
		-0.022122,
		-0.113967,
		-0.707154,
		1
	},
	[0.866666666667] = {
		0.665868,
		0.204431,
		0.717515,
		0,
		0.441,
		-0.883577,
		-0.157512,
		0,
		0.60178,
		0.421307,
		-0.6785,
		0,
		-0.014083,
		-0.11417,
		-0.706279,
		1
	},
	[0.883333333333] = {
		0.624603,
		0.218729,
		0.749686,
		0,
		0.452433,
		-0.883812,
		-0.119084,
		0,
		0.636534,
		0.413563,
		-0.650992,
		0,
		-0.008474,
		-0.114926,
		-0.704277,
		1
	},
	[0.8] = {
		0.822812,
		0.149433,
		0.548316,
		0,
		0.365872,
		-0.877563,
		-0.309872,
		0,
		0.434877,
		0.45558,
		-0.776743,
		0,
		-0.05967,
		-0.115496,
		-0.702796,
		1
	}
}

return spline_matrices
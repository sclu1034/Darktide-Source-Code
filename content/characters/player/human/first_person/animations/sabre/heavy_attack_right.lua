local spline_matrices = {
	[0] = {
		-0.029745,
		-0.565802,
		0.824005,
		0,
		-0.870992,
		0.419118,
		0.256345,
		0,
		-0.490396,
		-0.710077,
		-0.505276,
		0,
		-0.334152,
		0.256632,
		-0.233792,
		1
	},
	[0.0166666666667] = {
		0.112365,
		-0.58721,
		0.801597,
		0,
		-0.882581,
		0.311658,
		0.352022,
		0,
		-0.456535,
		-0.74703,
		-0.483242,
		0,
		-0.352599,
		0.287584,
		-0.212095,
		1
	},
	[0.0333333333333] = {
		0.253634,
		-0.591901,
		0.765064,
		0,
		-0.872942,
		0.200662,
		0.444642,
		0,
		-0.416703,
		-0.780633,
		-0.465801,
		0,
		-0.369686,
		0.318034,
		-0.190358,
		1
	},
	[0.05] = {
		0.332414,
		-0.563848,
		0.756027,
		0,
		-0.852964,
		0.162315,
		0.496091,
		0,
		-0.402435,
		-0.809771,
		-0.426986,
		0,
		-0.375497,
		0.345388,
		-0.167645,
		1
	},
	[0.0666666666667] = {
		0.3277,
		-0.508976,
		0.795963,
		0,
		-0.84286,
		0.223135,
		0.489691,
		0,
		-0.426848,
		-0.831357,
		-0.355874,
		0,
		-0.370776,
		0.368757,
		-0.14362,
		1
	},
	[0.0833333333333] = {
		0.274692,
		-0.428846,
		0.860602,
		0,
		-0.833377,
		0.340255,
		0.435555,
		0,
		-0.47961,
		-0.83685,
		-0.263925,
		0,
		-0.359812,
		0.389893,
		-0.118995,
		1
	},
	[0.116666666667] = {
		0.150619,
		-0.164611,
		0.974791,
		0,
		-0.750258,
		0.623065,
		0.221141,
		0,
		-0.64376,
		-0.764652,
		-0.029655,
		0,
		-0.30406,
		0.4326,
		-0.068591,
		1
	},
	[0.133333333333] = {
		0.127814,
		0.05233,
		0.990417,
		0,
		-0.640672,
		0.766656,
		0.042171,
		0,
		-0.757102,
		-0.639922,
		0.131516,
		0,
		-0.236036,
		0.457954,
		-0.042185,
		1
	},
	[0.15] = {
		0.059859,
		0.107169,
		0.992437,
		0,
		-0.536606,
		0.8418,
		-0.058537,
		0,
		-0.841707,
		-0.529044,
		0.107897,
		0,
		-0.20659,
		0.460229,
		-0.022899,
		1
	},
	[0.166666666667] = {
		0.004494,
		0.080755,
		0.996724,
		0,
		-0.319895,
		0.944473,
		-0.07508,
		0,
		-0.947442,
		-0.31851,
		0.030078,
		0,
		-0.151318,
		0.489175,
		-0.010098,
		1
	},
	[0.183333333333] = {
		-0.001817,
		-0.060507,
		0.998166,
		0,
		0.284297,
		0.956948,
		0.058526,
		0,
		-0.958735,
		0.283882,
		0.015463,
		0,
		0.036672,
		0.617964,
		-0.006836,
		1
	},
	[0.1] = {
		0.204497,
		-0.314074,
		0.927113,
		0,
		-0.806052,
		0.483354,
		0.341538,
		0,
		-0.555392,
		-0.817145,
		-0.154316,
		0,
		-0.33882,
		0.410515,
		-0.093981,
		1
	},
	[0.216666666667] = {
		-0.161369,
		-0.006817,
		0.986871,
		0,
		0.935668,
		-0.31904,
		0.150792,
		0,
		0.313823,
		0.947717,
		0.057861,
		0,
		0.4047,
		0.600536,
		-0.061614,
		1
	},
	[0.233333333333] = {
		-0.063626,
		0.069053,
		0.995582,
		0,
		0.525669,
		-0.845672,
		0.09225,
		0,
		0.848306,
		0.529216,
		0.017508,
		0,
		0.575299,
		0.42909,
		-0.088393,
		1
	},
	[0.25] = {
		0.190261,
		-0.063093,
		0.979704,
		0,
		0.181446,
		-0.97848,
		-0.098252,
		0,
		0.96482,
		0.196457,
		-0.174719,
		0,
		0.735097,
		0.140125,
		-0.134338,
		1
	},
	[0.266666666667] = {
		0.395562,
		-0.25877,
		0.881232,
		0,
		0.011573,
		-0.958008,
		-0.286509,
		0,
		0.918367,
		0.12353,
		-0.375956,
		0,
		0.739767,
		-0.0887,
		-0.178124,
		1
	},
	[0.283333333333] = {
		0.48377,
		-0.352588,
		0.801029,
		0,
		-0.108942,
		-0.9324,
		-0.344619,
		0,
		0.868388,
		0.079451,
		-0.489479,
		0,
		0.707551,
		-0.165948,
		-0.20584,
		1
	},
	[0.2] = {
		-0.063568,
		-0.041977,
		0.997094,
		0,
		0.952437,
		0.295818,
		0.073174,
		0,
		-0.298031,
		0.954321,
		0.021176,
		0,
		0.229889,
		0.681715,
		-0.011161,
		1
	},
	[0.316666666667] = {
		0.59344,
		-0.490757,
		0.637955,
		0,
		-0.296782,
		-0.870181,
		-0.393326,
		0,
		0.748164,
		0.044082,
		-0.662048,
		0,
		0.649586,
		-0.25395,
		-0.245051,
		1
	},
	[0.333333333333] = {
		0.627362,
		-0.536887,
		0.564065,
		0,
		-0.364183,
		-0.842528,
		-0.396883,
		0,
		0.688322,
		0.043567,
		-0.724095,
		0,
		0.626587,
		-0.280579,
		-0.260005,
		1
	},
	[0.35] = {
		0.653699,
		-0.570196,
		0.497549,
		0,
		-0.416176,
		-0.819999,
		-0.392938,
		0,
		0.632041,
		0.049795,
		-0.773334,
		0,
		0.606915,
		-0.301302,
		-0.273461,
		1
	},
	[0.366666666667] = {
		0.67565,
		-0.592572,
		0.438584,
		0,
		-0.454817,
		-0.803251,
		-0.384616,
		0,
		0.580206,
		0.060391,
		-0.812228,
		0,
		0.589814,
		-0.318271,
		-0.286235,
		1
	},
	[0.383333333333] = {
		0.695418,
		-0.60563,
		0.38679,
		0,
		-0.481981,
		-0.792327,
		-0.374049,
		0,
		0.533,
		0.073695,
		-0.8429,
		0,
		0.574604,
		-0.332801,
		-0.298968,
		1
	},
	[0.3] = {
		0.547496,
		-0.429842,
		0.717973,
		0,
		-0.212058,
		-0.90125,
		-0.377861,
		0,
		0.809494,
		0.054625,
		-0.584582,
		0,
		0.676553,
		-0.217818,
		-0.227476,
		1
	},
	[0.416666666667] = {
		0.73364,
		-0.608675,
		0.302136,
		0,
		-0.507886,
		-0.786537,
		-0.3513,
		0,
		0.451469,
		0.104278,
		-0.886173,
		0,
		0.547529,
		-0.357499,
		-0.326429,
		1
	},
	[0.433333333333] = {
		0.753482,
		-0.600417,
		0.267889,
		0,
		-0.508899,
		-0.790589,
		-0.340575,
		0,
		0.416277,
		0.120288,
		-0.901246,
		0,
		0.534606,
		-0.368472,
		-0.342134,
		1
	},
	[0.45] = {
		0.774169,
		-0.586464,
		0.238166,
		0,
		-0.503079,
		-0.79843,
		-0.330787,
		0,
		0.384154,
		0.136269,
		-0.913158,
		0,
		0.521381,
		-0.378759,
		-0.359821,
		1
	},
	[0.466666666667] = {
		0.795674,
		-0.567268,
		0.212392,
		0,
		-0.491065,
		-0.809386,
		-0.322102,
		0,
		0.354625,
		0.151989,
		-0.922573,
		0,
		0.507256,
		-0.388347,
		-0.380028,
		1
	},
	[0.483333333333] = {
		0.817799,
		-0.543216,
		0.190058,
		0,
		-0.473404,
		-0.822759,
		-0.314573,
		0,
		0.327253,
		0.167283,
		-0.930012,
		0,
		0.491526,
		-0.397065,
		-0.40332,
		1
	},
	[0.4] = {
		0.714449,
		-0.610665,
		0.341541,
		0,
		-0.499247,
		-0.786919,
		-0.362644,
		0,
		0.490219,
		0.088577,
		-0.867087,
		0,
		0.560689,
		-0.345708,
		-0.312202,
		1
	},
	[0.516666666667] = {
		0.862515,
		-0.482061,
		0.153899,
		0,
		-0.423209,
		-0.85391,
		-0.302873,
		0,
		0.277419,
		0.196101,
		-0.940523,
		0,
		0.452873,
		-0.409967,
		-0.46028,
		1
	},
	[0.533333333333] = {
		0.884212,
		-0.445846,
		0.139252,
		0,
		-0.391798,
		-0.870268,
		-0.298544,
		0,
		0.254291,
		0.209418,
		-0.944182,
		0,
		0.428467,
		-0.414424,
		-0.491532,
		1
	},
	[0.55] = {
		0.904812,
		-0.406627,
		0.126373,
		0,
		-0.357068,
		-0.886243,
		-0.295086,
		0,
		0.231987,
		0.221874,
		-0.947076,
		0,
		0.398383,
		-0.416512,
		-0.526347,
		1
	},
	[0.566666666667] = {
		0.923839,
		-0.365137,
		0.114875,
		0,
		-0.319844,
		-0.901228,
		-0.292382,
		0,
		0.210288,
		0.233372,
		-0.949377,
		0,
		0.362854,
		-0.414826,
		-0.563147,
		1
	},
	[0.583333333333] = {
		0.94088,
		-0.322262,
		0.104362,
		0,
		-0.281099,
		-0.914714,
		-0.290315,
		0,
		0.189019,
		0.243816,
		-0.951223,
		0,
		0.322095,
		-0.408516,
		-0.600345,
		1
	},
	[0.5] = {
		0.840219,
		-0.514678,
		0.170702,
		0,
		-0.450609,
		-0.837839,
		-0.308184,
		0,
		0.301636,
		0.182023,
		-0.935886,
		0,
		0.473341,
		-0.404556,
		-0.430259,
		1
	},
	[0.616666666667] = {
		0.967899,
		-0.236656,
		0.084643,
		0,
		-0.203657,
		-0.935825,
		-0.287674,
		0,
		0.147291,
		0.261201,
		-0.953981,
		0,
		0.226442,
		-0.365977,
		-0.648808,
		1
	},
	[0.633333333333] = {
		0.977685,
		-0.196392,
		0.074574,
		0,
		-0.167577,
		-0.943184,
		-0.286918,
		0,
		0.126685,
		0.268019,
		-0.955048,
		0,
		0.180694,
		-0.338195,
		-0.660477,
		1
	},
	[0.65] = {
		0.985118,
		-0.159613,
		0.063768,
		0,
		-0.135142,
		-0.948521,
		-0.286433,
		0,
		0.106204,
		0.273552,
		-0.955976,
		0,
		0.140693,
		-0.313806,
		-0.669867,
		1
	},
	[0.666666666667] = {
		0.990459,
		-0.12771,
		0.05177,
		0,
		-0.107809,
		-0.952106,
		-0.286131,
		0,
		0.085833,
		0.27782,
		-0.956791,
		0,
		0.107531,
		-0.293628,
		-0.677054,
		1
	},
	[0.683333333333] = {
		0.994047,
		-0.102062,
		0.038131,
		0,
		-0.087014,
		-0.954298,
		-0.285908,
		0,
		0.065569,
		0.280888,
		-0.957498,
		0,
		0.082203,
		-0.278389,
		-0.682073,
		1
	},
	[0.6] = {
		0.955625,
		-0.279043,
		0.094426,
		0,
		-0.241951,
		-0.926319,
		-0.288777,
		0,
		0.168049,
		0.253116,
		-0.952728,
		0,
		0.276703,
		-0.3961,
		-0.634716,
		1
	},
	[0.716666666667] = {
		0.996214,
		-0.083995,
		0.02242,
		0,
		-0.074132,
		-0.955474,
		-0.285613,
		0,
		0.045412,
		0.282869,
		-0.958083,
		0,
		0.065636,
		-0.268786,
		-0.684875,
		1
	},
	[0.733333333333] = {
		0.996214,
		-0.083995,
		0.02242,
		0,
		-0.074132,
		-0.955474,
		-0.285613,
		0,
		0.045412,
		0.282869,
		-0.958083,
		0,
		0.065636,
		-0.268786,
		-0.684875,
		1
	},
	[0.75] = {
		0.996214,
		-0.083995,
		0.02242,
		0,
		-0.074132,
		-0.955474,
		-0.285613,
		0,
		0.045412,
		0.282869,
		-0.958083,
		0,
		0.065636,
		-0.268786,
		-0.684875,
		1
	},
	[0.7] = {
		0.996214,
		-0.083995,
		0.02242,
		0,
		-0.074132,
		-0.955474,
		-0.285613,
		0,
		0.045412,
		0.282869,
		-0.958083,
		0,
		0.065636,
		-0.268786,
		-0.684875,
		1
	}
}

return spline_matrices

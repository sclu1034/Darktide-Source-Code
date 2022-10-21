local spline_matrices = {
	[0] = {
		0.687684,
		0.718484,
		0.104267,
		0,
		0.696734,
		-0.61274,
		-0.372975,
		0,
		-0.204088,
		0.329136,
		-0.921964,
		0,
		-0.176372,
		-0.378102,
		-0.20679,
		1
	},
	[0.0333333333333] = {
		0.022788,
		0.941497,
		-0.336251,
		0,
		0.927717,
		-0.145263,
		-0.343861,
		0,
		-0.372589,
		-0.304109,
		-0.876753,
		0,
		-0.2501,
		-0.405595,
		-0.211008,
		1
	},
	[0.0666666666667] = {
		-0.730907,
		0.461186,
		-0.503073,
		0,
		0.571555,
		0.01081,
		-0.820493,
		0,
		-0.372962,
		-0.887238,
		-0.271494,
		0,
		-0.325603,
		-0.385041,
		-0.140922,
		1
	},
	[0.133333333333] = {
		-0.996174,
		0.065188,
		0.0582,
		0,
		-0.06416,
		-0.093402,
		-0.993559,
		0,
		-0.059332,
		-0.993492,
		0.097227,
		0,
		-0.22097,
		-0.266874,
		-0.025505,
		1
	},
	[0.166666666667] = {
		-0.973041,
		-0.145627,
		0.17884,
		0,
		-0.180824,
		0.000391,
		-0.983515,
		0,
		0.143157,
		-0.989339,
		-0.026713,
		0,
		-0.150563,
		-0.223797,
		0.062555,
		1
	},
	[0.1] = {
		-0.969672,
		0.231344,
		-0.07885,
		0,
		0.062358,
		-0.077764,
		-0.99502,
		0,
		-0.236323,
		-0.969759,
		0.060979,
		0,
		-0.300184,
		-0.311278,
		-0.08171,
		1
	},
	[0.233333333333] = {
		-0.96785,
		-0.140266,
		0.208787,
		0,
		-0.218048,
		0.054091,
		-0.974438,
		0,
		0.125387,
		-0.988635,
		-0.082936,
		0,
		-0.191646,
		-0.07508,
		0.21526,
		1
	},
	[0.266666666667] = {
		-0.96254,
		0.133899,
		-0.235769,
		0,
		0.236101,
		-0.013626,
		-0.971633,
		0,
		-0.133313,
		-0.990901,
		-0.018498,
		0,
		-0.244248,
		0.059854,
		0.229467,
		1
	},
	[0.2] = {
		-0.903438,
		-0.260695,
		0.340351,
		0,
		-0.376542,
		0.102927,
		-0.920664,
		0,
		0.204981,
		-0.959919,
		-0.191151,
		0,
		-0.137515,
		-0.164764,
		0.154992,
		1
	},
	[0.333333333333] = {
		-0.910397,
		-0.050584,
		-0.410631,
		0,
		-0.207547,
		-0.802749,
		0.559033,
		0,
		-0.357912,
		0.594167,
		0.720322,
		0,
		-0.008926,
		0.637743,
		-0.014392,
		1
	},
	[0.366666666667] = {
		-0.903599,
		-0.012001,
		-0.42821,
		0,
		-0.394895,
		-0.364092,
		0.843502,
		0,
		-0.166031,
		0.931286,
		0.324254,
		0,
		0.082515,
		0.63827,
		-0.18013,
		1
	},
	[0.3] = {
		-0.851432,
		0.216092,
		-0.477878,
		0,
		0.389102,
		-0.350681,
		-0.851835,
		0,
		-0.351657,
		-0.911223,
		0.2145,
		0,
		-0.21374,
		0.240514,
		0.236771,
		1
	},
	[0.433333333333] = {
		-0.899126,
		0.040115,
		-0.435847,
		0,
		-0.432056,
		0.077904,
		0.898476,
		0,
		0.069997,
		0.996153,
		-0.052713,
		0,
		0.226065,
		0.449626,
		-0.526252,
		1
	},
	[0.466666666667] = {
		-0.928572,
		-0.181589,
		-0.323697,
		0,
		-0.371152,
		0.45592,
		0.808939,
		0,
		0.000686,
		0.871299,
		-0.490751,
		0,
		0.174567,
		0.356802,
		-0.626983,
		1
	},
	[0.4] = {
		-0.906006,
		-0.000252,
		-0.423264,
		0,
		-0.414375,
		-0.203335,
		0.887101,
		0,
		-0.086288,
		0.979109,
		0.184119,
		0,
		0.162541,
		0.576922,
		-0.347306,
		1
	},
	[0.533333333333] = {
		-0.947024,
		-0.306964,
		-0.094438,
		0,
		-0.249622,
		0.518512,
		0.817823,
		0,
		-0.202075,
		0.798072,
		-0.567668,
		0,
		0.069711,
		-0.060823,
		-0.474734,
		1
	},
	[0.566666666667] = {
		-0.960258,
		-0.26695,
		-0.081503,
		0,
		-0.170236,
		0.328744,
		0.928949,
		0,
		-0.221189,
		0.905906,
		-0.361123,
		0,
		0.0201,
		-0.390265,
		-0.28748,
		1
	},
	[0.5] = {
		-0.943905,
		-0.285595,
		-0.165767,
		0,
		-0.310532,
		0.596962,
		0.739734,
		0,
		-0.112308,
		0.749715,
		-0.652161,
		0,
		0.123127,
		0.234211,
		-0.62269,
		1
	},
	[0.633333333333] = {
		-0.991684,
		-0.034248,
		0.12406,
		0,
		0.113871,
		0.215727,
		0.969791,
		0,
		-0.059977,
		0.975853,
		-0.210033,
		0,
		0.026468,
		-0.459099,
		-0.176167,
		1
	},
	[0.666666666667] = {
		-0.991694,
		-0.031029,
		0.124823,
		0,
		0.115035,
		0.220153,
		0.968659,
		0,
		-0.057537,
		0.974972,
		-0.214755,
		0,
		0.025151,
		-0.460021,
		-0.173941,
		1
	},
	[0.6] = {
		-0.984451,
		-0.159497,
		-0.073596,
		0,
		-0.094372,
		0.126861,
		0.987421,
		0,
		-0.148154,
		0.979013,
		-0.139941,
		0,
		0.02854,
		-0.453111,
		-0.179376,
		1
	},
	[0.733333333333] = {
		-0.99168,
		-0.024594,
		0.126355,
		0,
		0.117313,
		0.231415,
		0.965756,
		0,
		-0.052992,
		0.972544,
		-0.226605,
		0,
		0.022668,
		-0.462233,
		-0.168327,
		1
	},
	[0.766666666667] = {
		-0.991655,
		-0.02227,
		0.126979,
		0,
		0.118174,
		0.236604,
		0.964393,
		0,
		-0.051521,
		0.971351,
		-0.231998,
		0,
		0.02183,
		-0.463201,
		-0.165758,
		1
	},
	[0.7] = {
		-0.991693,
		-0.027663,
		0.125615,
		0,
		0.116224,
		0.225658,
		0.967249,
		0,
		-0.055103,
		0.973814,
		-0.220569,
		0,
		0.02383,
		-0.461121,
		-0.171192,
		1
	},
	[0.833333333333] = {
		-0.991589,
		-0.021179,
		0.127679,
		0,
		0.118828,
		0.241956,
		0.962983,
		0,
		-0.051288,
		0.970056,
		-0.237404,
		0,
		0.021557,
		-0.46413,
		-0.163174,
		1
	},
	[0.866666666667] = {
		-0.991575,
		-0.02186,
		0.127677,
		0,
		0.118738,
		0.240568,
		0.963342,
		0,
		-0.051773,
		0.970386,
		-0.235946,
		0,
		0.021781,
		-0.463874,
		-0.163871,
		1
	},
	[0.8] = {
		-0.991621,
		-0.021144,
		0.127437,
		0,
		0.118683,
		0.240408,
		0.963389,
		0,
		-0.051007,
		0.970442,
		-0.235884,
		0,
		0.021481,
		-0.463877,
		-0.163901,
		1
	},
	[0.9] = {
		-0.991566,
		-0.022567,
		0.127625,
		0,
		0.118641,
		0.238334,
		0.963909,
		0,
		-0.05217,
		0.970921,
		-0.233646,
		0,
		0.02197,
		-0.463475,
		-0.16497,
		1
	}
}

return spline_matrices
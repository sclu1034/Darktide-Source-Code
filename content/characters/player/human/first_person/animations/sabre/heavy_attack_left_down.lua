local spline_matrices = {
	[0] = {
		0.985073,
		0.050649,
		-0.164517,
		0,
		0.14745,
		0.244885,
		0.958274,
		0,
		0.088823,
		-0.968228,
		0.233761,
		0,
		0.342941,
		0.242514,
		0.303841,
		1
	},
	[0.0166666666667] = {
		0.980095,
		0.070418,
		-0.185619,
		0,
		0.169209,
		0.192712,
		0.966556,
		0,
		0.103834,
		-0.978725,
		0.176961,
		0,
		0.339418,
		0.24897,
		0.29634,
		1
	},
	[0.0333333333333] = {
		0.97365,
		0.095329,
		-0.207166,
		0,
		0.195726,
		0.11689,
		0.973667,
		0,
		0.117034,
		-0.988559,
		0.095152,
		0,
		0.326247,
		0.269828,
		0.27962,
		1
	},
	[0.05] = {
		0.96685,
		0.1194,
		-0.22571,
		0,
		0.220752,
		0.053408,
		0.973867,
		0,
		0.128334,
		-0.991409,
		0.02528,
		0,
		0.305602,
		0.300206,
		0.258354,
		1
	},
	[0.0666666666667] = {
		0.961116,
		0.135426,
		-0.240659,
		0,
		0.23778,
		0.03729,
		0.970603,
		0,
		0.140419,
		-0.990086,
		0.003639,
		0,
		0.279835,
		0.334556,
		0.237661,
		1
	},
	[0.0833333333333] = {
		0.958107,
		0.13553,
		-0.252313,
		0,
		0.239581,
		0.103483,
		0.965346,
		0,
		0.156943,
		-0.985354,
		0.066677,
		0,
		0.25133,
		0.367501,
		0.222616,
		1
	},
	[0.116666666667] = {
		0.966361,
		0.051173,
		-0.252047,
		0,
		0.181716,
		0.557669,
		0.809929,
		0,
		0.182005,
		-0.828484,
		0.529611,
		0,
		0.170868,
		0.443592,
		0.207453,
		1
	},
	[0.133333333333] = {
		0.976991,
		0.024456,
		-0.211872,
		0,
		0.106048,
		0.806194,
		0.58207,
		0,
		0.185045,
		-0.591146,
		0.785051,
		0,
		0.126575,
		0.496324,
		0.185572,
		1
	},
	[0.15] = {
		0.987066,
		0.071758,
		-0.143361,
		0,
		-0.043885,
		0.981019,
		0.188883,
		0,
		0.154194,
		-0.180148,
		0.971479,
		0,
		0.083918,
		0.564834,
		0.136063,
		1
	},
	[0.166666666667] = {
		0.988261,
		0.048516,
		-0.144866,
		0,
		-0.072459,
		0.983649,
		-0.16488,
		0,
		0.134498,
		0.173441,
		0.975617,
		0,
		0.05824,
		0.623172,
		0.055988,
		1
	},
	[0.183333333333] = {
		0.984604,
		0.064866,
		-0.16232,
		0,
		-0.160726,
		0.701019,
		-0.694795,
		0,
		0.068721,
		0.710187,
		0.700651,
		0,
		0.030662,
		0.663599,
		-0.05883,
		1
	},
	[0.1] = {
		0.959654,
		0.103054,
		-0.261617,
		0,
		0.22232,
		0.291565,
		0.930357,
		0,
		0.172156,
		-0.950983,
		0.256891,
		0,
		0.215192,
		0.401158,
		0.21574,
		1
	},
	[0.216666666667] = {
		0.969974,
		0.062341,
		-0.235082,
		0,
		-0.237179,
		0.028599,
		-0.971045,
		0,
		-0.053813,
		0.997645,
		0.042526,
		0,
		-0.032137,
		0.596568,
		-0.296596,
		1
	},
	[0.233333333333] = {
		0.921185,
		-0.000152,
		-0.389125,
		0,
		-0.374976,
		-0.267555,
		-0.887585,
		0,
		-0.103978,
		0.963543,
		-0.246524,
		0,
		-0.055364,
		0.523545,
		-0.368044,
		1
	},
	[0.25] = {
		0.93871,
		0.1062,
		-0.327942,
		0,
		-0.279057,
		-0.324382,
		-0.903827,
		0,
		-0.202365,
		0.939946,
		-0.274864,
		0,
		-0.007276,
		0.524615,
		-0.511748,
		1
	},
	[0.266666666667] = {
		0.97274,
		0.230779,
		-0.022741,
		0,
		0.05604,
		-0.329099,
		-0.942631,
		0,
		-0.225023,
		0.915661,
		-0.333061,
		0,
		-0.069287,
		0.333722,
		-0.614552,
		1
	},
	[0.283333333333] = {
		0.983829,
		0.179109,
		0.000851,
		0,
		0.094055,
		-0.512581,
		-0.853472,
		0,
		-0.152428,
		0.83975,
		-0.521138,
		0,
		-0.078463,
		0.283142,
		-0.64621,
		1
	},
	[0.2] = {
		0.96238,
		0.063622,
		-0.264153,
		0,
		-0.271588,
		0.19656,
		-0.942127,
		0,
		-0.008018,
		0.978426,
		0.206444,
		0,
		-0.011422,
		0.642202,
		-0.176205,
		1
	},
	[0.316666666667] = {
		0.987102,
		0.152539,
		0.048605,
		0,
		0.143208,
		-0.705584,
		-0.694005,
		0,
		-0.071568,
		0.692014,
		-0.718328,
		0,
		-0.114517,
		0.180625,
		-0.697685,
		1
	},
	[0.333333333333] = {
		0.983611,
		0.16835,
		0.06455,
		0,
		0.169879,
		-0.745364,
		-0.64465,
		0,
		-0.060414,
		0.645051,
		-0.761748,
		0,
		-0.138162,
		0.132049,
		-0.719248,
		1
	},
	[0.35] = {
		0.977176,
		0.198785,
		0.07491,
		0,
		0.201999,
		-0.760354,
		-0.617299,
		0,
		-0.065751,
		0.618342,
		-0.783154,
		0,
		-0.163496,
		0.086726,
		-0.738263,
		1
	},
	[0.366666666667] = {
		0.967106,
		0.241061,
		0.081212,
		0,
		0.239533,
		-0.755572,
		-0.609701,
		0,
		-0.085614,
		0.609099,
		-0.78846,
		0,
		-0.18908,
		0.045604,
		-0.754438,
		1
	},
	[0.383333333333] = {
		0.952507,
		0.292252,
		0.085549,
		0,
		0.280768,
		-0.734091,
		-0.618287,
		0,
		-0.117895,
		0.612943,
		-0.781282,
		0,
		-0.213515,
		0.00961,
		-0.767279,
		1
	},
	[0.3] = {
		0.987605,
		0.15467,
		0.026726,
		0,
		0.119756,
		-0.63243,
		-0.765304,
		0,
		-0.101467,
		0.759018,
		-0.643114,
		0,
		-0.094082,
		0.231424,
		-0.673526,
		1
	},
	[0.416666666667] = {
		0.908635,
		0.406283,
		0.096523,
		0,
		0.362557,
		-0.65283,
		-0.665105,
		0,
		-0.207208,
		0.639333,
		-0.740485,
		0,
		-0.253249,
		-0.043384,
		-0.780568,
		1
	},
	[0.433333333333] = {
		0.881587,
		0.460054,
		0.105615,
		0,
		0.397138,
		-0.601988,
		-0.692742,
		0,
		-0.25512,
		0.652656,
		-0.71341,
		0,
		-0.267629,
		-0.061965,
		-0.782224,
		1
	},
	[0.45] = {
		0.854775,
		0.505655,
		0.116936,
		0,
		0.425121,
		-0.552913,
		-0.71663,
		0,
		-0.297712,
		0.662269,
		-0.687581,
		0,
		-0.279378,
		-0.079157,
		-0.783487,
		1
	},
	[0.466666666667] = {
		0.832026,
		0.539509,
		0.129086,
		0,
		0.446471,
		-0.513154,
		-0.733032,
		0,
		-0.329236,
		0.667535,
		-0.667833,
		0,
		-0.287416,
		-0.094938,
		-0.784611,
		1
	},
	[0.483333333333] = {
		0.817247,
		0.558955,
		0.140276,
		0,
		0.462034,
		-0.490032,
		-0.739185,
		0,
		-0.344431,
		0.668908,
		-0.658733,
		0,
		-0.289728,
		-0.109345,
		-0.784333,
		1
	},
	[0.4] = {
		0.932867,
		0.348774,
		0.090085,
		0,
		0.322856,
		-0.698628,
		-0.638501,
		0,
		-0.159757,
		0.624721,
		-0.764331,
		0,
		-0.235391,
		-0.02035,
		-0.776192,
		1
	},
	[0.516666666667] = {
		0.824038,
		0.544869,
		0.155175,
		0,
		0.476439,
		-0.518286,
		-0.710201,
		0,
		-0.306542,
		0.659164,
		-0.686684,
		0,
		-0.277897,
		-0.134148,
		-0.788302,
		1
	},
	[0.533333333333] = {
		0.840803,
		0.516856,
		0.160969,
		0,
		0.474832,
		-0.561343,
		-0.677812,
		0,
		-0.259972,
		0.646339,
		-0.717398,
		0,
		-0.265629,
		-0.145619,
		-0.792683,
		1
	},
	[0.55] = {
		0.856031,
		0.488832,
		0.168088,
		0,
		0.470642,
		-0.602548,
		-0.64454,
		0,
		-0.213792,
		0.630856,
		-0.745865,
		0,
		-0.25195,
		-0.157329,
		-0.79563,
		1
	},
	[0.566666666667] = {
		0.869673,
		0.46103,
		0.176408,
		0,
		0.464029,
		-0.641652,
		-0.610705,
		0,
		-0.168361,
		0.612972,
		-0.771959,
		0,
		-0.238146,
		-0.169356,
		-0.798814,
		1
	},
	[0.583333333333] = {
		0.881712,
		0.433667,
		0.185786,
		0,
		0.455197,
		-0.678457,
		-0.576621,
		0,
		-0.124014,
		0.592983,
		-0.795608,
		0,
		-0.224537,
		-0.18165,
		-0.802194,
		1
	},
	[0.5] = {
		0.8138,
		0.561699,
		0.149073,
		0,
		0.472401,
		-0.489984,
		-0.732635,
		0,
		-0.338477,
		0.66664,
		-0.664096,
		0,
		-0.286546,
		-0.12233,
		-0.784979,
		1
	},
	[0.616666666667] = {
		0.901067,
		0.381049,
		0.207077,
		0,
		0.431857,
		-0.744636,
		-0.508937,
		0,
		-0.039733,
		0.548014,
		-0.835525,
		0,
		-0.198991,
		-0.206445,
		-0.809338,
		1
	},
	[0.633333333333] = {
		0.908495,
		0.356131,
		0.218649,
		0,
		0.417895,
		-0.773872,
		-0.475906,
		0,
		-0.000278,
		0.52373,
		-0.851884,
		0,
		-0.187433,
		-0.218567,
		-0.812973,
		1
	},
	[0.65] = {
		0.914541,
		0.332325,
		0.230599,
		0,
		0.402787,
		-0.800525,
		-0.443759,
		0,
		0.037128,
		0.498718,
		-0.865969,
		0,
		-0.176955,
		-0.230312,
		-0.816597,
		1
	},
	[0.666666666667] = {
		0.919313,
		0.309737,
		0.242748,
		0,
		0.38682,
		-0.82464,
		-0.412722,
		0,
		0.072344,
		0.473321,
		-0.877914,
		0,
		-0.166969,
		-0.241258,
		-0.818102,
		1
	},
	[0.683333333333] = {
		0.922933,
		0.288449,
		0.254936,
		0,
		0.370286,
		-0.846293,
		-0.382984,
		0,
		0.10528,
		0.447867,
		-0.88788,
		0,
		-0.158072,
		-0.251379,
		-0.818817,
		1
	},
	[0.6] = {
		0.892162,
		0.406946,
		0.196065,
		0,
		0.444385,
		-0.712816,
		-0.5426,
		0,
		-0.081051,
		0.571216,
		-0.816788,
		0,
		-0.211411,
		-0.194074,
		-0.805723,
		1
	},
	[0.716666666667] = {
		0.927229,
		0.24999,
		0.278839,
		0,
		0.336616,
		-0.882664,
		-0.328014,
		0,
		0.164122,
		0.398006,
		-0.902583,
		0,
		-0.14394,
		-0.268867,
		-0.819056,
		1
	},
	[0.733333333333] = {
		0.928171,
		0.232879,
		0.290287,
		0,
		0.319992,
		-0.897654,
		-0.30302,
		0,
		0.19001,
		0.374144,
		-0.907696,
		0,
		-0.138667,
		-0.276131,
		-0.818747,
		1
	},
	[0.75] = {
		0.928483,
		0.217194,
		0.30124,
		0,
		0.303819,
		-0.910715,
		-0.279807,
		0,
		0.213572,
		0.351318,
		-0.911572,
		0,
		-0.134531,
		-0.282373,
		-0.818246,
		1
	},
	[0.7] = {
		0.925527,
		0.26852,
		0.267014,
		0,
		0.353463,
		-0.865592,
		-0.354703,
		0,
		0.13588,
		0.422667,
		-0.896041,
		0,
		-0.150398,
		-0.260604,
		-0.819106,
		1
	}
}

return spline_matrices

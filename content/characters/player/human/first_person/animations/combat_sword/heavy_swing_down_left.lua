local spline_matrices = {
	[0] = {
		0.994587,
		0.102889,
		0.014489,
		0,
		-0.090819,
		0.793086,
		0.602302,
		0,
		0.050479,
		-0.600358,
		0.798137,
		0,
		0.184771,
		0.071389,
		0.155768,
		1
	},
	[0.0333333333333] = {
		0.984427,
		0.159746,
		-0.073381,
		0,
		-0.073722,
		0.754091,
		0.65262,
		0,
		0.159589,
		-0.637047,
		0.754124,
		0,
		0.21021,
		0.083665,
		0.159232,
		1
	},
	[0.0666666666667] = {
		0.959347,
		0.220538,
		-0.176112,
		0,
		-0.042759,
		0.73038,
		0.681701,
		0,
		0.27897,
		-0.646458,
		0.710118,
		0,
		0.243677,
		0.124939,
		0.161372,
		1
	},
	[0.133333333333] = {
		0.889559,
		0.28969,
		-0.353221,
		0,
		0.041907,
		0.718205,
		0.694568,
		0,
		0.454895,
		-0.632661,
		0.626746,
		0,
		0.275354,
		0.264632,
		0.204521,
		1
	},
	[0.166666666667] = {
		0.905741,
		0.231435,
		-0.355065,
		0,
		-0.065835,
		0.904406,
		0.421564,
		0,
		0.418688,
		-0.358452,
		0.834394,
		0,
		0.203702,
		0.39566,
		0.209935,
		1
	},
	[0.1] = {
		0.923313,
		0.270247,
		-0.272873,
		0,
		-0.005545,
		0.719825,
		0.694133,
		0,
		0.384008,
		-0.639389,
		0.666123,
		0,
		0.277626,
		0.176278,
		0.163294,
		1
	},
	[0.233333333333] = {
		0.921264,
		0.053564,
		-0.385231,
		0,
		-0.364805,
		0.46246,
		-0.808114,
		0,
		0.134868,
		0.885021,
		0.445588,
		0,
		0.021696,
		0.720902,
		-0.062559,
		1
	},
	[0.266666666667] = {
		0.963976,
		0.058356,
		-0.259507,
		0,
		-0.261036,
		0.020174,
		-0.965118,
		0,
		-0.051086,
		0.998092,
		0.03468,
		0,
		-0.074492,
		0.763675,
		-0.321289,
		1
	},
	[0.2] = {
		0.931683,
		0.164064,
		-0.324115,
		0,
		-0.204368,
		0.974345,
		-0.094263,
		0,
		0.300334,
		0.154062,
		0.94131,
		0,
		0.107944,
		0.571871,
		0.147341,
		1
	},
	[0.333333333333] = {
		0.752612,
		-0.530361,
		-0.390247,
		0,
		-0.363698,
		-0.828879,
		0.425069,
		0,
		-0.548907,
		-0.17798,
		-0.816716,
		0,
		-0.194643,
		0.001445,
		-0.664911,
		1
	},
	[0.366666666667] = {
		0.745199,
		-0.606192,
		-0.277868,
		0,
		-0.365887,
		-0.720058,
		0.589613,
		0,
		-0.557499,
		-0.33771,
		-0.758384,
		0,
		-0.14545,
		-0.126371,
		-0.611469,
		1
	},
	[0.3] = {
		0.824926,
		-0.301901,
		-0.477862,
		0,
		-0.548808,
		-0.63016,
		-0.54928,
		0,
		-0.135302,
		0.71537,
		-0.685521,
		0,
		-0.162885,
		0.367927,
		-0.668561,
		1
	},
	[0.433333333333] = {
		0.686534,
		-0.68627,
		-0.240217,
		0,
		-0.437905,
		-0.653997,
		0.616868,
		0,
		-0.580439,
		-0.318309,
		-0.749513,
		0,
		-0.147948,
		-0.121445,
		-0.605949,
		1
	},
	[0.466666666667] = {
		0.648332,
		-0.710654,
		-0.273196,
		0,
		-0.50807,
		-0.671077,
		0.539927,
		0,
		-0.567037,
		-0.211249,
		-0.796143,
		0,
		-0.137606,
		-0.120708,
		-0.627814,
		1
	},
	[0.4] = {
		0.720648,
		-0.650796,
		-0.23902,
		0,
		-0.380007,
		-0.659136,
		0.648949,
		0,
		-0.57988,
		-0.376834,
		-0.722312,
		0,
		-0.151849,
		-0.124679,
		-0.592361,
		1
	},
	[0.533333333333] = {
		0.568422,
		-0.6993,
		-0.433447,
		0,
		-0.667679,
		-0.699917,
		0.253614,
		0,
		-0.480729,
		0.145244,
		-0.864757,
		0,
		-0.111694,
		-0.122756,
		-0.664652,
		1
	},
	[0.566666666667] = {
		0.542936,
		-0.647124,
		-0.535212,
		0,
		-0.741974,
		-0.668154,
		0.055182,
		0,
		-0.393313,
		0.367153,
		-0.842914,
		0,
		-0.102198,
		-0.122072,
		-0.672911,
		1
	},
	[0.5] = {
		0.607299,
		-0.718278,
		-0.339507,
		0,
		-0.583852,
		-0.693309,
		0.422422,
		0,
		-0.538799,
		-0.058315,
		-0.840413,
		0,
		-0.124416,
		-0.121735,
		-0.648807,
		1
	},
	[0.633333333333] = {
		0.543911,
		-0.495237,
		-0.677423,
		0,
		-0.813797,
		-0.508216,
		-0.28187,
		0,
		-0.204685,
		0.704597,
		-0.679446,
		0,
		-0.11048,
		-0.08532,
		-0.680086,
		1
	},
	[0.666666666667] = {
		0.554014,
		-0.441248,
		-0.705952,
		0,
		-0.819661,
		-0.437503,
		-0.369793,
		0,
		-0.145686,
		0.783512,
		-0.604057,
		0,
		-0.104359,
		-0.07972,
		-0.673892,
		1
	},
	[0.6] = {
		0.53639,
		-0.571454,
		-0.621068,
		0,
		-0.791387,
		-0.596254,
		-0.134864,
		0,
		-0.293246,
		0.563845,
		-0.772066,
		0,
		-0.107387,
		-0.107837,
		-0.680866,
		1
	},
	[0.733333333333] = {
		0.572784,
		-0.40286,
		-0.713878,
		0,
		-0.815683,
		-0.366303,
		-0.447754,
		0,
		-0.081113,
		0.838765,
		-0.538419,
		0,
		-0.096225,
		-0.080747,
		-0.667982,
		1
	},
	[0.766666666667] = {
		0.578492,
		-0.404226,
		-0.708484,
		0,
		-0.812009,
		-0.367793,
		-0.453177,
		0,
		-0.07739,
		0.837454,
		-0.541,
		0,
		-0.094402,
		-0.08503,
		-0.666148,
		1
	},
	[0.7] = {
		0.564668,
		-0.413603,
		-0.714201,
		0,
		-0.81905,
		-0.387281,
		-0.423286,
		0,
		-0.101524,
		0.823982,
		-0.557446,
		0,
		-0.099437,
		-0.078556,
		-0.670587,
		1
	},
	[0.833333333333] = {
		0.586114,
		-0.425625,
		-0.68943,
		0,
		-0.804456,
		-0.407096,
		-0.432578,
		0,
		-0.096548,
		0.808156,
		-0.581001,
		0,
		-0.093448,
		-0.096876,
		-0.664303,
		1
	},
	[0.866666666667] = {
		0.589744,
		-0.437262,
		-0.678973,
		0,
		-0.800284,
		-0.429257,
		-0.418669,
		0,
		-0.108386,
		0.790279,
		-0.603085,
		0,
		-0.093581,
		-0.102104,
		-0.664018,
		1
	},
	[0.8] = {
		0.58262,
		-0.413231,
		-0.699853,
		0,
		-0.808353,
		-0.384022,
		-0.446198,
		0,
		-0.084376,
		0.825692,
		-0.557775,
		0,
		-0.093601,
		-0.09079,
		-0.664975,
		1
	},
	[0.933333333333] = {
		0.596477,
		-0.444523,
		-0.668292,
		0,
		-0.794609,
		-0.444463,
		-0.413581,
		0,
		-0.113185,
		0.777723,
		-0.618334,
		0,
		-0.093563,
		-0.105648,
		-0.66422,
		1
	},
	[0.9] = {
		0.594005,
		-0.444113,
		-0.670762,
		0,
		-0.796307,
		-0.443023,
		-0.411857,
		0,
		-0.114252,
		0.778777,
		-0.616808,
		0,
		-0.093653,
		-0.105248,
		-0.664072,
		1
	}
}

return spline_matrices

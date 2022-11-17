local spline_matrices = {
	[0] = {
		-0.12307,
		-0.152053,
		0.98068,
		0,
		-0.466571,
		0.881033,
		0.078051,
		0,
		-0.87588,
		-0.447951,
		-0.179372,
		0,
		-0.408925,
		0.276112,
		-0.167521,
		1
	},
	{
		0.71978,
		-0.274535,
		-0.63761,
		0,
		-0.68949,
		-0.175886,
		-0.702615,
		0,
		0.080746,
		0.945354,
		-0.315889,
		0,
		-0.092193,
		0.028696,
		-0.668244,
		1
	},
	[0.0166666666667] = {
		-0.162166,
		-0.167793,
		0.972393,
		0,
		-0.457336,
		0.885988,
		0.076614,
		0,
		-0.874383,
		-0.432286,
		-0.220415,
		0,
		-0.415634,
		0.269567,
		-0.172152,
		1
	},
	[0.0333333333333] = {
		-0.20347,
		-0.178329,
		0.962704,
		0,
		-0.455697,
		0.887527,
		0.068091,
		0,
		-0.866568,
		-0.424847,
		-0.261849,
		0,
		-0.434828,
		0.249694,
		-0.182201,
		1
	},
	[0.05] = {
		-0.245682,
		-0.185955,
		0.951347,
		0,
		-0.457875,
		0.887302,
		0.055192,
		0,
		-0.854395,
		-0.422038,
		-0.303138,
		0,
		-0.458161,
		0.225317,
		-0.195693,
		1
	},
	[0.0666666666667] = {
		-0.287695,
		-0.192806,
		0.938114,
		0,
		-0.460311,
		0.886806,
		0.041095,
		0,
		-0.839848,
		-0.420001,
		-0.343881,
		0,
		-0.477261,
		0.205234,
		-0.210564,
		1
	},
	[0.0833333333333] = {
		-0.328533,
		-0.200072,
		0.923058,
		0,
		-0.459994,
		0.88746,
		0.028636,
		0,
		-0.824907,
		-0.415194,
		-0.383592,
		0,
		-0.483787,
		0.19793,
		-0.224884,
		1
	},
	[0.116666666667] = {
		-0.403763,
		-0.219158,
		0.888226,
		0,
		-0.44041,
		0.897545,
		0.02126,
		0,
		-0.801882,
		-0.3826,
		-0.458915,
		0,
		-0.418045,
		0.242602,
		-0.244229,
		1
	},
	[0.133333333333] = {
		-0.437296,
		-0.232025,
		0.868871,
		0,
		-0.415995,
		0.908757,
		0.033309,
		0,
		-0.797321,
		-0.34688,
		-0.493916,
		0,
		-0.3583,
		0.28579,
		-0.246207,
		1
	},
	[0.15] = {
		-0.468001,
		-0.247484,
		0.848367,
		0,
		-0.37802,
		0.923789,
		0.060951,
		0,
		-0.798796,
		-0.292175,
		-0.525888,
		0,
		-0.297187,
		0.334351,
		-0.243466,
		1
	},
	[0.166666666667] = {
		-0.49619,
		-0.265592,
		0.826593,
		0,
		-0.322966,
		0.940202,
		0.108224,
		0,
		-0.805908,
		-0.213262,
		-0.552296,
		0,
		-0.247098,
		0.381895,
		-0.234695,
		1
	},
	[0.183333333333] = {
		-0.518542,
		-0.302848,
		0.799623,
		0,
		-0.24205,
		0.948913,
		0.202425,
		0,
		-0.820077,
		-0.088583,
		-0.565356,
		0,
		-0.214468,
		0.435121,
		-0.216531,
		1
	},
	[0.1] = {
		-0.367409,
		-0.208646,
		0.906354,
		0,
		-0.454209,
		0.89065,
		0.020908,
		0,
		-0.811606,
		-0.403992,
		-0.422002,
		0,
		-0.464012,
		0.211143,
		-0.236656,
		1
	},
	[0.216666666667] = {
		-0.572901,
		-0.341085,
		0.745282,
		0,
		0.035443,
		0.898137,
		0.438285,
		0,
		-0.818858,
		0.277509,
		-0.502455,
		0,
		-0.157534,
		0.550818,
		-0.162106,
		1
	},
	[0.233333333333] = {
		-0.602506,
		-0.251771,
		0.757362,
		0,
		0.256499,
		0.837515,
		0.482469,
		0,
		-0.755774,
		0.484953,
		-0.440029,
		0,
		-0.125882,
		0.592349,
		-0.133586,
		1
	},
	[0.25] = {
		-0.606972,
		-0.122811,
		0.785177,
		0,
		0.498375,
		0.710757,
		0.496434,
		0,
		-0.619038,
		0.692634,
		-0.370204,
		0,
		-0.07044,
		0.617818,
		-0.093892,
		1
	},
	[0.266666666667] = {
		-0.545379,
		-0.054193,
		0.836436,
		0,
		0.741061,
		0.435105,
		0.511383,
		0,
		-0.39165,
		0.898747,
		-0.197137,
		0,
		0.020829,
		0.629079,
		-0.037838,
		1
	},
	[0.283333333333] = {
		-0.474567,
		-0.031231,
		0.879665,
		0,
		0.874527,
		0.096742,
		0.47523,
		0,
		-0.099943,
		0.994819,
		-0.018598,
		0,
		0.12961,
		0.625632,
		0.0212,
		1
	},
	[0.2] = {
		-0.54158,
		-0.343379,
		0.767321,
		0,
		-0.124612,
		0.93548,
		0.330679,
		0,
		-0.831362,
		0.083471,
		-0.549427,
		0,
		-0.188863,
		0.495837,
		-0.19096,
		1
	},
	[0.316666666667] = {
		-0.524589,
		-0.030804,
		0.850798,
		0,
		0.798284,
		-0.365117,
		0.478991,
		0,
		0.295886,
		0.930452,
		0.216127,
		0,
		0.366401,
		0.512936,
		0.144749,
		1
	},
	[0.333333333333] = {
		-0.375266,
		-0.159002,
		0.913178,
		0,
		0.816009,
		-0.52397,
		0.244101,
		0,
		0.439665,
		0.836764,
		0.326375,
		0,
		0.485083,
		0.430423,
		0.168564,
		1
	},
	[0.35] = {
		-0.24898,
		-0.319394,
		0.914329,
		0,
		0.796229,
		-0.60497,
		0.005492,
		0,
		0.551387,
		0.729382,
		0.404936,
		0,
		0.590891,
		0.356485,
		0.169412,
		1
	},
	[0.366666666667] = {
		-0.375266,
		-0.391023,
		0.840403,
		0,
		0.740693,
		-0.671595,
		0.018262,
		0,
		0.557269,
		0.629334,
		0.541654,
		0,
		0.661105,
		0.269393,
		0.156148,
		1
	},
	[0.383333333333] = {
		-0.484449,
		-0.418321,
		0.768321,
		0,
		0.687846,
		-0.724803,
		0.03908,
		0,
		0.540533,
		0.547419,
		0.638871,
		0,
		0.708771,
		0.170299,
		0.12066,
		1
	},
	[0.3] = {
		-0.50872,
		-0.023689,
		0.860606,
		0,
		0.851431,
		-0.16194,
		0.498839,
		0,
		0.12755,
		0.986516,
		0.102551,
		0,
		0.250891,
		0.58728,
		0.087858,
		1
	},
	[0.416666666667] = {
		-0.209629,
		-0.506761,
		0.836211,
		0,
		0.597845,
		-0.743158,
		-0.300496,
		0,
		0.773717,
		0.436932,
		0.458752,
		0,
		0.764109,
		-0.024769,
		-0.012756,
		1
	},
	[0.433333333333] = {
		0.008943,
		-0.55618,
		0.831014,
		0,
		0.495226,
		-0.719511,
		-0.486883,
		0,
		0.868718,
		0.415894,
		0.269,
		0,
		0.752269,
		-0.049889,
		-0.072796,
		1
	},
	[0.45] = {
		0.17289,
		-0.594255,
		0.785475,
		0,
		0.392958,
		-0.689648,
		-0.608251,
		0,
		0.903157,
		0.413819,
		0.114284,
		0,
		0.726813,
		-0.061922,
		-0.128694,
		1
	},
	[0.466666666667] = {
		0.28228,
		-0.622755,
		0.729722,
		0,
		0.312549,
		-0.659454,
		-0.683691,
		0,
		0.90699,
		0.421066,
		0.008491,
		0,
		0.691976,
		-0.065815,
		-0.180824,
		1
	},
	[0.483333333333] = {
		0.381377,
		-0.64538,
		0.661843,
		0,
		0.231982,
		-0.626228,
		-0.744327,
		0,
		0.894838,
		0.437405,
		-0.089113,
		0,
		0.648742,
		-0.065699,
		-0.232612,
		1
	},
	[0.4] = {
		-0.398164,
		-0.457454,
		0.795111,
		0,
		0.657582,
		-0.746677,
		-0.100294,
		0,
		0.639571,
		0.482917,
		0.598114,
		0,
		0.748132,
		0.05735,
		0.057353,
		1
	},
	[0.516666666667] = {
		0.549305,
		-0.670545,
		0.498631,
		0,
		0.074496,
		-0.555045,
		-0.828478,
		0,
		0.832294,
		0.492233,
		-0.254936,
		0,
		0.542407,
		-0.063546,
		-0.332554,
		1
	},
	[0.533333333333] = {
		0.618342,
		-0.672263,
		0.407081,
		0,
		-0.001193,
		-0.518777,
		-0.854909,
		0,
		0.785908,
		0.52814,
		-0.321584,
		0,
		0.482606,
		-0.061962,
		-0.379629,
		1
	},
	[0.55] = {
		0.677537,
		-0.666446,
		0.311116,
		0,
		-0.074468,
		-0.482993,
		-0.872452,
		0,
		0.731709,
		0.56795,
		-0.376875,
		0,
		0.420495,
		-0.060022,
		-0.424167,
		1
	},
	[0.566666666667] = {
		0.726822,
		-0.653177,
		0.212343,
		0,
		-0.145191,
		-0.448298,
		-0.882014,
		0,
		0.671304,
		0.610237,
		-0.420668,
		0,
		0.357621,
		-0.05775,
		-0.46572,
		1
	},
	[0.583333333333] = {
		0.766139,
		-0.632767,
		0.112413,
		0,
		-0.21318,
		-0.415228,
		-0.884387,
		0,
		0.606287,
		0.653599,
		-0.453016,
		0,
		0.295522,
		-0.055138,
		-0.503824,
		1
	},
	[0.5] = {
		0.470348,
		-0.661472,
		0.584147,
		0,
		0.152379,
		-0.591119,
		-0.79206,
		0,
		0.869226,
		0.461556,
		-0.177238,
		0,
		0.598329,
		-0.064788,
		-0.283378,
		1
	},
	[0.616666666667] = {
		0.815378,
		-0.572795,
		-0.084046,
		0,
		-0.33976,
		-0.355913,
		-0.870568,
		0,
		0.468744,
		0.738398,
		-0.484817,
		0,
		0.179783,
		-0.048712,
		-0.567807,
		1
	},
	[0.633333333333] = {
		0.825998,
		-0.53512,
		-0.177126,
		0,
		-0.397649,
		-0.330479,
		-0.855955,
		0,
		0.399502,
		0.777451,
		-0.485765,
		0,
		0.129182,
		-0.044854,
		-0.592733,
		1
	},
	[0.65] = {
		0.828171,
		-0.494074,
		-0.26462,
		0,
		-0.451448,
		-0.308236,
		-0.837368,
		0,
		0.332156,
		0.812946,
		-0.47832,
		0,
		0.08543,
		-0.040567,
		-0.61231,
		1
	},
	[0.666666666667] = {
		0.822918,
		-0.45129,
		-0.345172,
		0,
		-0.500826,
		-0.289302,
		-0.815768,
		0,
		0.268289,
		0.844181,
		-0.464089,
		0,
		0.050005,
		-0.03587,
		-0.626055,
		1
	},
	[0.683333333333] = {
		0.811526,
		-0.408568,
		-0.417729,
		0,
		-0.545529,
		-0.273647,
		-0.792158,
		0,
		0.20934,
		0.870741,
		-0.444958,
		0,
		0.024358,
		-0.030795,
		-0.633481,
		1
	},
	[0.6] = {
		0.795579,
		-0.60571,
		0.013036,
		0,
		-0.278148,
		-0.384284,
		-0.880318,
		0,
		0.538227,
		0.696736,
		-0.474206,
		0,
		0.235734,
		-0.052136,
		-0.538012,
		1
	},
	[0.716666666667] = {
		0.776401,
		-0.330772,
		-0.536461,
		0,
		-0.620408,
		-0.251372,
		-0.742903,
		0,
		0.11088,
		0.909616,
		-0.40038,
		0,
		-0.011684,
		-0.020552,
		-0.640313,
		1
	},
	[0.733333333333] = {
		0.755877,
		-0.299289,
		-0.582302,
		0,
		-0.65062,
		-0.24408,
		-0.719109,
		0,
		0.073093,
		0.922416,
		-0.379218,
		0,
		-0.02649,
		-0.015617,
		-0.642994,
		1
	},
	[0.75] = {
		0.735415,
		-0.2749,
		-0.61935,
		0,
		-0.676208,
		-0.238807,
		-0.696932,
		0,
		0.043682,
		0.931344,
		-0.361512,
		0,
		-0.039328,
		-0.010797,
		-0.645423,
		1
	},
	[0.766666666667] = {
		0.717458,
		-0.257166,
		-0.647395,
		0,
		-0.696233,
		-0.23448,
		-0.678438,
		0,
		0.02267,
		0.937489,
		-0.347277,
		0,
		-0.050313,
		-0.00606,
		-0.647769,
		1
	},
	[0.783333333333] = {
		0.7036,
		-0.244318,
		-0.667275,
		0,
		-0.710541,
		-0.230116,
		-0.664965,
		0,
		0.008912,
		0.941995,
		-0.335507,
		0,
		-0.059645,
		-0.001409,
		-0.65008,
		1
	},
	[0.7] = {
		0.795486,
		-0.367779,
		-0.481602,
		0,
		-0.585403,
		-0.261102,
		-0.767548,
		0,
		0.156541,
		0.892505,
		-0.423002,
		0,
		0.005226,
		-0.025609,
		-0.637207,
		1
	},
	[0.816666666667] = {
		0.687645,
		-0.2311,
		-0.688286,
		0,
		-0.726046,
		-0.220769,
		-0.651244,
		0,
		-0.001449,
		0.947551,
		-0.3196,
		0,
		-0.074007,
		0.007382,
		-0.654531,
		1
	},
	[0.833333333333] = {
		0.684838,
		-0.229712,
		-0.691541,
		0,
		-0.728695,
		-0.215818,
		-0.649943,
		0,
		5.3e-05,
		0.949028,
		-0.31519,
		0,
		-0.079293,
		0.011363,
		-0.656634,
		1
	},
	[0.85] = {
		0.684814,
		-0.231192,
		-0.691071,
		0,
		-0.728701,
		-0.210853,
		-0.651564,
		0,
		0.004922,
		0.949785,
		-0.312864,
		0,
		-0.083489,
		0.014923,
		-0.658633,
		1
	},
	[0.866666666667] = {
		0.687019,
		-0.235016,
		-0.687584,
		0,
		-0.726533,
		-0.20599,
		-0.655528,
		0,
		0.012424,
		0.949913,
		-0.312266,
		0,
		-0.086716,
		0.01801,
		-0.660508,
		1
	},
	[0.883333333333] = {
		0.690883,
		-0.240583,
		-0.681763,
		0,
		-0.722636,
		-0.201296,
		-0.661269,
		0,
		0.021854,
		0.949526,
		-0.312926,
		0,
		-0.08909,
		0.020643,
		-0.662239,
		1
	},
	[0.8] = {
		0.693751,
		-0.235803,
		-0.680519,
		0,
		-0.720214,
		-0.225555,
		-0.656062,
		0,
		0.001207,
		0.945263,
		-0.326308,
		0,
		-0.067505,
		0.003097,
		-0.65234,
		1
	},
	[0.916666666667] = {
		0.701344,
		-0.254461,
		-0.665857,
		0,
		-0.711483,
		-0.192648,
		-0.67578,
		0,
		0.043683,
		0.947701,
		-0.316157,
		0,
		-0.091753,
		0.024641,
		-0.665177,
		1
	},
	[0.933333333333] = {
		0.706871,
		-0.261486,
		-0.657235,
		0,
		-0.705229,
		-0.188766,
		-0.683388,
		0,
		0.054633,
		0.946569,
		-0.31784,
		0,
		-0.092287,
		0.02606,
		-0.666333,
		1
	},
	[0.95] = {
		0.711931,
		-0.267685,
		-0.649229,
		0,
		-0.699271,
		-0.185181,
		-0.690455,
		0,
		0.0646,
		0.945543,
		-0.319021,
		0,
		-0.092463,
		0.027136,
		-0.667245,
		1
	},
	[0.966666666667] = {
		0.716064,
		-0.272383,
		-0.642697,
		0,
		-0.694228,
		-0.181867,
		-0.6964,
		0,
		0.072802,
		0.944845,
		-0.319324,
		0,
		-0.092414,
		0.027908,
		-0.667885,
		1
	},
	[0.983333333333] = {
		0.718828,
		-0.274896,
		-0.638529,
		0,
		-0.690748,
		-0.178781,
		-0.700646,
		0,
		0.078448,
		0.944706,
		-0.318396,
		0,
		-0.092279,
		0.028415,
		-0.668227,
		1
	},
	[0.9] = {
		0.695841,
		-0.247276,
		-0.674285,
		0,
		-0.71746,
		-0.196833,
		-0.668213,
		0,
		0.032512,
		0.948742,
		-0.314375,
		0,
		-0.090729,
		0.022845,
		-0.663804,
		1
	},
	[1.01666666667] = {
		0.71978,
		-0.274535,
		-0.63761,
		0,
		-0.68949,
		-0.175886,
		-0.702615,
		0,
		0.080746,
		0.945354,
		-0.315889,
		0,
		-0.092193,
		0.028696,
		-0.668244,
		1
	}
}

return spline_matrices

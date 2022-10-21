local spline_matrices = {
	[0] = {
		-0.716762,
		0.568909,
		-0.403231,
		0,
		0.402067,
		-0.135283,
		-0.905561,
		0,
		-0.569732,
		-0.811198,
		-0.131774,
		0,
		1.659556,
		-0.618239,
		-0.415401,
		1
	},
	{
		-0.836299,
		-0.095448,
		-0.539902,
		0,
		0.536758,
		-0.343298,
		-0.770738,
		0,
		-0.111782,
		-0.934364,
		0.338332,
		0,
		0.526271,
		-1.232664,
		-1.300977,
		1
	},
	[0.0333333333333] = {
		-0.66492,
		0.555714,
		-0.499062,
		0,
		0.555331,
		-0.079008,
		-0.827868,
		0,
		-0.499488,
		-0.827611,
		-0.256071,
		0,
		1.641321,
		-0.634685,
		-0.402855,
		1
	},
	[0.0666666666667] = {
		-0.576995,
		0.555678,
		-0.598581,
		0,
		0.712599,
		-0.015617,
		-0.701398,
		0,
		-0.399099,
		-0.831251,
		-0.386965,
		0,
		1.58176,
		-0.674284,
		-0.365227,
		1
	},
	[0.133333333333] = {
		-0.369012,
		0.564365,
		-0.738459,
		0,
		0.918504,
		0.099997,
		-0.382559,
		0,
		-0.142059,
		-0.819447,
		-0.555271,
		0,
		1.408052,
		-0.740284,
		-0.246062,
		1
	},
	[0.166666666667] = {
		-0.307325,
		0.55195,
		-0.775179,
		0,
		0.951144,
		0.152819,
		-0.268276,
		0,
		-0.029613,
		-0.819755,
		-0.571949,
		0,
		1.32888,
		-0.724613,
		-0.181645,
		1
	},
	[0.1] = {
		-0.469327,
		0.561881,
		-0.681191,
		0,
		0.83964,
		0.045137,
		-0.541265,
		0,
		-0.27338,
		-0.825985,
		-0.492962,
		0,
		1.498247,
		-0.716464,
		-0.310226,
		1
	},
	[0.233333333333] = {
		-0.452396,
		0.490004,
		-0.74514,
		0,
		0.891612,
		0.266429,
		-0.36612,
		0,
		0.019127,
		-0.830007,
		-0.557425,
		0,
		1.347266,
		-0.421378,
		-0.136081,
		1
	},
	[0.266666666667] = {
		-0.443431,
		0.517498,
		-0.731823,
		0,
		0.894804,
		0.208302,
		-0.394888,
		0,
		-0.051914,
		-0.829943,
		-0.555427,
		0,
		1.390248,
		-0.174321,
		-0.149688,
		1
	},
	[0.2] = {
		-0.324485,
		0.521905,
		-0.788875,
		0,
		0.945261,
		0.20935,
		-0.250309,
		0,
		0.034513,
		-0.826915,
		-0.561267,
		0,
		1.292259,
		-0.635575,
		-0.133874,
		1
	},
	[0.333333333333] = {
		-0.355664,
		-0.147934,
		-0.922832,
		0,
		0.856269,
		0.344152,
		-0.385179,
		0,
		0.374575,
		-0.927187,
		0.004269,
		0,
		1.349848,
		0.285892,
		-0.139998,
		1
	},
	[0.366666666667] = {
		-0.302711,
		-0.422221,
		-0.854456,
		0,
		0.641851,
		0.572427,
		-0.51025,
		0,
		0.704552,
		-0.702892,
		0.097723,
		0,
		1.324387,
		0.554666,
		-0.17471,
		1
	},
	[0.3] = {
		-0.409357,
		0.322057,
		-0.853643,
		0,
		0.911322,
		0.189259,
		-0.365614,
		0,
		0.043811,
		-0.92761,
		-0.370972,
		0,
		1.382103,
		0.045434,
		-0.131518,
		1
	},
	[0.433333333333] = {
		0.508213,
		-0.694271,
		-0.509615,
		0,
		-0.228434,
		0.461868,
		-0.857027,
		0,
		0.830384,
		0.551966,
		0.076132,
		0,
		0.817263,
		1.500682,
		-0.202501,
		1
	},
	[0.466666666667] = {
		0.845986,
		-0.071324,
		-0.528413,
		0,
		-0.503567,
		0.218924,
		-0.835759,
		0,
		0.175291,
		0.973132,
		0.14929,
		0,
		-0.049312,
		1.468109,
		-0.176455,
		1
	},
	[0.4] = {
		-0.121851,
		-0.72141,
		-0.681704,
		0,
		0.224997,
		0.648866,
		-0.726876,
		0,
		0.96671,
		-0.241952,
		0.08325,
		0,
		1.30145,
		1.017651,
		-0.177267,
		1
	},
	[0.533333333333] = {
		0.568207,
		0.55861,
		-0.604231,
		0,
		-0.488538,
		-0.361874,
		-0.793963,
		0,
		-0.662172,
		0.746325,
		0.067283,
		0,
		-1.183295,
		0.28127,
		-0.312245,
		1
	},
	[0.566666666667] = {
		-0.893884,
		0.104265,
		-0.436004,
		0,
		0.378939,
		-0.343932,
		-0.859137,
		0,
		-0.239534,
		-0.933188,
		0.267925,
		0,
		-0.625063,
		-0.92604,
		-0.211095,
		1
	},
	[0.5] = {
		0.782999,
		0.517755,
		-0.344737,
		0,
		-0.338095,
		-0.110951,
		-0.934549,
		0,
		-0.522116,
		0.848304,
		0.088176,
		0,
		-0.922945,
		1.21178,
		-0.210723,
		1
	},
	[0.633333333333] = {
		-0.860198,
		-0.157122,
		-0.485151,
		0,
		0.509822,
		-0.287037,
		-0.810981,
		0,
		-0.011833,
		-0.944946,
		0.327014,
		0,
		-0.506545,
		-1.101764,
		-0.373591,
		1
	},
	[0.666666666667] = {
		-0.831664,
		-0.214386,
		-0.512224,
		0,
		0.554467,
		-0.270764,
		-0.786926,
		0,
		0.030015,
		-0.93847,
		0.344055,
		0,
		-0.421081,
		-1.146573,
		-0.48749,
		1
	},
	[0.6] = {
		-0.885524,
		-0.07413,
		-0.458642,
		0,
		0.457856,
		-0.306756,
		-0.834427,
		0,
		-0.078835,
		-0.948897,
		0.305581,
		0,
		-0.534216,
		-1.035358,
		-0.292961,
		1
	},
	[0.733333333333] = {
		-0.800867,
		-0.258989,
		-0.539942,
		0,
		0.596457,
		-0.264578,
		-0.757785,
		0,
		0.053401,
		-0.928937,
		0.366367,
		0,
		-0.186371,
		-1.207489,
		-0.723005,
		1
	},
	[0.766666666667] = {
		-0.803894,
		-0.248736,
		-0.540264,
		0,
		0.593217,
		-0.269656,
		-0.758537,
		0,
		0.04299,
		-0.930277,
		0.364329,
		0,
		-0.06518,
		-1.232535,
		-0.841256,
		1
	},
	[0.7] = {
		-0.808279,
		-0.249335,
		-0.533401,
		0,
		0.58663,
		-0.263322,
		-0.765851,
		0,
		0.050498,
		-0.93193,
		0.359105,
		0,
		-0.302125,
		-1.173502,
		-0.60857,
		1
	},
	[0.833333333333] = {
		-0.81633,
		-0.202869,
		-0.540787,
		0,
		0.577574,
		-0.292782,
		-0.762028,
		0,
		-0.003741,
		-0.93441,
		0.356179,
		0,
		0.186327,
		-1.278093,
		-1.07977,
		1
	},
	[0.866666666667] = {
		-0.823025,
		-0.173679,
		-0.540801,
		0,
		0.567028,
		-0.30706,
		-0.764326,
		0,
		-0.033311,
		-0.935708,
		0.351199,
		0,
		0.304042,
		-1.300367,
		-1.190515,
		1
	},
	[0.8] = {
		-0.809531,
		-0.228974,
		-0.540583,
		0,
		0.586633,
		-0.279695,
		-0.760022,
		0,
		0.022827,
		-0.932385,
		0.360745,
		0,
		0.061068,
		-1.255458,
		-0.961758,
		1
	},
	[0.933333333333] = {
		-0.832894,
		-0.119758,
		-0.54032,
		0,
		0.546468,
		-0.332356,
		-0.768708,
		0,
		-0.087519,
		-0.93552,
		0.342261,
		0,
		0.472494,
		-1.260853,
		-1.285604,
		1
	},
	[0.966666666667] = {
		-0.835429,
		-0.102115,
		-0.540029,
		0,
		0.539448,
		-0.340325,
		-0.770178,
		0,
		-0.105138,
		-0.934747,
		0.339403,
		0,
		0.512705,
		-1.240051,
		-1.297438,
		1
	},
	[0.9] = {
		-0.82871,
		-0.144804,
		-0.540621,
		0,
		0.556188,
		-0.320782,
		-0.766651,
		0,
		-0.062408,
		-0.936018,
		0.346374,
		0,
		0.403926,
		-1.292675,
		-1.261087,
		1
	}
}

return spline_matrices
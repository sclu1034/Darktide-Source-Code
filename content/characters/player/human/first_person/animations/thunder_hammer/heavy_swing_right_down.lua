local spline_matrices = {
	[0] = {
		0.667885,
		-0.092774,
		0.73846,
		0,
		-0.720685,
		-0.328388,
		0.610553,
		0,
		0.185858,
		-0.939976,
		-0.286186,
		0,
		-0.19942,
		0.318879,
		0.144379,
		1
	},
	{
		0.961119,
		-0.005131,
		0.276088,
		0,
		0.182472,
		-0.738627,
		-0.648949,
		0,
		0.207256,
		0.674095,
		-0.708972,
		0,
		0.094387,
		-0.421989,
		-0.489685,
		1
	},
	[0.0166666666667] = {
		0.672406,
		-0.089005,
		0.734812,
		0,
		-0.714682,
		-0.336405,
		0.613238,
		0,
		0.192613,
		-0.937502,
		-0.289811,
		0,
		-0.201923,
		0.318559,
		0.152664,
		1
	},
	[0.0333333333333] = {
		0.684381,
		-0.077078,
		0.725039,
		0,
		-0.698427,
		-0.354804,
		0.621542,
		0,
		0.20934,
		-0.931758,
		-0.296654,
		0,
		-0.207081,
		0.315448,
		0.162479,
		1
	},
	[0.05] = {
		0.701613,
		-0.056568,
		0.710309,
		0,
		-0.674182,
		-0.375425,
		0.63603,
		0,
		0.230689,
		-0.925125,
		-0.30154,
		0,
		-0.213557,
		0.312035,
		0.172145,
		1
	},
	[0.0666666666667] = {
		0.721961,
		-0.027698,
		0.691379,
		0,
		-0.644574,
		-0.39023,
		0.657453,
		0,
		0.251587,
		-0.920301,
		-0.299584,
		0,
		-0.220091,
		0.310839,
		0.179984,
		1
	},
	[0.0833333333333] = {
		0.743748,
		0.008198,
		0.668409,
		0,
		-0.612734,
		-0.391333,
		0.686597,
		0,
		0.2672,
		-0.920212,
		-0.286031,
		0,
		-0.225499,
		0.314396,
		0.184231,
		1
	},
	[0.116666666667] = {
		0.789238,
		0.088801,
		0.607633,
		0,
		-0.555311,
		-0.319232,
		0.767932,
		0,
		0.262169,
		-0.943507,
		-0.202638,
		0,
		-0.227978,
		0.345527,
		0.173562,
		1
	},
	[0.133333333333] = {
		0.812613,
		0.123719,
		0.56952,
		0,
		-0.535373,
		-0.227677,
		0.81335,
		0,
		0.230293,
		-0.965845,
		-0.118778,
		0,
		-0.223194,
		0.376459,
		0.15467,
		1
	},
	[0.15] = {
		0.836408,
		0.146564,
		0.528148,
		0,
		-0.518953,
		-0.098321,
		0.84913,
		0,
		0.17638,
		-0.984303,
		-0.006176,
		0,
		-0.214162,
		0.414661,
		0.126943,
		1
	},
	[0.166666666667] = {
		0.861059,
		0.151506,
		0.48541,
		0,
		-0.497985,
		0.058072,
		0.865239,
		0,
		0.1029,
		-0.986749,
		0.125451,
		0,
		-0.200047,
		0.455258,
		0.09177,
		1
	},
	[0.183333333333] = {
		0.885066,
		0.136158,
		0.445105,
		0,
		-0.465205,
		0.226806,
		0.855654,
		0,
		0.015552,
		-0.964375,
		0.26408,
		0,
		-0.180762,
		0.49382,
		0.051388,
		1
	},
	[0.1] = {
		0.766121,
		0.048438,
		0.640868,
		0,
		-0.58202,
		-0.370657,
		0.723786,
		0,
		0.272601,
		-0.927506,
		-0.255777,
		0,
		-0.228589,
		0.325197,
		0.182894,
		1
	},
	[0.216666666667] = {
		0.920535,
		0.055361,
		0.386717,
		0,
		-0.354146,
		0.536135,
		0.766251,
		0,
		-0.164912,
		-0.842315,
		0.513137,
		0,
		-0.130718,
		0.553771,
		-0.033531,
		1
	},
	[0.233333333333] = {
		0.928526,
		0.002838,
		0.371257,
		0,
		-0.283364,
		0.651523,
		0.703721,
		0,
		-0.239885,
		-0.758624,
		0.60576,
		0,
		-0.103358,
		0.573927,
		-0.072464,
		1
	},
	[0.25] = {
		0.930787,
		-0.047811,
		0.362422,
		0,
		-0.2131,
		0.734574,
		0.644197,
		0,
		-0.297025,
		-0.676843,
		0.673543,
		0,
		-0.076511,
		0.588884,
		-0.106971,
		1
	},
	[0.266666666667] = {
		0.932198,
		-0.112189,
		0.344122,
		0,
		-0.133346,
		0.777425,
		0.614678,
		0,
		-0.336489,
		-0.618889,
		0.709755,
		0,
		-0.048501,
		0.602341,
		-0.138202,
		1
	},
	[0.283333333333] = {
		0.931454,
		-0.182495,
		0.314785,
		0,
		-0.04551,
		0.799902,
		0.598403,
		0,
		-0.361003,
		-0.57171,
		0.736766,
		0,
		-0.018643,
		0.614918,
		-0.172495,
		1
	},
	[0.2] = {
		0.905725,
		0.102364,
		0.41132,
		0,
		-0.416821,
		0.39129,
		0.820459,
		0,
		-0.07696,
		-0.914556,
		0.397069,
		0,
		-0.157147,
		0.527143,
		0.008564,
		1
	},
	[0.316666666667] = {
		0.937101,
		-0.193433,
		0.290559,
		0,
		0.059437,
		0.908681,
		0.413239,
		0,
		-0.343959,
		-0.369977,
		0.863023,
		0,
		0.034296,
		0.626515,
		-0.256647,
		1
	},
	[0.333333333333] = {
		0.949696,
		-0.134606,
		0.28277,
		0,
		0.067555,
		0.969712,
		0.234721,
		0,
		-0.3058,
		-0.203811,
		0.930025,
		0,
		0.057297,
		0.62207,
		-0.298945,
		1
	},
	[0.35] = {
		0.955941,
		-0.094476,
		0.277939,
		0,
		0.10339,
		0.994486,
		-0.017556,
		0,
		-0.274748,
		0.045518,
		0.960438,
		0,
		0.081154,
		0.595811,
		-0.344932,
		1
	},
	[0.366666666667] = {
		0.949628,
		-0.092547,
		0.299403,
		0,
		0.218228,
		0.880967,
		-0.419849,
		0,
		-0.224908,
		0.464038,
		0.856787,
		0,
		0.099593,
		0.532593,
		-0.385111,
		1
	},
	[0.383333333333] = {
		0.937828,
		-0.068558,
		0.340262,
		0,
		0.327099,
		0.502529,
		-0.800294,
		0,
		-0.116125,
		0.861838,
		0.493711,
		0,
		0.09266,
		0.457345,
		-0.377114,
		1
	},
	[0.3] = {
		0.929498,
		-0.220036,
		0.296003,
		0,
		0.027567,
		0.841753,
		0.539159,
		0,
		-0.367796,
		-0.492987,
		0.788473,
		0,
		0.009973,
		0.62294,
		-0.213645,
		1
	},
	[0.416666666667] = {
		0.950797,
		-0.017996,
		0.30929,
		0,
		0.301313,
		-0.178524,
		-0.936664,
		0,
		0.072072,
		0.983771,
		-0.164318,
		0,
		0.117208,
		0.337518,
		-0.350303,
		1
	},
	[0.433333333333] = {
		0.970278,
		0.011449,
		0.241721,
		0,
		0.229666,
		-0.358307,
		-0.904914,
		0,
		0.07625,
		0.933533,
		-0.350287,
		0,
		0.149307,
		0.255859,
		-0.366574,
		1
	},
	[0.45] = {
		0.980838,
		0.018651,
		0.193932,
		0,
		0.179383,
		-0.474865,
		-0.861583,
		0,
		0.076022,
		0.879861,
		-0.469111,
		0,
		0.180122,
		0.166247,
		-0.378009,
		1
	},
	[0.466666666667] = {
		0.981846,
		0.019217,
		0.188706,
		0,
		0.170686,
		-0.523455,
		-0.834782,
		0,
		0.082737,
		0.851837,
		-0.517232,
		0,
		0.199214,
		0.062009,
		-0.378064,
		1
	},
	[0.483333333333] = {
		0.978542,
		0.018862,
		0.205182,
		0,
		0.184627,
		-0.522367,
		-0.832494,
		0,
		0.091478,
		0.852512,
		-0.51464,
		0,
		0.213109,
		-0.063523,
		-0.373955,
		1
	},
	[0.4] = {
		0.934667,
		-0.055152,
		0.35122,
		0,
		0.354771,
		0.080447,
		-0.931486,
		0,
		0.023119,
		0.995232,
		0.094758,
		0,
		0.098905,
		0.40111,
		-0.349455,
		1
	},
	[0.516666666667] = {
		0.965674,
		0.01464,
		0.259343,
		0,
		0.235696,
		-0.469037,
		-0.851148,
		0,
		0.109181,
		0.883057,
		-0.456387,
		0,
		0.231861,
		-0.310545,
		-0.363042,
		1
	},
	[0.533333333333] = {
		0.961179,
		0.013042,
		0.275617,
		0,
		0.24977,
		-0.465615,
		-0.84901,
		0,
		0.117259,
		0.884891,
		-0.450797,
		0,
		0.239118,
		-0.397804,
		-0.360622,
		1
	},
	[0.55] = {
		0.959614,
		0.01336,
		0.281003,
		0,
		0.251693,
		-0.486968,
		-0.836369,
		0,
		0.125666,
		0.873318,
		-0.470664,
		0,
		0.244982,
		-0.45505,
		-0.360471,
		1
	},
	[0.566666666667] = {
		0.959066,
		0.01423,
		0.282826,
		0,
		0.249393,
		-0.515561,
		-0.819756,
		0,
		0.134149,
		0.856735,
		-0.498006,
		0,
		0.248813,
		-0.495301,
		-0.360804,
		1
	},
	[0.583333333333] = {
		0.959331,
		0.015324,
		0.281866,
		0,
		0.243626,
		-0.549305,
		-0.799319,
		0,
		0.142581,
		0.835482,
		-0.530699,
		0,
		0.250812,
		-0.521609,
		-0.361486,
		1
	},
	[0.5] = {
		0.972482,
		0.017293,
		0.232333,
		0,
		0.210064,
		-0.496352,
		-0.842323,
		0,
		0.100753,
		0.867949,
		-0.486327,
		0,
		0.223498,
		-0.193492,
		-0.368153,
		1
	},
	[0.616666666667] = {
		0.961339,
		0.017501,
		0.274812,
		0,
		0.225281,
		-0.623892,
		-0.748336,
		0,
		0.158356,
		0.781314,
		-0.603714,
		0,
		0.25068,
		-0.544654,
		-0.363654,
		1
	},
	[0.633333333333] = {
		0.962582,
		0.018271,
		0.270372,
		0,
		0.214534,
		-0.660937,
		-0.719123,
		0,
		0.16556,
		0.750219,
		-0.640126,
		0,
		0.249185,
		-0.547718,
		-0.365079,
		1
	},
	[0.65] = {
		0.963668,
		0.018679,
		0.266449,
		0,
		0.203934,
		-0.695675,
		-0.688801,
		0,
		0.172496,
		0.718113,
		-0.674209,
		0,
		0.247072,
		-0.549515,
		-0.366683,
		1
	},
	[0.666666666667] = {
		0.964369,
		0.018741,
		0.263897,
		0,
		0.194382,
		-0.726846,
		-0.658719,
		0,
		0.179467,
		0.686545,
		-0.70459,
		0,
		0.244554,
		-0.553412,
		-0.36839,
		1
	},
	[0.683333333333] = {
		0.964213,
		0.018115,
		0.264511,
		0,
		0.194305,
		-0.727063,
		-0.658502,
		0,
		0.180388,
		0.686331,
		-0.704563,
		0,
		0.243515,
		-0.562795,
		-0.378372,
		1
	},
	[0.6] = {
		0.960173,
		0.016457,
		0.278921,
		0,
		0.235274,
		-0.586085,
		-0.775339,
		0,
		0.150711,
		0.810082,
		-0.566615,
		0,
		0.251313,
		-0.537025,
		-0.362448,
		1
	},
	[0.716666666667] = {
		0.963901,
		0.016598,
		0.265744,
		0,
		0.193898,
		-0.727762,
		-0.657849,
		0,
		0.18248,
		0.685629,
		-0.704709,
		0,
		0.23987,
		-0.572799,
		-0.400315,
		1
	},
	[0.733333333333] = {
		0.963745,
		0.015702,
		0.266364,
		0,
		0.193579,
		-0.728187,
		-0.657473,
		0,
		0.183639,
		0.685199,
		-0.704826,
		0,
		0.237186,
		-0.573993,
		-0.411796,
		1
	},
	[0.75] = {
		0.963588,
		0.014723,
		0.266985,
		0,
		0.19319,
		-0.728657,
		-0.657067,
		0,
		0.184866,
		0.684721,
		-0.704969,
		0,
		0.233876,
		-0.573049,
		-0.42327,
		1
	},
	[0.766666666667] = {
		0.963431,
		0.01367,
		0.267607,
		0,
		0.192735,
		-0.729168,
		-0.656633,
		0,
		0.186155,
		0.684198,
		-0.705138,
		0,
		0.229902,
		-0.570265,
		-0.434477,
		1
	},
	[0.783333333333] = {
		0.963273,
		0.012547,
		0.268229,
		0,
		0.192221,
		-0.729717,
		-0.656174,
		0,
		0.187498,
		0.683635,
		-0.705328,
		0,
		0.225223,
		-0.565941,
		-0.445158,
		1
	},
	[0.7] = {
		0.964057,
		0.017404,
		0.265126,
		0,
		0.194142,
		-0.727386,
		-0.658193,
		0,
		0.181394,
		0.686007,
		-0.704621,
		0,
		0.241967,
		-0.569166,
		-0.389087,
		1
	},
	[0.816666666667] = {
		0.962955,
		0.010125,
		0.269473,
		0,
		0.191033,
		-0.730912,
		-0.65519,
		0,
		0.190327,
		0.682396,
		-0.70577,
		0,
		0.213579,
		-0.553848,
		-0.4639,
		1
	},
	[0.833333333333] = {
		0.962794,
		0.008839,
		0.270093,
		0,
		0.190371,
		-0.731552,
		-0.654669,
		0,
		0.1918,
		0.681728,
		-0.706016,
		0,
		0.206522,
		-0.546664,
		-0.471438,
		1
	},
	[0.85] = {
		0.962631,
		0.007512,
		0.270711,
		0,
		0.189669,
		-0.732214,
		-0.654131,
		0,
		0.193305,
		0.681033,
		-0.706277,
		0,
		0.198578,
		-0.539111,
		-0.477406,
		1
	},
	[0.866666666667] = {
		0.962467,
		0.006151,
		0.271327,
		0,
		0.188934,
		-0.732896,
		-0.65358,
		0,
		0.194834,
		0.680313,
		-0.706551,
		0,
		0.189681,
		-0.530682,
		-0.481931,
		1
	},
	[0.883333333333] = {
		0.962302,
		0.004763,
		0.27194,
		0,
		0.18817,
		-0.733594,
		-0.653018,
		0,
		0.196383,
		0.679572,
		-0.706835,
		0,
		0.179871,
		-0.520768,
		-0.485394,
		1
	},
	[0.8] = {
		0.963115,
		0.011364,
		0.268852,
		0,
		0.191652,
		-0.730299,
		-0.655692,
		0,
		0.188891,
		0.683033,
		-0.70554,
		0,
		0.219797,
		-0.560371,
		-0.455052,
		1
	},
	[0.916666666667] = {
		0.961968,
		0.001934,
		0.273155,
		0,
		0.186578,
		-0.735022,
		-0.651868,
		0,
		0.199514,
		0.678041,
		-0.707428,
		0,
		0.157933,
		-0.497064,
		-0.489604,
		1
	},
	[0.933333333333] = {
		0.961799,
		0.000506,
		0.273754,
		0,
		0.185761,
		-0.735745,
		-0.651285,
		0,
		0.201084,
		0.677258,
		-0.707734,
		0,
		0.146014,
		-0.483562,
		-0.490584,
		1
	},
	[0.95] = {
		0.96163,
		-0.000921,
		0.274348,
		0,
		0.184936,
		-0.736471,
		-0.650699,
		0,
		0.202649,
		0.676468,
		-0.708042,
		0,
		0.133599,
		-0.469155,
		-0.490969,
		1
	},
	[0.966666666667] = {
		0.96146,
		-0.002341,
		0.274936,
		0,
		0.184109,
		-0.737196,
		-0.650113,
		0,
		0.204203,
		0.675675,
		-0.708353,
		0,
		0.120789,
		-0.453991,
		-0.490871,
		1
	},
	[0.983333333333] = {
		0.961289,
		-0.003746,
		0.275516,
		0,
		0.183286,
		-0.737915,
		-0.649529,
		0,
		0.205741,
		0.674883,
		-0.708663,
		0,
		0.107686,
		-0.438219,
		-0.490406,
		1
	},
	[0.9] = {
		0.962136,
		0.003355,
		0.27255,
		0,
		0.187383,
		-0.734303,
		-0.652446,
		0,
		0.197945,
		0.678813,
		-0.707128,
		0,
		0.169253,
		-0.509514,
		-0.487913,
		1
	},
	[1.01666666667] = {
		0.960949,
		-0.006488,
		0.276651,
		0,
		0.181671,
		-0.739328,
		-0.648375,
		0,
		0.208742,
		0.673315,
		-0.709277,
		0,
		0.080991,
		-0.405453,
		-0.488822,
		1
	},
	[1.03333333333] = {
		0.96078,
		-0.00781,
		0.277203,
		0,
		0.18089,
		-0.740014,
		-0.64781,
		0,
		0.210194,
		0.672546,
		-0.709578,
		0,
		0.067594,
		-0.388764,
		-0.487925,
		1
	},
	[1.05] = {
		0.960612,
		-0.00909,
		0.277745,
		0,
		0.180134,
		-0.740683,
		-0.647256,
		0,
		0.211605,
		0.671793,
		-0.709871,
		0,
		0.054292,
		-0.372077,
		-0.487107,
		1
	},
	[1.06666666667] = {
		0.960446,
		-0.010322,
		0.278275,
		0,
		0.179408,
		-0.741332,
		-0.646715,
		0,
		0.21297,
		0.671059,
		-0.710157,
		0,
		0.041178,
		-0.355547,
		-0.486475,
		1
	},
	[1.08333333333] = {
		0.960283,
		-0.011499,
		0.278792,
		0,
		0.178718,
		-0.741957,
		-0.646189,
		0,
		0.214282,
		0.670349,
		-0.710433,
		0,
		0.028344,
		-0.339331,
		-0.486139,
		1
	},
	[1.11666666667] = {
		0.959966,
		-0.013661,
		0.279782,
		0,
		0.177466,
		-0.743125,
		-0.645191,
		0,
		0.216727,
		0.669013,
		-0.710951,
		0,
		0.003887,
		-0.308473,
		-0.486783,
		1
	},
	[1.1] = {
		0.960123,
		-0.012614,
		0.279294,
		0,
		0.178069,
		-0.742556,
		-0.64568,
		0,
		0.215536,
		0.669666,
		-0.710698,
		0,
		0.015884,
		-0.323586,
		-0.486206,
		1
	}
}

return spline_matrices
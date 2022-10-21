local spline_matrices = {
	[0] = {
		-0.161967,
		-0.335131,
		0.928146,
		0,
		-0.972244,
		0.21513,
		-0.091984,
		0,
		-0.168845,
		-0.917282,
		-0.360672,
		0,
		-0.315406,
		-0.030221,
		-0.25497,
		1
	},
	{
		0.598171,
		-0.017148,
		0.801185,
		0,
		0.651858,
		-0.571117,
		-0.498906,
		0,
		0.466126,
		0.82069,
		-0.330447,
		0,
		0.531898,
		0.319988,
		-0.413718,
		1
	},
	[0.0333333333333] = {
		-0.157484,
		-0.329603,
		0.930893,
		0,
		-0.970244,
		0.227203,
		-0.083695,
		0,
		-0.183915,
		-0.916374,
		-0.355576,
		0,
		-0.320495,
		-0.023107,
		-0.251963,
		1
	},
	[0.0666666666667] = {
		-0.146475,
		-0.315973,
		0.937393,
		0,
		-0.961662,
		0.267576,
		-0.060073,
		0,
		-0.231843,
		-0.910255,
		-0.343052,
		0,
		-0.332419,
		-0.001172,
		-0.243278,
		1
	},
	[0.133333333333] = {
		-0.119733,
		-0.277624,
		0.953199,
		0,
		-0.891563,
		0.452464,
		0.019791,
		0,
		-0.436783,
		-0.847468,
		-0.301694,
		0,
		-0.356324,
		0.089231,
		-0.210535,
		1
	},
	[0.166666666667] = {
		-0.112111,
		-0.257855,
		0.959657,
		0,
		-0.799489,
		0.596933,
		0.066993,
		0,
		-0.590125,
		-0.759725,
		-0.273075,
		0,
		-0.358215,
		0.158094,
		-0.187577,
		1
	},
	[0.1] = {
		-0.132596,
		-0.297817,
		0.945369,
		0,
		-0.939503,
		0.34169,
		-0.024132,
		0,
		-0.315836,
		-0.891377,
		-0.325107,
		0,
		-0.346068,
		0.036197,
		-0.22932,
		1
	},
	[0.233333333333] = {
		-0.380695,
		-0.184982,
		0.906009,
		0,
		0.005097,
		0.979352,
		0.202099,
		0,
		-0.924687,
		0.081556,
		-0.371891,
		0,
		-0.110418,
		0.495812,
		-0.094073,
		1
	},
	[0.266666666667] = {
		-0.61414,
		-0.120706,
		0.779912,
		0,
		0.659009,
		0.465284,
		0.590947,
		0,
		-0.434211,
		0.876893,
		-0.206203,
		0,
		0.089103,
		0.626273,
		-0.028042,
		1
	},
	[0.2] = {
		-0.20308,
		-0.228161,
		0.952209,
		0,
		-0.53507,
		0.840292,
		0.087228,
		0,
		-0.820036,
		-0.491784,
		-0.292729,
		0,
		-0.273169,
		0.31141,
		-0.14762,
		1
	},
	[0.333333333333] = {
		-0.485881,
		-0.099071,
		0.868392,
		0,
		0.873712,
		-0.08163,
		0.479545,
		0,
		0.023378,
		0.991727,
		0.126222,
		0,
		0.411267,
		0.510886,
		0.05355,
		1
	},
	[0.366666666667] = {
		-0.341326,
		-0.077225,
		0.936767,
		0,
		0.86558,
		-0.414345,
		0.28123,
		0,
		0.366427,
		0.906838,
		0.208271,
		0,
		0.513397,
		0.408658,
		0.048083,
		1
	},
	[0.3] = {
		-0.625467,
		-0.101009,
		0.773685,
		0,
		0.778173,
		-0.00845,
		0.627993,
		0,
		-0.056895,
		0.99485,
		0.083888,
		0,
		0.270018,
		0.621556,
		0.025222,
		1
	},
	[0.433333333333] = {
		-0.255538,
		-0.055186,
		0.965223,
		0,
		0.776794,
		-0.606094,
		0.171,
		0,
		0.575579,
		0.793476,
		0.197748,
		0,
		0.558738,
		0.355872,
		0.046474,
		1
	},
	[0.466666666667] = {
		-0.255195,
		-0.052944,
		0.965439,
		0,
		0.778562,
		-0.603334,
		0.172711,
		0,
		0.573338,
		0.795729,
		0.195188,
		0,
		0.557724,
		0.357615,
		0.045267,
		1
	},
	[0.4] = {
		-0.253957,
		-0.059559,
		0.96538,
		0,
		0.775005,
		-0.609692,
		0.166262,
		0,
		0.578682,
		0.790398,
		0.200994,
		0,
		0.56005,
		0.353685,
		0.047374,
		1
	},
	[0.533333333333] = {
		-0.254037,
		-0.051768,
		0.965808,
		0,
		0.781118,
		-0.59985,
		0.173306,
		0,
		0.570369,
		0.798436,
		0.192821,
		0,
		0.556345,
		0.359924,
		0.043907,
		1
	},
	[0.566666666667] = {
		-0.253212,
		-0.052282,
		0.965997,
		0,
		0.781866,
		-0.599101,
		0.172522,
		0,
		0.56971,
		0.798965,
		0.192577,
		0,
		0.556014,
		0.360479,
		0.043557,
		1
	},
	[0.5] = {
		-0.254721,
		-0.051863,
		0.965623,
		0,
		0.780006,
		-0.60125,
		0.173464,
		0,
		0.571584,
		0.797376,
		0.193604,
		0,
		0.55692,
		0.358969,
		0.044444,
		1
	},
	[0.633333333333] = {
		-0.251533,
		-0.054163,
		0.966332,
		0,
		0.782109,
		-0.59951,
		0.169978,
		0,
		0.570119,
		0.798532,
		0.193158,
		0,
		0.556123,
		0.360342,
		0.043298,
		1
	},
	[0.666666666667] = {
		-0.250704,
		-0.055424,
		0.966476,
		0,
		0.781579,
		-0.600675,
		0.168296,
		0,
		0.57121,
		0.79757,
		0.19391,
		0,
		0.556574,
		0.359636,
		0.043362,
		1
	},
	[0.6] = {
		-0.252372,
		-0.053101,
		0.966172,
		0,
		0.782209,
		-0.598976,
		0.171399,
		0,
		0.569612,
		0.799005,
		0.192701,
		0,
		0.555933,
		0.360628,
		0.043358,
		1
	},
	[0.733333333333] = {
		-0.223214,
		-0.063911,
		0.972672,
		0,
		0.786836,
		-0.600819,
		0.14109,
		0,
		0.575383,
		0.796826,
		0.184399,
		0,
		0.56464,
		0.356715,
		0.033272,
		1
	},
	[0.766666666667] = {
		-0.153084,
		-0.07914,
		0.985039,
		0,
		0.802334,
		-0.59187,
		0.077138,
		0,
		0.57691,
		0.802139,
		0.154103,
		0,
		0.581894,
		0.353812,
		0.005077,
		1
	},
	[0.7] = {
		-0.249889,
		-0.056855,
		0.966604,
		0,
		0.780664,
		-0.602394,
		0.166387,
		0,
		0.572816,
		0.796171,
		0.194917,
		0,
		0.557256,
		0.358558,
		0.043532,
		1
	},
	[0.833333333333] = {
		0.065001,
		-0.11338,
		0.991423,
		0,
		0.827633,
		-0.548931,
		-0.117039,
		0,
		0.557492,
		0.828143,
		0.058156,
		0,
		0.626143,
		0.345653,
		-0.08693,
		1
	},
	[0.866666666667] = {
		0.183004,
		-0.12116,
		0.975618,
		0,
		0.826421,
		-0.518542,
		-0.219415,
		0,
		0.532483,
		0.846425,
		0.005233,
		0,
		0.643253,
		0.340849,
		-0.14159,
		1
	},
	[0.8] = {
		-0.052242,
		-0.097536,
		0.99386,
		0,
		0.818403,
		-0.574489,
		-0.01336,
		0,
		0.572265,
		0.81268,
		0.109836,
		0,
		0.604046,
		0.350053,
		-0.036512,
		1
	},
	[0.933333333333] = {
		0.387123,
		-0.098195,
		0.916785,
		0,
		0.784538,
		-0.487288,
		-0.383472,
		0,
		0.484393,
		0.867703,
		-0.111603,
		0,
		0.634772,
		0.330568,
		-0.257374,
		1
	},
	[0.966666666667] = {
		0.495675,
		-0.064349,
		0.866121,
		0,
		0.724915,
		-0.518587,
		-0.453393,
		0,
		0.478335,
		0.8526,
		-0.210403,
		0,
		0.592297,
		0.325024,
		-0.332222,
		1
	},
	[0.9] = {
		0.286528,
		-0.116924,
		0.95091,
		0,
		0.816045,
		-0.490236,
		-0.30617,
		0,
		0.501969,
		0.863712,
		-0.045051,
		0,
		0.650468,
		0.335902,
		-0.195884,
		1
	},
	[1.03333333333] = {
		0.683679,
		0.039301,
		0.728724,
		0,
		0.582006,
		-0.6318,
		-0.511956,
		0,
		0.440287,
		0.774135,
		-0.454822,
		0,
		0.462471,
		0.31592,
		-0.495185,
		1
	},
	[1.06666666667] = {
		0.746455,
		0.098254,
		0.658142,
		0,
		0.528324,
		-0.688824,
		-0.496382,
		0,
		0.404573,
		0.718239,
		-0.566086,
		0,
		0.392943,
		0.313034,
		-0.569977,
		1
	},
	[1.13333333333] = {
		0.807481,
		0.188232,
		0.559056,
		0,
		0.479267,
		-0.761875,
		-0.435718,
		0,
		0.343914,
		0.619771,
		-0.705412,
		0,
		0.289397,
		0.310624,
		-0.673097,
		1
	},
	[1.16666666667] = {
		0.814316,
		0.201024,
		0.544498,
		0,
		0.473841,
		-0.772023,
		-0.423622,
		0,
		0.335207,
		0.602968,
		-0.723924,
		0,
		0.273314,
		0.310674,
		-0.688251,
		1
	},
	[1.1] = {
		0.786405,
		0.151021,
		0.598965,
		0,
		0.495286,
		-0.733605,
		-0.465312,
		0,
		0.369132,
		0.662583,
		-0.651709,
		0,
		0.332263,
		0.311324,
		-0.631479,
		1
	},
	[1.23333333333] = {
		0.815001,
		0.198424,
		0.544428,
		0,
		0.471949,
		-0.772438,
		-0.424975,
		0,
		0.336211,
		0.603297,
		-0.723183,
		0,
		0.27369,
		0.311089,
		-0.687915,
		1
	},
	[1.2] = {
		0.814766,
		0.199321,
		0.544452,
		0,
		0.472602,
		-0.772294,
		-0.42451,
		0,
		0.335863,
		0.603185,
		-0.723438,
		0,
		0.273559,
		0.310947,
		-0.688031,
		1
	}
}

return spline_matrices

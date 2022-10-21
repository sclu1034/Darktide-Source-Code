local spline_matrices = {
	[0] = {
		0.808572,
		0.055329,
		-0.585791,
		0,
		-0.027333,
		0.998026,
		0.056538,
		0,
		0.587763,
		-0.029703,
		0.808488,
		0,
		-0.022213,
		0.511754,
		-0.460404,
		1
	},
	{
		0.926013,
		0.308902,
		0.216976,
		0,
		0.377468,
		-0.764106,
		-0.523125,
		0,
		0.004198,
		0.566322,
		-0.824173,
		0,
		0.102636,
		-0.437164,
		-0.604936,
		1
	},
	[0.0166666666667] = {
		0.818571,
		0.075025,
		-0.569485,
		0,
		-0.004694,
		0.992274,
		0.123978,
		0,
		0.574386,
		-0.098811,
		0.812599,
		0,
		-0.010124,
		0.528193,
		-0.454591,
		1
	},
	[0.0333333333333] = {
		0.8225,
		0.118994,
		-0.556178,
		0,
		0.000524,
		0.977711,
		0.209956,
		0,
		0.568764,
		-0.17298,
		0.804105,
		0,
		0.014058,
		0.534534,
		-0.434897,
		1
	},
	[0.05] = {
		0.820881,
		0.171091,
		-0.54487,
		0,
		0.000375,
		0.953909,
		0.300094,
		0,
		0.5711,
		-0.246546,
		0.782982,
		0,
		0.046817,
		0.531581,
		-0.404035,
		1
	},
	[0.0666666666667] = {
		0.815279,
		0.213461,
		-0.538288,
		0,
		0.012409,
		0.922923,
		0.384784,
		0,
		0.578935,
		-0.320386,
		0.749791,
		0,
		0.085764,
		0.522552,
		-0.364756,
		1
	},
	[0.0833333333333] = {
		0.808198,
		0.229272,
		-0.542448,
		0,
		0.057475,
		0.886,
		0.46011,
		0,
		0.586099,
		-0.403037,
		0.702886,
		0,
		0.129593,
		0.512591,
		-0.318973,
		1
	},
	[0.116666666667] = {
		0.772501,
		0.014628,
		-0.634846,
		0,
		0.429756,
		0.72396,
		0.539623,
		0,
		0.467496,
		-0.689687,
		0.552972,
		0,
		0.255587,
		0.518173,
		-0.215465,
		1
	},
	[0.133333333333] = {
		0.689265,
		-0.048161,
		-0.722907,
		0,
		0.587644,
		0.620788,
		0.518939,
		0,
		0.423779,
		-0.782498,
		0.456188,
		0,
		0.310373,
		0.492986,
		-0.179648,
		1
	},
	[0.15] = {
		0.576616,
		-0.056523,
		-0.815058,
		0,
		0.702164,
		0.54432,
		0.459001,
		0,
		0.417708,
		-0.836971,
		0.353552,
		0,
		0.349529,
		0.451169,
		-0.158997,
		1
	},
	[0.166666666667] = {
		0.459285,
		-0.047256,
		-0.887031,
		0,
		0.786973,
		0.484785,
		0.381651,
		0,
		0.411984,
		-0.873356,
		0.259844,
		0,
		0.381358,
		0.410307,
		-0.148436,
		1
	},
	[0.183333333333] = {
		0.364396,
		-0.045186,
		-0.930147,
		0,
		0.855761,
		0.410171,
		0.315329,
		0,
		0.367271,
		-0.910889,
		0.188133,
		0,
		0.411703,
		0.384064,
		-0.139955,
		1
	},
	[0.1] = {
		0.799012,
		0.202781,
		-0.566092,
		0,
		0.157646,
		0.837852,
		0.522639,
		0,
		0.580282,
		-0.506837,
		0.637486,
		0,
		0.17837,
		0.506732,
		-0.267952,
		1
	},
	[0.216666666667] = {
		0.207169,
		-0.050034,
		-0.977025,
		0,
		0.970368,
		0.13747,
		0.198718,
		0,
		0.124369,
		-0.989241,
		0.077031,
		0,
		0.463511,
		0.361648,
		-0.121226,
		1
	},
	[0.233333333333] = {
		0.128508,
		-0.046507,
		-0.990617,
		0,
		0.990138,
		-0.050178,
		0.130802,
		0,
		-0.05579,
		-0.997657,
		0.0396,
		0,
		0.481617,
		0.354125,
		-0.114681,
		1
	},
	[0.25] = {
		0.065581,
		-0.037543,
		-0.997141,
		0,
		0.97372,
		-0.216009,
		0.072173,
		0,
		-0.218101,
		-0.975669,
		0.02239,
		0,
		0.480437,
		0.28961,
		-0.10871,
		1
	},
	[0.266666666667] = {
		0.02819,
		-0.031438,
		-0.999108,
		0,
		0.945203,
		-0.324394,
		0.036877,
		0,
		-0.325264,
		-0.945399,
		0.020571,
		0,
		0.464476,
		0.204526,
		-0.102967,
		1
	},
	[0.283333333333] = {
		0.023399,
		-0.031124,
		-0.999242,
		0,
		0.942897,
		-0.331503,
		0.032405,
		0,
		-0.33226,
		-0.942941,
		0.02159,
		0,
		0.439426,
		0.146927,
		-0.096103,
		1
	},
	[0.2] = {
		0.285596,
		-0.048242,
		-0.957135,
		0,
		0.918791,
		0.297769,
		0.259146,
		0,
		0.272503,
		-0.953418,
		0.129366,
		0,
		0.439076,
		0.371383,
		-0.129846,
		1
	},
	[0.316666666667] = {
		0.184852,
		0.031966,
		-0.982246,
		0,
		0.975963,
		0.111428,
		0.187296,
		0,
		0.115437,
		-0.993258,
		-0.0106,
		0,
		0.341243,
		0.271399,
		-0.094638,
		1
	},
	[0.333333333333] = {
		0.212058,
		0.135252,
		-0.967852,
		0,
		0.853485,
		0.456779,
		0.250832,
		0,
		0.47602,
		-0.879238,
		-0.018572,
		0,
		0.306536,
		0.423678,
		-0.091991,
		1
	},
	[0.35] = {
		0.152776,
		0.182362,
		-0.97129,
		0,
		0.651689,
		0.720265,
		0.237737,
		0,
		0.74294,
		-0.6693,
		-0.008804,
		0,
		0.279965,
		0.525733,
		-0.08358,
		1
	},
	[0.366666666667] = {
		0.087137,
		0.154592,
		-0.984128,
		0,
		0.431565,
		0.884516,
		0.177156,
		0,
		0.897864,
		-0.440152,
		0.010357,
		0,
		0.225795,
		0.555091,
		-0.072539,
		1
	},
	[0.383333333333] = {
		0.045873,
		0.092418,
		-0.994663,
		0,
		0.174488,
		0.979663,
		0.099071,
		0,
		0.98359,
		-0.178101,
		0.028815,
		0,
		0.143023,
		0.553814,
		-0.060473,
		1
	},
	[0.3] = {
		0.085588,
		-0.027082,
		-0.995963,
		0,
		0.977714,
		-0.190056,
		0.089187,
		0,
		-0.191704,
		-0.9814,
		0.010212,
		0,
		0.392877,
		0.160046,
		-0.093167,
		1
	},
	[0.416666666667] = {
		0.028396,
		0.035461,
		-0.998968,
		0,
		-0.720485,
		0.693458,
		0.004136,
		0,
		0.692889,
		0.719624,
		0.045241,
		0,
		-0.108379,
		0.474579,
		-0.053658,
		1
	},
	[0.433333333333] = {
		0.026337,
		0.035948,
		-0.999007,
		0,
		-0.980269,
		0.196776,
		-0.018762,
		0,
		0.195906,
		0.979789,
		0.040421,
		0,
		-0.208119,
		0.427602,
		-0.057607,
		1
	},
	[0.45] = {
		0.056909,
		0.037755,
		-0.997665,
		0,
		-0.997047,
		-0.049454,
		-0.058745,
		0,
		-0.051557,
		0.998063,
		0.034829,
		0,
		-0.267118,
		0.366592,
		-0.060729,
		1
	},
	[0.466666666667] = {
		0.03311,
		0.063889,
		-0.997408,
		0,
		-0.908924,
		-0.413097,
		-0.056633,
		0,
		-0.415644,
		0.908443,
		0.044393,
		0,
		-0.312602,
		0.290944,
		-0.05888,
		1
	},
	[0.483333333333] = {
		-0.003579,
		0.093751,
		-0.995589,
		0,
		-0.780184,
		-0.62305,
		-0.055866,
		0,
		-0.625539,
		0.776543,
		0.075372,
		0,
		-0.31086,
		0.273378,
		-0.095376,
		1
	},
	[0.4] = {
		0.033281,
		0.042075,
		-0.99856,
		0,
		-0.187159,
		0.981701,
		0.035127,
		0,
		0.981766,
		0.18572,
		0.040547,
		0,
		0.039359,
		0.529805,
		-0.052843,
		1
	},
	[0.516666666667] = {
		0.0026,
		0.160632,
		-0.987011,
		0,
		-0.621876,
		-0.772685,
		-0.127389,
		0,
		-0.783112,
		0.614129,
		0.097884,
		0,
		-0.302662,
		0.203901,
		-0.145453,
		1
	},
	[0.533333333333] = {
		0.062914,
		0.177182,
		-0.982165,
		0,
		-0.583656,
		-0.79175,
		-0.180218,
		0,
		-0.80956,
		0.584585,
		0.053601,
		0,
		-0.301975,
		0.162973,
		-0.149563,
		1
	},
	[0.55] = {
		0.104785,
		0.174389,
		-0.979086,
		0,
		-0.551009,
		-0.809398,
		-0.203136,
		0,
		-0.827894,
		0.560771,
		0.011278,
		0,
		-0.299781,
		0.128526,
		-0.153896,
		1
	},
	[0.566666666667] = {
		0.087016,
		0.155027,
		-0.98407,
		0,
		-0.493566,
		-0.851348,
		-0.177762,
		0,
		-0.865345,
		0.501171,
		0.002435,
		0,
		-0.2908,
		0.100502,
		-0.166642,
		1
	},
	[0.583333333333] = {
		0.059982,
		0.130525,
		-0.989629,
		0,
		-0.421457,
		-0.8954,
		-0.143641,
		0,
		-0.904863,
		0.425702,
		0.001303,
		0,
		-0.276805,
		0.077299,
		-0.183842,
		1
	},
	[0.5] = {
		-0.015986,
		0.123788,
		-0.99218,
		0,
		-0.695334,
		-0.714449,
		-0.077934,
		0,
		-0.718509,
		0.68865,
		0.097495,
		0,
		-0.306092,
		0.256113,
		-0.129476,
		1
	},
	[0.616666666667] = {
		0.086757,
		0.116677,
		-0.989373,
		0,
		-0.303507,
		-0.942812,
		-0.1378,
		0,
		-0.948871,
		0.312237,
		-0.046383,
		0,
		-0.235516,
		0.033967,
		-0.230996,
		1
	},
	[0.633333333333] = {
		0.196397,
		0.158929,
		-0.967559,
		0,
		-0.317156,
		-0.923434,
		-0.216058,
		0,
		-0.927815,
		0.3493,
		-0.130954,
		0,
		-0.213941,
		-0.005304,
		-0.257335,
		1
	},
	[0.65] = {
		0.368012,
		0.209425,
		-0.90593,
		0,
		-0.35936,
		-0.866564,
		-0.346306,
		0,
		-0.857571,
		0.453,
		-0.243647,
		0,
		-0.200168,
		-0.055702,
		-0.286018,
		1
	},
	[0.666666666667] = {
		0.58645,
		0.188677,
		-0.787704,
		0,
		-0.401698,
		-0.776726,
		-0.485114,
		0,
		-0.70336,
		0.600915,
		-0.379719,
		0,
		-0.201241,
		-0.101281,
		-0.322389,
		1
	},
	[0.683333333333] = {
		0.792711,
		0.159229,
		-0.588435,
		0,
		-0.332202,
		-0.696521,
		-0.636004,
		0,
		-0.511127,
		0.699647,
		-0.499244,
		0,
		-0.202283,
		-0.140954,
		-0.378306,
		1
	},
	[0.6] = {
		0.047445,
		0.110287,
		-0.992767,
		0,
		-0.345663,
		-0.930666,
		-0.119908,
		0,
		-0.937158,
		0.348852,
		-0.006033,
		0,
		-0.258013,
		0.058539,
		-0.205744,
		1
	},
	[0.716666666667] = {
		0.959817,
		0.15206,
		-0.235858,
		0,
		-0.084418,
		-0.645089,
		-0.75943,
		0,
		-0.267628,
		0.748824,
		-0.606331,
		0,
		-0.183797,
		-0.193086,
		-0.489756,
		1
	},
	[0.733333333333] = {
		0.970781,
		0.172249,
		-0.167077,
		0,
		-0.012303,
		-0.659604,
		-0.751512,
		0,
		-0.239652,
		0.731609,
		-0.638212,
		0,
		-0.170327,
		-0.208416,
		-0.522126,
		1
	},
	[0.75] = {
		0.974095,
		0.199604,
		-0.106289,
		0,
		0.055701,
		-0.667313,
		-0.742692,
		0,
		-0.219172,
		0.717532,
		-0.661144,
		0,
		-0.152806,
		-0.225691,
		-0.554658,
		1
	},
	[0.766666666667] = {
		0.97235,
		0.225545,
		-0.060539,
		0,
		0.10996,
		-0.67089,
		-0.733359,
		0,
		-0.206021,
		0.706424,
		-0.677141,
		0,
		-0.130757,
		-0.242606,
		-0.585309,
		1
	},
	[0.783333333333] = {
		0.967087,
		0.253608,
		-0.020616,
		0,
		0.160472,
		-0.670792,
		-0.724077,
		0,
		-0.19746,
		0.696937,
		-0.689411,
		0,
		-0.106007,
		-0.2584,
		-0.61058,
		1
	},
	[0.7] = {
		0.916345,
		0.147706,
		-0.37215,
		0,
		-0.193967,
		-0.649354,
		-0.735334,
		0,
		-0.350271,
		0.746004,
		-0.566382,
		0,
		-0.195303,
		-0.172908,
		-0.442708,
		1
	},
	[0.816666666667] = {
		0.950398,
		0.307811,
		0.044673,
		0,
		0.248778,
		-0.666076,
		-0.703173,
		0,
		-0.186688,
		0.679409,
		-0.709614,
		0,
		-0.052021,
		-0.279253,
		-0.6306,
		1
	},
	[0.833333333333] = {
		0.941267,
		0.33005,
		0.071296,
		0,
		0.285451,
		-0.664996,
		-0.690143,
		0,
		-0.18037,
		0.669961,
		-0.720152,
		0,
		-0.030739,
		-0.288733,
		-0.638278,
		1
	},
	[0.85] = {
		0.932909,
		0.347487,
		0.094515,
		0,
		0.316739,
		-0.666906,
		-0.674472,
		0,
		-0.171338,
		0.659158,
		-0.732225,
		0,
		-0.013841,
		-0.299868,
		-0.642142,
		1
	},
	[0.866666666667] = {
		0.926472,
		0.358439,
		0.114765,
		0,
		0.341743,
		-0.673436,
		-0.655512,
		0,
		-0.157674,
		0.646533,
		-0.746414,
		0,
		-0.00339,
		-0.315177,
		-0.637634,
		1
	},
	[0.883333333333] = {
		0.922046,
		0.363619,
		0.132711,
		0,
		0.360815,
		-0.683246,
		-0.634813,
		0,
		-0.140156,
		0.633211,
		-0.761183,
		0,
		0.005091,
		-0.330757,
		-0.630709,
		1
	},
	[0.8] = {
		0.95941,
		0.281658,
		0.014222,
		0,
		0.206879,
		-0.668625,
		-0.714242,
		0,
		-0.191662,
		0.688193,
		-0.699755,
		0,
		-0.077696,
		-0.269356,
		-0.621005,
		1
	},
	[0.916666666667] = {
		0.917368,
		0.36289,
		0.163543,
		0,
		0.385103,
		-0.705277,
		-0.595214,
		0,
		-0.100654,
		0.609011,
		-0.786749,
		0,
		0.029944,
		-0.359999,
		-0.627193,
		1
	},
	[0.933333333333] = {
		0.91706,
		0.357456,
		0.17671,
		0,
		0.390733,
		-0.717145,
		-0.577089,
		0,
		-0.079557,
		0.598271,
		-0.797334,
		0,
		0.043464,
		-0.375666,
		-0.624919,
		1
	},
	[0.95] = {
		0.917958,
		0.349006,
		0.188539,
		0,
		0.392392,
		-0.729253,
		-0.560551,
		0,
		-0.058143,
		0.588544,
		-0.806371,
		0,
		0.057633,
		-0.391625,
		-0.621798,
		1
	},
	[0.966666666667] = {
		0.919891,
		0.337857,
		0.199131,
		0,
		0.390442,
		-0.741314,
		-0.545902,
		0,
		-0.036818,
		0.579919,
		-0.813841,
		0,
		0.072338,
		-0.407429,
		-0.617427,
		1
	},
	[0.983333333333] = {
		0.922651,
		0.324361,
		0.208579,
		0,
		0.385306,
		-0.75303,
		-0.533372,
		0,
		-0.015939,
		0.572483,
		-0.819762,
		0,
		0.087389,
		-0.422628,
		-0.611545,
		1
	},
	[0.9] = {
		0.919009,
		0.365028,
		0.148921,
		0,
		0.375208,
		-0.693907,
		-0.614583,
		0,
		-0.121002,
		0.620683,
		-0.774668,
		0,
		0.017136,
		-0.344962,
		-0.628972,
		1
	},
	[1.01666666667] = {
		0.929749,
		0.291868,
		0.224456,
		0,
		0.367453,
		-0.774213,
		-0.515337,
		0,
		0.023366,
		0.561611,
		-0.827071,
		0,
		0.11806,
		-0.451138,
		-0.5989,
		1
	},
	[1.03333333333] = {
		0.933644,
		0.273763,
		0.231006,
		0,
		0.355807,
		-0.783258,
		-0.509813,
		0,
		0.041369,
		0.558177,
		-0.82869,
		0,
		0.133507,
		-0.464436,
		-0.593373,
		1
	},
	[1.05] = {
		0.937486,
		0.255049,
		0.236792,
		0,
		0.343131,
		-0.791058,
		-0.506446,
		0,
		0.058148,
		0.556036,
		-0.829121,
		0,
		0.148595,
		-0.476464,
		-0.587687,
		1
	},
	[1.06666666667] = {
		0.941101,
		0.236115,
		0.24203,
		0,
		0.329982,
		-0.797498,
		-0.505083,
		0,
		0.073761,
		0.5552,
		-0.82844,
		0,
		0.162937,
		-0.486846,
		-0.581734,
		1
	},
	[1.08333333333] = {
		0.944336,
		0.217381,
		0.24693,
		0,
		0.316916,
		-0.802511,
		-0.505509,
		0,
		0.088276,
		0.555627,
		-0.826732,
		0,
		0.176199,
		-0.495411,
		-0.57583,
		1
	},
	[1.11666666667] = {
		0.953102,
		0.160208,
		0.25677,
		0,
		0.274493,
		-0.81494,
		-0.510418,
		0,
		0.127479,
		0.556962,
		-0.820696,
		0,
		0.186547,
		-0.511251,
		-0.56563,
		1
	},
	[1.13333333333] = {
		0.955862,
		0.132115,
		0.262437,
		0,
		0.254475,
		-0.818734,
		-0.514701,
		0,
		0.146866,
		0.558767,
		-0.816217,
		0,
		0.188232,
		-0.516291,
		-0.562468,
		1
	},
	[1.15] = {
		0.957433,
		0.104676,
		0.269006,
		0,
		0.235813,
		-0.821107,
		-0.519784,
		0,
		0.166474,
		0.561094,
		-0.810839,
		0,
		0.187293,
		-0.519256,
		-0.561185,
		1
	},
	[1.16666666667] = {
		0.957712,
		0.078118,
		0.276922,
		0,
		0.218977,
		-0.822211,
		-0.525374,
		0,
		0.186648,
		0.563796,
		-0.804547,
		0,
		0.183457,
		-0.519977,
		-0.562135,
		1
	},
	[1.1] = {
		0.94922,
		0.188722,
		0.251724,
		0,
		0.295474,
		-0.80956,
		-0.507255,
		0,
		0.108055,
		0.555874,
		-0.824214,
		0,
		0.182459,
		-0.504252,
		-0.570235,
		1
	}
}

return spline_matrices
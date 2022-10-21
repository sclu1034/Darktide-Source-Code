local spline_matrices = {
	[0] = {
		0.902647,
		-0.039241,
		0.42859,
		0,
		-0.019346,
		0.991129,
		0.13149,
		0,
		-0.429948,
		-0.126981,
		0.89388,
		0,
		0.181295,
		0.049088,
		-0.280161,
		1
	},
	[0.0166666666667] = {
		0.916883,
		-0.016891,
		0.398799,
		0,
		-0.047222,
		0.987498,
		0.150392,
		0,
		-0.396353,
		-0.156724,
		0.904622,
		0,
		0.173377,
		0.208028,
		-0.26292,
		1
	},
	[0.0333333333333] = {
		0.963768,
		0.011127,
		0.266508,
		0,
		-0.05681,
		0.984769,
		0.164327,
		0,
		-0.26062,
		-0.173513,
		0.949721,
		0,
		0.135731,
		0.366574,
		-0.236732,
		1
	},
	[0.05] = {
		0.991965,
		0.031644,
		0.122488,
		0,
		-0.053351,
		0.982543,
		0.178224,
		0,
		-0.11471,
		-0.183327,
		0.976336,
		0,
		0.094791,
		0.523707,
		-0.210766,
		1
	},
	[0.0666666666667] = {
		0.997519,
		0.035528,
		0.060767,
		0,
		-0.04674,
		0.979809,
		0.194396,
		0,
		-0.052634,
		-0.196754,
		0.979039,
		0,
		0.063512,
		0.663969,
		-0.187276,
		1
	},
	[0.0833333333333] = {
		0.995604,
		0.043608,
		0.082894,
		0,
		-0.058047,
		0.981831,
		0.180662,
		0,
		-0.07351,
		-0.18468,
		0.980046,
		0,
		0.072628,
		0.670423,
		-0.183018,
		1
	},
	[0.116666666667] = {
		0.994443,
		0.051469,
		0.091838,
		0,
		-0.065826,
		0.984777,
		0.160877,
		0,
		-0.08216,
		-0.166028,
		0.982692,
		0,
		0.075407,
		0.675726,
		-0.174127,
		1
	},
	[0.133333333333] = {
		0.994181,
		0.057771,
		0.090926,
		0,
		-0.070969,
		0.986234,
		0.149352,
		0,
		-0.081047,
		-0.154936,
		0.984594,
		0,
		0.07325,
		0.674802,
		-0.171446,
		1
	},
	[0.15] = {
		0.994227,
		0.06308,
		0.086799,
		0,
		-0.074783,
		0.98747,
		0.138964,
		0,
		-0.076945,
		-0.144653,
		0.986486,
		0,
		0.072328,
		0.672008,
		-0.168232,
		1
	},
	[0.166666666667] = {
		0.994664,
		0.066639,
		0.078757,
		0,
		-0.076526,
		0.988552,
		0.130036,
		0,
		-0.069189,
		-0.13537,
		0.988376,
		0,
		0.072974,
		0.667543,
		-0.164373,
		1
	},
	[0.183333333333] = {
		0.995228,
		0.070476,
		0.067487,
		0,
		-0.078262,
		0.989601,
		0.120683,
		0,
		-0.05828,
		-0.125389,
		0.990394,
		0,
		0.074004,
		0.66145,
		-0.161077,
		1
	},
	[0.1] = {
		0.994557,
		0.048513,
		0.092212,
		0,
		-0.063741,
		0.983356,
		0.170143,
		0,
		-0.082423,
		-0.175095,
		0.981095,
		0,
		0.076586,
		0.6743,
		-0.178284,
		1
	},
	[0.216666666667] = {
		0.996369,
		0.078352,
		0.033328,
		0,
		-0.08136,
		0.991521,
		0.101321,
		0,
		-0.025107,
		-0.103664,
		0.994295,
		0,
		0.077032,
		0.645326,
		-0.156088,
		1
	},
	[0.233333333333] = {
		0.996581,
		0.082075,
		0.009497,
		0,
		-0.082601,
		0.992362,
		0.091621,
		0,
		-0.001904,
		-0.092092,
		0.995749,
		0,
		0.078936,
		0.635768,
		-0.154353,
		1
	},
	[0.25] = {
		0.996153,
		0.085449,
		-0.019436,
		0,
		-0.083586,
		0.993112,
		0.082104,
		0,
		0.026318,
		-0.080164,
		0.996434,
		0,
		0.081047,
		0.625531,
		-0.153091,
		1
	},
	[0.266666666667] = {
		0.994634,
		0.088317,
		-0.053882,
		0,
		-0.084292,
		0.993771,
		0.072897,
		0,
		0.059985,
		-0.067964,
		0.995883,
		0,
		0.083327,
		0.614854,
		-0.152272,
		1
	},
	[0.283333333333] = {
		0.995061,
		0.080967,
		-0.057423,
		0,
		-0.076846,
		0.994535,
		0.07067,
		0,
		0.062831,
		-0.065909,
		0.995846,
		0,
		0.085856,
		0.596747,
		-0.152036,
		1
	},
	[0.2] = {
		0.995843,
		0.074433,
		0.052504,
		0,
		-0.079896,
		0.990597,
		0.111059,
		0,
		-0.043744,
		-0.114792,
		0.992426,
		0,
		0.075373,
		0.653966,
		-0.158322,
		1
	},
	[0.316666666667] = {
		0.998348,
		0.049072,
		0.02988,
		0,
		-0.051392,
		0.995258,
		0.082588,
		0,
		-0.025685,
		-0.083987,
		0.996136,
		0,
		0.094208,
		0.533269,
		-0.154983,
		1
	},
	[0.333333333333] = {
		0.997876,
		0.045148,
		0.046968,
		0,
		-0.049069,
		0.995088,
		0.085982,
		0,
		-0.042856,
		-0.088104,
		0.995189,
		0,
		0.101033,
		0.499198,
		-0.159061,
		1
	},
	[0.35] = {
		0.998645,
		0.051853,
		-0.004316,
		0,
		-0.051294,
		0.995008,
		0.085599,
		0,
		0.008733,
		-0.085262,
		0.99632,
		0,
		0.109594,
		0.471324,
		-0.165784,
		1
	},
	[0.366666666667] = {
		0.991537,
		0.065483,
		-0.112102,
		0,
		-0.055642,
		0.994496,
		0.088775,
		0,
		0.117298,
		-0.081787,
		0.989723,
		0,
		0.120186,
		0.449048,
		-0.177651,
		1
	},
	[0.383333333333] = {
		0.970131,
		0.08274,
		-0.228035,
		0,
		-0.060597,
		0.99289,
		0.102461,
		0,
		0.234891,
		-0.085582,
		0.968247,
		0,
		0.132294,
		0.428358,
		-0.194414,
		1
	},
	[0.3] = {
		0.997829,
		0.063535,
		-0.017353,
		0,
		-0.062037,
		0.995151,
		0.076332,
		0,
		0.022118,
		-0.07509,
		0.996931,
		0,
		0.08925,
		0.567709,
		-0.152797,
		1
	},
	[0.416666666667] = {
		0.898008,
		0.11813,
		-0.423823,
		0,
		-0.061686,
		0.987571,
		0.14456,
		0,
		0.435633,
		-0.103672,
		0.894134,
		0,
		0.155183,
		0.393754,
		-0.229583,
		1
	},
	[0.433333333333] = {
		0.867841,
		0.130762,
		-0.479325,
		0,
		-0.058888,
		0.985016,
		0.162098,
		0,
		0.493339,
		-0.112449,
		0.862538,
		0,
		0.163118,
		0.380659,
		-0.241754,
		1
	},
	[0.45] = {
		0.858714,
		0.136297,
		-0.493997,
		0,
		-0.058154,
		0.983672,
		0.170313,
		0,
		0.509144,
		-0.117523,
		0.85262,
		0,
		0.166835,
		0.370794,
		-0.24631,
		1
	},
	[0.466666666667] = {
		0.86437,
		0.135989,
		-0.484119,
		0,
		-0.058864,
		0.983483,
		0.171163,
		0,
		0.499399,
		-0.119451,
		0.858098,
		0,
		0.167529,
		0.362567,
		-0.245333,
		1
	},
	[0.483333333333] = {
		0.871164,
		0.13299,
		-0.472638,
		0,
		-0.058094,
		0.983776,
		0.169734,
		0,
		0.487543,
		-0.120409,
		0.864756,
		0,
		0.167397,
		0.354203,
		-0.243141,
		1
	},
	[0.4] = {
		0.936235,
		0.101186,
		-0.336491,
		0,
		-0.062904,
		0.990434,
		0.122812,
		0,
		0.345699,
		-0.093814,
		0.933644,
		0,
		0.144439,
		0.409777,
		-0.212785,
		1
	},
	[0.516666666667] = {
		0.887066,
		0.119985,
		-0.445778,
		0,
		-0.052626,
		0.985621,
		0.160567,
		0,
		0.458634,
		-0.118974,
		0.880625,
		0,
		0.165066,
		0.337275,
		-0.236118,
		1
	},
	[0.533333333333] = {
		0.895957,
		0.11127,
		-0.429977,
		0,
		-0.048606,
		0.986859,
		0.154099,
		0,
		0.441473,
		-0.117166,
		0.889592,
		0,
		0.163179,
		0.329131,
		-0.23129,
		1
	},
	[0.55] = {
		0.905201,
		0.101623,
		-0.412654,
		0,
		-0.044012,
		0.988185,
		0.146812,
		0,
		0.422698,
		-0.114732,
		0.898979,
		0,
		0.160984,
		0.321352,
		-0.225809,
		1
	},
	[0.566666666667] = {
		0.914571,
		0.091357,
		-0.393971,
		0,
		-0.039005,
		0.989536,
		0.138914,
		0,
		0.40254,
		-0.11168,
		0.908564,
		0,
		0.158601,
		0.314016,
		-0.219909,
		1
	},
	[0.583333333333] = {
		0.923861,
		0.080783,
		-0.374106,
		0,
		-0.03375,
		0.990858,
		0.130617,
		0,
		0.381238,
		-0.108046,
		0.918141,
		0,
		0.15615,
		0.307198,
		-0.213825,
		1
	},
	[0.5] = {
		0.878773,
		0.127456,
		-0.459906,
		0,
		-0.055912,
		0.984537,
		0.166015,
		0,
		0.473954,
		-0.120175,
		0.872311,
		0,
		0.166527,
		0.345709,
		-0.24006,
		1
	},
	[0.616666666667] = {
		0.941514,
		0.059929,
		-0.331602,
		0,
		-0.02318,
		0.993246,
		0.113688,
		0,
		0.336175,
		-0.099352,
		0.936544,
		0,
		0.151517,
		0.295426,
		-0.202046,
		1
	},
	[0.633333333333] = {
		0.94961,
		0.050231,
		-0.309384,
		0,
		-0.018223,
		0.994253,
		0.105493,
		0,
		0.312905,
		-0.094539,
		0.945068,
		0,
		0.149572,
		0.290625,
		-0.196828,
		1
	},
	[0.65] = {
		0.957089,
		0.041388,
		-0.286825,
		0,
		-0.013731,
		0.995114,
		0.097774,
		0,
		0.28947,
		-0.08964,
		0.952981,
		0,
		0.148033,
		0.28665,
		-0.192378,
		1
	},
	[0.666666666667] = {
		0.963891,
		0.033652,
		-0.264164,
		0,
		-0.009895,
		0.995824,
		0.090755,
		0,
		0.266115,
		-0.084864,
		0.960198,
		0,
		0.147017,
		0.283577,
		-0.188938,
		1
	},
	[0.683333333333] = {
		0.969981,
		0.027259,
		-0.241649,
		0,
		-0.006909,
		0.996385,
		0.084667,
		0,
		0.243083,
		-0.080456,
		0.966663,
		0,
		0.146639,
		0.281483,
		-0.186753,
		1
	},
	[0.6] = {
		0.932891,
		0.070208,
		-0.353248,
		0,
		-0.028417,
		0.992107,
		0.122136,
		0,
		0.359035,
		-0.103901,
		0.927523,
		0,
		0.153749,
		0.300976,
		-0.207791,
		1
	},
	[0.716666666667] = {
		0.979996,
		0.019333,
		-0.198075,
		0,
		-0.004265,
		0.997082,
		0.076217,
		0,
		0.198971,
		-0.073847,
		0.977219,
		0,
		0.148259,
		0.280539,
		-0.187131,
		1
	},
	[0.733333333333] = {
		0.983931,
		0.018052,
		-0.177633,
		0,
		-0.004999,
		0.997271,
		0.073657,
		0,
		0.178477,
		-0.071585,
		0.981337,
		0,
		0.149993,
		0.282265,
		-0.189256,
		1
	},
	[0.75] = {
		0.987211,
		0.018311,
		-0.158362,
		0,
		-0.007039,
		0.997419,
		0.071451,
		0,
		0.159261,
		-0.069422,
		0.984793,
		0,
		0.15175,
		0.285798,
		-0.19155,
		1
	},
	[0.766666666667] = {
		0.989923,
		0.019784,
		-0.140216,
		0,
		-0.01008,
		0.997525,
		0.06958,
		0,
		0.141245,
		-0.067465,
		0.987673,
		0,
		0.153508,
		0.290732,
		-0.193959,
		1
	},
	[0.783333333333] = {
		0.992142,
		0.022143,
		-0.12314,
		0,
		-0.013823,
		0.997588,
		0.06802,
		0,
		0.12435,
		-0.065783,
		0.990055,
		0,
		0.155243,
		0.296657,
		-0.196425,
		1
	},
	[0.7] = {
		0.975347,
		0.022422,
		-0.219534,
		0,
		-0.004967,
		0.996803,
		0.079741,
		0,
		0.22062,
		-0.076685,
		0.972341,
		0,
		0.147016,
		0.280444,
		-0.186068,
		1
	},
	[0.816666666667] = {
		0.995362,
		0.028217,
		-0.09197,
		0,
		-0.022211,
		0.997593,
		0.065687,
		0,
		0.093602,
		-0.063339,
		0.993593,
		0,
		0.158555,
		0.309839,
		-0.201297,
		1
	},
	[0.833333333333] = {
		0.996482,
		0.031287,
		-0.077749,
		0,
		-0.026264,
		0.997552,
		0.064812,
		0,
		0.079587,
		-0.062542,
		0.994864,
		0,
		0.160084,
		0.316274,
		-0.203582,
		1
	},
	[0.85] = {
		0.997349,
		0.033958,
		-0.06435,
		0,
		-0.029831,
		0.997501,
		0.064047,
		0,
		0.066364,
		-0.061958,
		0.99587,
		0,
		0.161495,
		0.322053,
		-0.205684,
		1
	},
	[0.866666666667] = {
		0.998016,
		0.035923,
		-0.051704,
		0,
		-0.032622,
		0.99746,
		0.063316,
		0,
		0.053847,
		-0.061503,
		0.996653,
		0,
		0.162766,
		0.326763,
		-0.207539,
		1
	},
	[0.883333333333] = {
		0.998529,
		0.036878,
		-0.039741,
		0,
		-0.034349,
		0.997451,
		0.062538,
		0,
		0.041946,
		-0.061081,
		0.997251,
		0,
		0.163869,
		0.32999,
		-0.209083,
		1
	},
	[0.8] = {
		0.993935,
		0.025063,
		-0.107079,
		0,
		-0.017965,
		0.997609,
		0.066737,
		0,
		0.108495,
		-0.064409,
		0.992008,
		0,
		0.156934,
		0.303163,
		-0.198891,
		1
	},
	[0.916666666667] = {
		0.999203,
		0.035486,
		-0.018283,
		0,
		-0.034327,
		0.997594,
		0.060227,
		0,
		0.020377,
		-0.059552,
		0.998017,
		0,
		0.165476,
		0.33154,
		-0.211024,
		1
	},
	[0.933333333333] = {
		0.999349,
		0.034616,
		-0.010196,
		0,
		-0.033965,
		0.997721,
		0.058307,
		0,
		0.012191,
		-0.057923,
		0.998247,
		0,
		0.16596,
		0.331723,
		-0.211475,
		1
	},
	[0.95] = {
		0.999414,
		0.033964,
		-0.004257,
		0,
		-0.033671,
		0.997843,
		0.056349,
		0,
		0.006162,
		-0.056173,
		0.998402,
		0,
		0.166268,
		0.33186,
		-0.211689,
		1
	},
	[0.966666666667] = {
		0.999437,
		0.033558,
		-0.000598,
		0,
		-0.033475,
		0.997935,
		0.054827,
		0,
		0.002436,
		-0.054776,
		0.998496,
		0,
		0.166429,
		0.331947,
		-0.211756,
		1
	},
	[0.983333333333] = {
		0.999441,
		0.033418,
		0.000652,
		0,
		-0.033404,
		0.99797,
		0.054214,
		0,
		0.001161,
		-0.054205,
		0.998529,
		0,
		0.166476,
		0.331978,
		-0.211759,
		1
	},
	[0.9] = {
		0.998929,
		0.036526,
		-0.028389,
		0,
		-0.034722,
		0.997495,
		0.061634,
		0,
		0.030569,
		-0.060583,
		0.997695,
		0,
		0.164782,
		0.331318,
		-0.210253,
		1
	}
}

return spline_matrices

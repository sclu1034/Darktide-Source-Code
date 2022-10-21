local spline_matrices = {
	[0] = {
		0.773318,
		-0.632636,
		0.041848,
		0,
		-0.325427,
		-0.452707,
		-0.830153,
		0,
		0.544129,
		0.628354,
		-0.555963,
		0,
		0.643191,
		-0.53082,
		-0.527114,
		1
	},
	{
		0.516655,
		-0.755622,
		-0.40262,
		0,
		-0.725965,
		-0.13731,
		-0.673885,
		0,
		0.453918,
		0.640454,
		-0.619497,
		0,
		0.475227,
		-0.548703,
		-1.461058,
		1
	},
	[0.0166666666667] = {
		0.772689,
		-0.619529,
		-0.13833,
		0,
		-0.349652,
		-0.233506,
		-0.907314,
		0,
		0.529806,
		0.749439,
		-0.397047,
		0,
		0.639941,
		-0.478268,
		-0.544283,
		1
	},
	[0.0333333333333] = {
		0.760509,
		-0.560394,
		-0.327999,
		0,
		-0.378698,
		0.027538,
		-0.925111,
		0,
		0.527459,
		0.827768,
		-0.191277,
		0,
		0.639423,
		-0.411105,
		-0.535004,
		1
	},
	[0.05] = {
		0.738331,
		-0.443276,
		-0.508304,
		0,
		-0.406416,
		0.309039,
		-0.859838,
		0,
		0.538231,
		0.841428,
		0.048018,
		0,
		0.64246,
		-0.333992,
		-0.494495,
		1
	},
	[0.0666666666667] = {
		0.709726,
		-0.265155,
		-0.652673,
		0,
		-0.4261,
		0.57621,
		-0.697439,
		0,
		0.561006,
		0.773095,
		0.295969,
		0,
		0.650064,
		-0.254961,
		-0.419892,
		1
	},
	[0.0833333333333] = {
		0.68034,
		-0.03732,
		-0.731946,
		0,
		-0.432399,
		0.785927,
		-0.441985,
		0,
		0.59175,
		0.617193,
		0.518561,
		0,
		0.663004,
		-0.184467,
		-0.312357,
		1
	},
	[0.116666666667] = {
		0.644837,
		0.446535,
		-0.620316,
		0,
		-0.402214,
		0.888377,
		0.221385,
		0,
		0.64993,
		0.106742,
		0.752461,
		0,
		0.7038,
		-0.10737,
		-0.029856,
		1
	},
	[0.133333333333] = {
		0.646859,
		0.624538,
		-0.437636,
		0,
		-0.375224,
		0.760245,
		0.530316,
		0,
		0.663914,
		-0.178828,
		0.726113,
		0,
		0.728485,
		-0.108844,
		0.119602,
		1
	},
	[0.15] = {
		0.661435,
		0.720309,
		-0.208947,
		0,
		-0.349922,
		0.542796,
		0.763497,
		0,
		0.663369,
		-0.431888,
		0.611076,
		0,
		0.752957,
		-0.131858,
		0.257505,
		1
	},
	[0.166666666667] = {
		0.684267,
		0.728844,
		0.023758,
		0,
		-0.330842,
		0.281243,
		0.900803,
		0,
		0.649863,
		-0.62425,
		0.433578,
		0,
		0.775398,
		-0.166487,
		0.376353,
		1
	},
	[0.183333333333] = {
		0.711523,
		0.662975,
		0.232807,
		0,
		-0.323281,
		0.014695,
		0.946189,
		0,
		0.623878,
		-0.748498,
		0.224783,
		0,
		0.793828,
		-0.203731,
		0.476468,
		1
	},
	[0.1] = {
		0.656833,
		0.212844,
		-0.723372,
		0,
		-0.423483,
		0.897876,
		-0.120339,
		0,
		0.623885,
		0.385378,
		0.679891,
		0,
		0.681283,
		-0.132921,
		-0.178485,
		1
	},
	[0.216666666667] = {
		0.760272,
		0.38509,
		0.523156,
		0,
		-0.353997,
		-0.429657,
		0.830711,
		0,
		0.544677,
		-0.816762,
		-0.190335,
		0,
		0.812921,
		-0.260885,
		0.633069,
		1
	},
	[0.233333333333] = {
		0.775666,
		0.220782,
		0.591267,
		0,
		-0.383625,
		-0.578975,
		0.719458,
		0,
		0.501172,
		-0.784885,
		-0.364394,
		0,
		0.814184,
		-0.272879,
		0.696914,
		1
	},
	[0.25] = {
		0.785679,
		0.066799,
		0.615017,
		0,
		-0.414882,
		-0.68055,
		0.603924,
		0,
		0.458892,
		-0.72965,
		-0.50698,
		0,
		0.811024,
		-0.273249,
		0.75625,
		1
	},
	[0.266666666667] = {
		0.793036,
		-0.064252,
		0.605777,
		0,
		-0.442564,
		-0.744104,
		0.500447,
		0,
		0.418606,
		-0.664967,
		-0.618536,
		0,
		0.804213,
		-0.263957,
		0.813517,
		1
	},
	[0.283333333333] = {
		0.800923,
		-0.165919,
		0.575319,
		0,
		-0.462749,
		-0.781276,
		0.418893,
		0,
		0.379981,
		-0.60173,
		-0.702521,
		0,
		0.794266,
		-0.247653,
		0.869695,
		1
	},
	[0.2] = {
		0.738376,
		0.540469,
		0.403354,
		0,
		-0.332031,
		-0.229245,
		0.914987,
		0,
		0.586989,
		-0.809531,
		0.010184,
		0,
		0.806351,
		-0.237024,
		0.560984,
		1
	},
	[0.316666666667] = {
		0.82849,
		-0.275311,
		0.487656,
		0,
		-0.470052,
		-0.815214,
		0.338345,
		0,
		0.304394,
		-0.509539,
		-0.804807,
		0,
		0.765803,
		-0.203631,
		0.977114,
		1
	},
	[0.333333333333] = {
		0.850728,
		-0.28483,
		0.441739,
		0,
		-0.453206,
		-0.823174,
		0.342037,
		0,
		0.266206,
		-0.491179,
		-0.829384,
		0,
		0.747319,
		-0.179064,
		1.025936,
		1
	},
	[0.35] = {
		0.879257,
		-0.265022,
		0.395816,
		0,
		-0.419869,
		-0.823643,
		0.381211,
		0,
		0.224981,
		-0.501374,
		-0.835469,
		0,
		0.717221,
		-0.128171,
		1.069903,
		1
	},
	[0.366666666667] = {
		0.912147,
		-0.219325,
		0.346242,
		0,
		-0.368036,
		-0.810081,
		0.45642,
		0,
		0.18038,
		-0.543752,
		-0.819632,
		0,
		0.669847,
		-0.034213,
		1.107796,
		1
	},
	[0.383333333333] = {
		0.945186,
		-0.154304,
		0.287775,
		0,
		-0.296666,
		-0.774018,
		0.559362,
		0,
		0.136431,
		-0.614074,
		-0.777367,
		0,
		0.610222,
		0.090493,
		1.137567,
		1
	},
	[0.3] = {
		0.812121,
		-0.23614,
		0.533571,
		0,
		-0.472621,
		-0.802489,
		0.364199,
		0,
		0.342183,
		-0.547951,
		-0.763322,
		0,
		0.781439,
		-0.226884,
		0.924565,
		1
	},
	[0.416666666667] = {
		0.992103,
		0.002682,
		0.125395,
		0,
		-0.099987,
		-0.586677,
		0.803625,
		0,
		0.075722,
		-0.809816,
		-0.581776,
		0,
		0.471005,
		0.386833,
		1.16424,
		1
	},
	[0.433333333333] = {
		0.997033,
		0.074389,
		0.019766,
		0,
		0.012472,
		-0.409543,
		0.912205,
		0,
		0.075953,
		-0.909253,
		-0.409256,
		0,
		0.396301,
		0.53647,
		1.155342,
		1
	},
	[0.45] = {
		0.986743,
		0.064763,
		-0.148807,
		0,
		0.153919,
		-0.082794,
		0.984609,
		0,
		0.051446,
		-0.99446,
		-0.091665,
		0,
		0.350153,
		0.731755,
		1.070743,
		1
	},
	[0.466666666667] = {
		0.954589,
		-0.067582,
		-0.29016,
		0,
		0.293914,
		0.37293,
		0.880078,
		0,
		0.048732,
		-0.925395,
		0.375858,
		0,
		0.344619,
		0.963986,
		0.86863,
		1
	},
	[0.483333333333] = {
		0.943136,
		-0.136311,
		-0.303172,
		0,
		0.290978,
		0.77949,
		0.554731,
		0,
		0.160703,
		-0.611404,
		0.774829,
		0,
		0.298321,
		1.184009,
		0.574775,
		1
	},
	[0.4] = {
		0.973517,
		-0.077322,
		0.215143,
		0,
		-0.206121,
		-0.703928,
		0.679705,
		0,
		0.098889,
		-0.70605,
		-0.701224,
		0,
		0.542898,
		0.234474,
		1.15716,
		1
	},
	[0.516666666667] = {
		0.982247,
		-0.016909,
		-0.18683,
		0,
		-0.087373,
		0.840074,
		-0.535389,
		0,
		0.166004,
		0.542208,
		0.823682,
		0,
		0.152265,
		1.52473,
		-0.241882,
		1
	},
	[0.533333333333] = {
		0.957373,
		0.106309,
		-0.268581,
		0,
		-0.288604,
		0.390786,
		-0.874067,
		0,
		0.012037,
		0.914322,
		0.404809,
		0,
		0.082143,
		1.488341,
		-0.612479,
		1
	},
	[0.55] = {
		0.99585,
		0.074449,
		-0.052343,
		0,
		-0.002196,
		-0.555319,
		-0.831635,
		0,
		-0.090982,
		0.828298,
		-0.552851,
		0,
		-0.074125,
		1.047815,
		-1.050077,
		1
	},
	[0.566666666667] = {
		0.963511,
		0.170566,
		-0.206284,
		0,
		0.07753,
		-0.915476,
		-0.394833,
		0,
		-0.256193,
		0.364433,
		-0.895295,
		0,
		-0.176221,
		0.605012,
		-1.334693,
		1
	},
	[0.583333333333] = {
		0.958779,
		-0.035564,
		-0.281918,
		0,
		0.004848,
		-0.989945,
		0.141369,
		0,
		-0.284111,
		-0.136908,
		-0.948966,
		0,
		-0.235323,
		0.265376,
		-1.455277,
		1
	},
	[0.5] = {
		0.959622,
		-0.107801,
		-0.259815,
		0,
		0.119012,
		0.992505,
		0.027762,
		0,
		0.254875,
		-0.057562,
		0.965259,
		0,
		0.221946,
		1.3949,
		0.185135,
		1
	},
	[0.616666666667] = {
		0.974527,
		0.138222,
		-0.176611,
		0,
		0.204727,
		-0.869795,
		0.448937,
		0,
		-0.091562,
		-0.473658,
		-0.875936,
		0,
		-0.143481,
		-0.005898,
		-1.468425,
		1
	},
	[0.633333333333] = {
		0.970084,
		0.10988,
		-0.216479,
		0,
		0.207856,
		-0.836642,
		0.506781,
		0,
		-0.125431,
		-0.536617,
		-0.834452,
		0,
		-0.067885,
		-0.127297,
		-1.487623,
		1
	},
	[0.65] = {
		0.960191,
		0.040883,
		-0.276336,
		0,
		0.187731,
		-0.82698,
		0.529963,
		0,
		-0.206858,
		-0.560742,
		-0.801734,
		0,
		0.014672,
		-0.231825,
		-1.494911,
		1
	},
	[0.666666666667] = {
		0.940184,
		-0.048721,
		-0.337165,
		0,
		0.147022,
		-0.834776,
		0.530598,
		0,
		-0.307308,
		-0.54843,
		-0.77768,
		0,
		0.090232,
		-0.310889,
		-1.494666,
		1
	},
	[0.683333333333] = {
		0.914133,
		-0.139625,
		-0.380612,
		0,
		0.085308,
		-0.851557,
		0.517275,
		0,
		-0.396337,
		-0.505327,
		-0.766526,
		0,
		0.15194,
		-0.361571,
		-1.490308,
		1
	},
	[0.6] = {
		0.977809,
		0.104774,
		-0.181419,
		0,
		0.162388,
		-0.926172,
		0.340347,
		0,
		-0.132366,
		-0.362254,
		-0.922633,
		0,
		-0.204589,
		0.116665,
		-1.456566,
		1
	},
	[0.716666666667] = {
		0.889371,
		-0.286631,
		-0.356176,
		0,
		-0.105842,
		-0.886983,
		0.44951,
		0,
		-0.444765,
		-0.362083,
		-0.819194,
		0,
		0.237805,
		-0.387915,
		-1.479133,
		1
	},
	[0.733333333333] = {
		0.875821,
		-0.371074,
		-0.308613,
		0,
		-0.251226,
		-0.896485,
		0.364966,
		0,
		-0.412096,
		-0.242113,
		-0.878384,
		0,
		0.278193,
		-0.390792,
		-1.472194,
		1
	},
	[0.75] = {
		0.847094,
		-0.466114,
		-0.255283,
		0,
		-0.411867,
		-0.879363,
		0.238927,
		0,
		-0.335853,
		-0.097251,
		-0.93688,
		0,
		0.316102,
		-0.387085,
		-1.466383,
		1
	},
	[0.766666666667] = {
		0.798259,
		-0.565391,
		-0.207643,
		0,
		-0.562619,
		-0.823021,
		0.078079,
		0,
		-0.21504,
		0.054496,
		-0.975084,
		0,
		0.35072,
		-0.374198,
		-1.463928,
		1
	},
	[0.783333333333] = {
		0.730442,
		-0.660155,
		-0.175071,
		0,
		-0.680328,
		-0.725845,
		-0.101501,
		0,
		-0.060069,
		0.193246,
		-0.97931,
		0,
		0.382208,
		-0.352019,
		-1.466702,
		1
	},
	[0.7] = {
		0.896491,
		-0.215541,
		-0.387099,
		0,
		0.004602,
		-0.869114,
		0.49459,
		0,
		-0.443037,
		-0.445177,
		-0.778162,
		0,
		0.197859,
		-0.382469,
		-1.485043,
		1
	},
	[0.816666666667] = {
		0.565548,
		-0.806045,
		-0.17449,
		0,
		-0.776991,
		-0.44983,
		-0.440384,
		0,
		0.276478,
		0.384636,
		-0.88069,
		0,
		0.435726,
		-0.311844,
		-1.493705,
		1
	},
	[0.833333333333] = {
		0.484836,
		-0.850609,
		-0.203466,
		0,
		-0.763515,
		-0.29817,
		-0.572835,
		0,
		0.426591,
		0.43308,
		-0.794016,
		0,
		0.450727,
		-0.300168,
		-1.512005,
		1
	},
	[0.85] = {
		0.487351,
		-0.845793,
		-0.217078,
		0,
		-0.756742,
		-0.285049,
		-0.588293,
		0,
		0.435696,
		0.450977,
		-0.778966,
		0,
		0.456534,
		-0.32396,
		-1.509454,
		1
	},
	[0.866666666667] = {
		0.489924,
		-0.84007,
		-0.232932,
		0,
		-0.749985,
		-0.26995,
		-0.603861,
		0,
		0.444406,
		0.470542,
		-0.762295,
		0,
		0.462211,
		-0.352397,
		-1.505298,
		1
	},
	[0.883333333333] = {
		0.492652,
		-0.833387,
		-0.250518,
		0,
		-0.74348,
		-0.253474,
		-0.61886,
		0,
		0.452251,
		0.491138,
		-0.744482,
		0,
		0.467196,
		-0.384341,
		-1.499668,
		1
	},
	[0.8] = {
		0.649911,
		-0.742162,
		-0.163739,
		0,
		-0.752002,
		-0.596768,
		-0.279931,
		0,
		0.110039,
		0.305062,
		-0.945954,
		0,
		0.411032,
		-0.32892,
		-1.477114,
		1
	},
	[0.916666666667] = {
		0.498515,
		-0.816937,
		-0.289995,
		0,
		-0.732285,
		-0.217817,
		-0.645225,
		0,
		0.463942,
		0.534013,
		-0.706815,
		0,
		0.473874,
		-0.451771,
		-1.485524,
		1
	},
	[0.933333333333] = {
		0.501669,
		-0.807062,
		-0.311416,
		0,
		-0.728108,
		-0.199552,
		-0.655773,
		0,
		0.467105,
		0.555725,
		-0.687737,
		0,
		0.475473,
		-0.483507,
		-1.478056,
		1
	},
	[0.95] = {
		0.505013,
		-0.796023,
		-0.333631,
		0,
		-0.725196,
		-0.181728,
		-0.664128,
		0,
		0.468031,
		0.577341,
		-0.669048,
		0,
		0.47613,
		-0.511235,
		-1.471164,
		1
	},
	[0.966666666667] = {
		0.508592,
		-0.783783,
		-0.356395,
		0,
		-0.723758,
		-0.164966,
		-0.670045,
		0,
		0.466377,
		0.598724,
		-0.65117,
		0,
		0.476124,
		-0.532813,
		-1.465547,
		1
	},
	[0.983333333333] = {
		0.512458,
		-0.770319,
		-0.379467,
		0,
		-0.723969,
		-0.149929,
		-0.673342,
		0,
		0.461796,
		0.619782,
		-0.63452,
		0,
		0.475743,
		-0.546034,
		-1.461937,
		1
	},
	[0.9] = {
		0.495516,
		-0.825694,
		-0.269616,
		0,
		-0.737493,
		-0.235957,
		-0.632795,
		0,
		0.458877,
		0.512399,
		-0.725864,
		0,
		0.471132,
		-0.418072,
		-1.492919,
		1
	}
}

return spline_matrices
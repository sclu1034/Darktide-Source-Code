local spline_matrices = {
	[0] = {
		0.715133,
		-0.461744,
		-0.524763,
		0,
		-0.656601,
		-0.186307,
		-0.730865,
		0,
		0.239706,
		0.867226,
		-0.436417,
		0,
		-0.136399,
		-0.102284,
		-0.665174,
		1
	},
	{
		0.953087,
		-0.302213,
		-0.017094,
		0,
		-0.286196,
		-0.881305,
		-0.376023,
		0,
		0.098574,
		0.363275,
		-0.926452,
		0,
		0.261222,
		-0.4892,
		-0.525998,
		1
	},
	[0.0166666666667] = {
		0.72088,
		-0.576592,
		-0.384542,
		0,
		-0.628222,
		-0.309309,
		-0.713908,
		0,
		0.292691,
		0.75622,
		-0.585203,
		0,
		-0.148467,
		-0.090625,
		-0.634685,
		1
	},
	[0.0333333333333] = {
		0.719737,
		-0.666304,
		-0.194978,
		0,
		-0.597128,
		-0.450873,
		-0.66344,
		0,
		0.354142,
		0.593929,
		-0.722379,
		0,
		-0.16255,
		-0.078896,
		-0.605144,
		1
	},
	[0.05] = {
		0.703758,
		-0.709409,
		0.038258,
		0,
		-0.569593,
		-0.595601,
		-0.566412,
		0,
		0.424604,
		0.376825,
		-0.823234,
		0,
		-0.178106,
		-0.065159,
		-0.576717,
		1
	},
	[0.0666666666667] = {
		0.667024,
		-0.685571,
		0.291669,
		0,
		-0.554102,
		-0.718189,
		-0.420922,
		0,
		0.498046,
		0.119151,
		-0.858925,
		0,
		-0.194287,
		-0.048104,
		-0.550292,
		1
	},
	[0.0833333333333] = {
		0.610178,
		-0.591956,
		0.526565,
		0,
		-0.557841,
		-0.792958,
		-0.245011,
		0,
		0.56258,
		-0.14424,
		-0.814063,
		0,
		-0.20985,
		-0.027588,
		-0.526813,
		1
	},
	[0.116666666667] = {
		0.473331,
		-0.310958,
		0.824174,
		0,
		-0.621716,
		-0.780746,
		0.062483,
		0,
		0.624041,
		-0.541977,
		-0.562879,
		0,
		-0.233244,
		0.020669,
		-0.487003,
		1
	},
	[0.133333333333] = {
		0.412455,
		-0.204318,
		0.887769,
		0,
		-0.668954,
		-0.729434,
		0.142917,
		0,
		0.61837,
		-0.652824,
		-0.437538,
		0,
		-0.238624,
		0.047938,
		-0.466821,
		1
	},
	[0.15] = {
		0.360228,
		-0.159664,
		0.919099,
		0,
		-0.717939,
		-0.676545,
		0.163858,
		0,
		0.59565,
		-0.718883,
		-0.358339,
		0,
		-0.23864,
		0.0786,
		-0.443351,
		1
	},
	[0.166666666667] = {
		0.30793,
		-0.213009,
		0.927257,
		0,
		-0.750484,
		-0.653413,
		0.099124,
		0,
		0.584768,
		-0.726415,
		-0.361065,
		0,
		-0.231674,
		0.107668,
		-0.417953,
		1
	},
	[0.183333333333] = {
		0.249426,
		-0.353108,
		0.901721,
		0,
		-0.765212,
		-0.642538,
		-0.039948,
		0,
		0.593496,
		-0.680043,
		-0.430468,
		0,
		-0.218211,
		0.135404,
		-0.390817,
		1
	},
	[0.1] = {
		0.541781,
		-0.453147,
		0.707906,
		0,
		-0.582124,
		-0.809828,
		-0.072873,
		0,
		0.606305,
		-0.372608,
		-0.702537,
		0,
		-0.223298,
		-0.004423,
		-0.506221,
		1
	},
	[0.216666666667] = {
		0.097168,
		-0.668791,
		0.737073,
		0,
		-0.829938,
		-0.463201,
		-0.310881,
		0,
		0.549328,
		-0.581517,
		-0.600063,
		0,
		-0.179573,
		0.220195,
		-0.313059,
		1
	},
	[0.233333333333] = {
		-0.036122,
		-0.743515,
		0.667743,
		0,
		-0.91278,
		-0.247481,
		-0.324941,
		0,
		0.406852,
		-0.62124,
		-0.669725,
		0,
		-0.154237,
		0.291575,
		-0.250756,
		1
	},
	[0.25] = {
		-0.255182,
		-0.641828,
		0.723145,
		0,
		-0.966892,
		0.168326,
		-0.191796,
		0,
		0.001376,
		-0.748146,
		-0.663532,
		0,
		-0.117063,
		0.394303,
		-0.158266,
		1
	},
	[0.266666666667] = {
		-0.394369,
		-0.457891,
		0.796749,
		0,
		-0.744114,
		0.667873,
		0.01551,
		0,
		-0.539229,
		-0.586755,
		-0.604111,
		0,
		-0.026725,
		0.517503,
		-0.062563,
		1
	},
	[0.283333333333] = {
		-0.501228,
		-0.325632,
		0.801707,
		0,
		0.187479,
		0.863618,
		0.46799,
		0,
		-0.844762,
		0.384873,
		-0.37182,
		0,
		0.166474,
		0.558652,
		0.016706,
		1
	},
	[0.2] = {
		0.183801,
		-0.523164,
		0.832175,
		0,
		-0.783876,
		-0.588823,
		-0.197043,
		0,
		0.59309,
		-0.616105,
		-0.518322,
		0,
		-0.200358,
		0.17039,
		-0.357761,
		1
	},
	[0.316666666667] = {
		-0.477825,
		-0.222788,
		0.849734,
		0,
		0.878423,
		-0.112905,
		0.464355,
		0,
		-0.007514,
		0.968306,
		0.249651,
		0,
		0.367113,
		0.323502,
		-0.001663,
		1
	},
	[0.333333333333] = {
		-0.516306,
		-0.136983,
		0.845378,
		0,
		0.803228,
		-0.419877,
		0.422527,
		0,
		0.297075,
		0.897184,
		0.326814,
		0,
		0.459937,
		0.20439,
		-0.032624,
		1
	},
	[0.35] = {
		-0.530381,
		0.013608,
		0.84765,
		0,
		0.555814,
		-0.749406,
		0.359808,
		0,
		0.64013,
		0.661971,
		0.389907,
		0,
		0.548915,
		0.072223,
		-0.068357,
		1
	},
	[0.366666666667] = {
		-0.468261,
		0.171727,
		0.866742,
		0,
		0.167022,
		-0.946045,
		0.277674,
		0,
		0.867661,
		0.274789,
		0.414313,
		0,
		0.570999,
		-0.055637,
		-0.143875,
		1
	},
	[0.383333333333] = {
		-0.354298,
		0.267755,
		0.89598,
		0,
		-0.196972,
		-0.958003,
		0.208402,
		0,
		0.914153,
		-0.102647,
		0.392159,
		0,
		0.556344,
		-0.128125,
		-0.217209,
		1
	},
	[0.3] = {
		-0.485016,
		-0.214458,
		0.847801,
		0,
		0.853608,
		0.094568,
		0.51226,
		0,
		-0.190033,
		0.972144,
		0.137196,
		0,
		0.277075,
		0.420517,
		0.018951,
		1
	},
	[0.416666666667] = {
		-0.181384,
		0.277493,
		0.943449,
		0,
		-0.52628,
		-0.837815,
		0.145243,
		0,
		0.83074,
		-0.470174,
		0.298005,
		0,
		0.515908,
		-0.176548,
		-0.29219,
		1
	},
	[0.433333333333] = {
		-0.116266,
		0.252223,
		0.960659,
		0,
		-0.608612,
		-0.782449,
		0.131775,
		0,
		0.784904,
		-0.569347,
		0.244479,
		0,
		0.497907,
		-0.188554,
		-0.312485,
		1
	},
	[0.45] = {
		-0.05835,
		0.219197,
		0.973934,
		0,
		-0.667346,
		-0.734141,
		0.125246,
		0,
		0.742459,
		-0.642643,
		0.189117,
		0,
		0.48169,
		-0.198357,
		-0.327037,
		1
	},
	[0.466666666667] = {
		-0.006085,
		0.181091,
		0.983447,
		0,
		-0.708192,
		-0.695114,
		0.123615,
		0,
		0.705994,
		-0.695717,
		0.132477,
		0,
		0.467298,
		-0.207423,
		-0.337183,
		1
	},
	[0.483333333333] = {
		0.042086,
		0.139541,
		0.989321,
		0,
		-0.735331,
		-0.666038,
		0.125224,
		0,
		0.6764,
		-0.732749,
		0.074578,
		0,
		0.454635,
		-0.216602,
		-0.343993,
		1
	},
	[0.4] = {
		-0.254758,
		0.29088,
		0.922218,
		0,
		-0.41328,
		-0.894951,
		0.168113,
		0,
		0.874242,
		-0.338306,
		0.348211,
		0,
		0.535252,
		-0.160021,
		-0.264557,
		1
	},
	[0.516666666667] = {
		0.131643,
		0.0498,
		0.990045,
		0,
		-0.759434,
		-0.636842,
		0.133013,
		0,
		0.637126,
		-0.769384,
		-0.046016,
		0,
		0.433923,
		-0.237071,
		-0.350736,
		1
	},
	[0.533333333333] = {
		0.175308,
		0.002815,
		0.984509,
		0,
		-0.759805,
		-0.635528,
		0.137112,
		0,
		0.62607,
		-0.772072,
		-0.109274,
		0,
		0.425607,
		-0.248785,
		-0.351799,
		1
	},
	[0.55] = {
		0.219448,
		-0.044936,
		0.974588,
		0,
		-0.753729,
		-0.642075,
		0.140113,
		0,
		0.619463,
		-0.765323,
		-0.174772,
		0,
		0.418507,
		-0.261572,
		-0.351891,
		1
	},
	[0.566666666667] = {
		0.264765,
		-0.092939,
		0.959824,
		0,
		-0.741767,
		-0.655639,
		0.14113,
		0,
		0.616182,
		-0.749332,
		-0.242529,
		0,
		0.412488,
		-0.275377,
		-0.351371,
		1
	},
	[0.583333333333] = {
		0.311782,
		-0.140577,
		0.939697,
		0,
		-0.72428,
		-0.675291,
		0.139286,
		0,
		0.614989,
		-0.72403,
		-0.312361,
		0,
		0.407455,
		-0.290099,
		-0.350574,
		1
	},
	[0.5] = {
		0.087584,
		0.095549,
		0.991564,
		0,
		-0.751731,
		-0.646784,
		0.128725,
		0,
		0.653628,
		-0.756664,
		0.015179,
		0,
		0.443558,
		-0.22639,
		-0.348299,
		1
	},
	[0.616666666667] = {
		0.412019,
		-0.231582,
		0.881255,
		0,
		-0.673802,
		-0.728503,
		0.123586,
		0,
		0.613377,
		-0.644711,
		-0.456198,
		0,
		0.400292,
		-0.321769,
		-0.34957,
		1
	},
	[0.633333333333] = {
		0.465213,
		-0.272977,
		0.842057,
		0,
		-0.641451,
		-0.759499,
		0.10817,
		0,
		0.610014,
		-0.590461,
		-0.52843,
		0,
		0.397957,
		-0.338305,
		-0.350193,
		1
	},
	[0.65] = {
		0.519997,
		-0.31012,
		0.795882,
		0,
		-0.605021,
		-0.791453,
		0.086902,
		0,
		0.602953,
		-0.526714,
		-0.599182,
		0,
		0.396171,
		-0.354947,
		-0.352206,
		1
	},
	[0.666666666667] = {
		0.575671,
		-0.341834,
		0.7428,
		0,
		-0.565289,
		-0.822746,
		0.059474,
		0,
		0.590806,
		-0.454134,
		-0.666866,
		0,
		0.394604,
		-0.37138,
		-0.356123,
		1
	},
	[0.683333333333] = {
		0.631271,
		-0.367041,
		0.683212,
		0,
		-0.523301,
		-0.851753,
		0.025931,
		0,
		0.57241,
		-0.373895,
		-0.72976,
		0,
		0.392826,
		-0.387276,
		-0.362444,
		1
	},
	[0.6] = {
		0.360829,
		-0.187096,
		0.913672,
		0,
		-0.701534,
		-0.699979,
		0.133713,
		0,
		0.614534,
		-0.68922,
		-0.383827,
		0,
		0.40341,
		-0.305622,
		-0.349844,
		1
	},
	[0.716666666667] = {
		0.737433,
		-0.394953,
		0.54791,
		0,
		-0.437998,
		-0.897154,
		-0.0572,
		0,
		0.514151,
		-0.197802,
		-0.834579,
		0,
		0.38641,
		-0.416222,
		-0.383803,
		1
	},
	[0.733333333333] = {
		0.785422,
		-0.397234,
		0.474676,
		0,
		-0.397822,
		-0.911489,
		-0.104528,
		0,
		0.474184,
		-0.106738,
		-0.873931,
		0,
		0.380483,
		-0.428795,
		-0.399091,
		1
	},
	[0.75] = {
		0.828441,
		-0.392334,
		0.399698,
		0,
		-0.361447,
		-0.919661,
		-0.153557,
		0,
		0.427833,
		-0.017257,
		-0.903693,
		0,
		0.371894,
		-0.439946,
		-0.417109,
		1
	},
	[0.766666666667] = {
		0.865592,
		-0.381388,
		0.324489,
		0,
		-0.330338,
		-0.921912,
		-0.202374,
		0,
		0.376333,
		0.067982,
		-0.923987,
		0,
		0.360177,
		-0.449727,
		-0.437137,
		1
	},
	[0.783333333333] = {
		0.896292,
		-0.366,
		0.25041,
		0,
		-0.305708,
		-0.918994,
		-0.248982,
		0,
		0.321253,
		0.146608,
		-0.935576,
		0,
		0.345153,
		-0.458338,
		-0.45812,
		1
	},
	[0.7] = {
		0.685621,
		-0.3849,
		0.61788,
		0,
		-0.480366,
		-0.876968,
		-0.013265,
		0,
		0.546967,
		-0.287713,
		-0.78616,
		0,
		0.390302,
		-0.402315,
		-0.371586,
		1
	},
	[0.816666666667] = {
		0.937612,
		-0.329924,
		0.109704,
		0,
		-0.279202,
		-0.902503,
		-0.327924,
		0,
		0.207198,
		0.276836,
		-0.938312,
		0,
		0.3064,
		-0.473477,
		-0.497776,
		1
	},
	[0.833333333333] = {
		0.948503,
		-0.313653,
		0.044311,
		0,
		-0.278229,
		-0.891785,
		-0.356803,
		0,
		0.151428,
		0.3261,
		-0.933128,
		0,
		0.284195,
		-0.480869,
		-0.513939,
		1
	},
	[0.85] = {
		0.953287,
		-0.301565,
		-0.017403,
		0,
		-0.285652,
		-0.881252,
		-0.376561,
		0,
		0.098221,
		0.363942,
		-0.926228,
		0,
		0.261486,
		-0.488685,
		-0.526346,
		1
	},
	[0.866666666667] = {
		0.953088,
		-0.302191,
		-0.017436,
		0,
		-0.286225,
		-0.880994,
		-0.376728,
		0,
		0.098483,
		0.364046,
		-0.92616,
		0,
		0.261175,
		-0.488761,
		-0.526429,
		1
	},
	[0.883333333333] = {
		0.95294,
		-0.302656,
		-0.017452,
		0,
		-0.286649,
		-0.880811,
		-0.376834,
		0,
		0.098679,
		0.364103,
		-0.926116,
		0,
		0.260946,
		-0.488829,
		-0.52648,
		1
	},
	[0.8] = {
		0.920287,
		-0.348123,
		0.178557,
		0,
		-0.288466,
		-0.912059,
		-0.291435,
		0,
		0.26431,
		0.216696,
		-0.939778,
		0,
		0.327026,
		-0.466115,
		-0.478775,
		1
	},
	[0.916666666667] = {
		0.952816,
		-0.303047,
		-0.017422,
		0,
		-0.286998,
		-0.880693,
		-0.376844,
		0,
		0.098858,
		0.364063,
		-0.926113,
		0,
		0.260763,
		-0.488935,
		-0.526472,
		1
	},
	[0.933333333333] = {
		0.952831,
		-0.303003,
		-0.017377,
		0,
		-0.286951,
		-0.880747,
		-0.376753,
		0,
		0.098852,
		0.363969,
		-0.92615,
		0,
		0.260793,
		-0.488979,
		-0.526416,
		1
	},
	[0.95] = {
		0.952871,
		-0.30288,
		-0.017318,
		0,
		-0.286831,
		-0.880846,
		-0.376614,
		0,
		0.098814,
		0.363832,
		-0.926208,
		0,
		0.260863,
		-0.48903,
		-0.526334,
		1
	},
	[0.966666666667] = {
		0.952931,
		-0.302696,
		-0.017249,
		0,
		-0.286654,
		-0.880979,
		-0.376437,
		0,
		0.09875,
		0.363663,
		-0.926281,
		0,
		0.260964,
		-0.489085,
		-0.526233,
		1
	},
	[0.983333333333] = {
		0.953005,
		-0.302467,
		-0.017173,
		0,
		-0.286437,
		-0.881135,
		-0.376236,
		0,
		0.098668,
		0.363474,
		-0.926364,
		0,
		0.261086,
		-0.489143,
		-0.526118,
		1
	},
	[0.9] = {
		0.952848,
		-0.302946,
		-0.017448,
		0,
		-0.286912,
		-0.880709,
		-0.376874,
		0,
		0.098806,
		0.364109,
		-0.9261,
		0,
		0.260806,
		-0.488888,
		-0.526494,
		1
	},
	[1.01666666667] = {
		0.953172,
		-0.301949,
		-0.017017,
		0,
		-0.285946,
		-0.881477,
		-0.375809,
		0,
		0.098475,
		0.363077,
		-0.926541,
		0,
		0.261361,
		-0.489255,
		-0.525877,
		1
	},
	[1.03333333333] = {
		0.953254,
		-0.301694,
		-0.016945,
		0,
		-0.285706,
		-0.881641,
		-0.375607,
		0,
		0.098379,
		0.36289,
		-0.926624,
		0,
		0.261496,
		-0.489305,
		-0.525764,
		1
	},
	[1.05] = {
		0.953328,
		-0.301465,
		-0.016882,
		0,
		-0.285491,
		-0.881787,
		-0.375428,
		0,
		0.098292,
		0.362726,
		-0.926697,
		0,
		0.261616,
		-0.489348,
		-0.525664,
		1
	},
	[1.06666666667] = {
		0.953387,
		-0.30128,
		-0.016833,
		0,
		-0.285316,
		-0.881904,
		-0.375286,
		0,
		0.098221,
		0.362595,
		-0.926756,
		0,
		0.261713,
		-0.489382,
		-0.525585,
		1
	},
	[1.08333333333] = {
		0.953427,
		-0.301156,
		-0.0168,
		0,
		-0.2852,
		-0.881982,
		-0.375191,
		0,
		0.098174,
		0.362509,
		-0.926795,
		0,
		0.261777,
		-0.489403,
		-0.525532,
		1
	},
	[1.1] = {
		0.953441,
		-0.30111,
		-0.016789,
		0,
		-0.285157,
		-0.88201,
		-0.375157,
		0,
		0.098156,
		0.362478,
		-0.926809,
		0,
		0.261801,
		-0.489411,
		-0.525514,
		1
	}
}

return spline_matrices

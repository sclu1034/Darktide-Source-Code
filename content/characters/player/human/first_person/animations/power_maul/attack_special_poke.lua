local spline_matrices = {
	[0] = {
		-0.882549,
		-0.376657,
		0.28149,
		0,
		0.419423,
		-0.90121,
		0.109112,
		0,
		0.212583,
		0.21436,
		0.953341,
		0,
		0.252575,
		0.489062,
		-0.296044,
		1
	},
	{
		-0.902415,
		-0.051284,
		-0.427806,
		0,
		-0.377844,
		-0.382998,
		0.842939,
		0,
		-0.207078,
		0.922324,
		0.326246,
		0,
		0.185544,
		0.487426,
		-0.327041,
		1
	},
	{
		-0.89015,
		-0.374057,
		0.260222,
		0,
		0.436555,
		-0.863733,
		0.251763,
		0,
		0.130588,
		0.337708,
		0.932148,
		0,
		0.246441,
		0.479085,
		-0.306847,
		1
	},
	[0.0333333333333] = {
		-0.842037,
		-0.388611,
		0.374107,
		0,
		0.463735,
		-0.875776,
		0.134042,
		0,
		0.275544,
		0.286355,
		0.917647,
		0,
		0.19505,
		0.483021,
		-0.277718,
		1
	},
	[0.0666666666667] = {
		-0.788901,
		-0.401407,
		0.465305,
		0,
		0.522019,
		-0.837257,
		0.162776,
		0,
		0.32424,
		0.371312,
		0.870055,
		0,
		0.137304,
		0.477544,
		-0.257754,
		1
	},
	[0.133333333333] = {
		-0.684895,
		-0.368524,
		0.628576,
		0,
		0.692327,
		-0.59808,
		0.403713,
		0,
		0.227161,
		0.711682,
		0.664761,
		0,
		0.05177,
		0.415757,
		-0.247183,
		1
	},
	[0.166666666667] = {
		-0.657204,
		-0.307383,
		0.688185,
		0,
		0.750374,
		-0.352682,
		0.559065,
		0,
		0.070864,
		0.883816,
		0.462437,
		0,
		0.024025,
		0.35775,
		-0.264532,
		1
	},
	[0.1] = {
		-0.732308,
		-0.402143,
		0.54955,
		0,
		0.600677,
		-0.761638,
		0.243094,
		0,
		0.3208,
		0.508122,
		0.799312,
		0,
		0.088578,
		0.460932,
		-0.244539,
		1
	},
	[0.233333333333] = {
		-0.619428,
		-0.259551,
		0.740906,
		0,
		0.772647,
		-0.034438,
		0.633901,
		0,
		-0.139015,
		0.965115,
		0.221873,
		0,
		-0.008569,
		0.330042,
		-0.297048,
		1
	},
	[0.266666666667] = {
		-0.579713,
		-0.289358,
		0.761712,
		0,
		0.796218,
		-0.002553,
		0.605005,
		0,
		-0.173119,
		0.957217,
		0.231872,
		0,
		-0.015792,
		0.331507,
		-0.305266,
		1
	},
	[0.2] = {
		-0.646214,
		-0.261304,
		0.717027,
		0,
		0.760447,
		-0.141381,
		0.633824,
		0,
		-0.064247,
		0.954846,
		0.29007,
		0,
		0.004365,
		0.328894,
		-0.284077,
		1
	},
	[0.333333333333] = {
		-0.626018,
		-0.351023,
		0.696336,
		0,
		0.756231,
		-0.055358,
		0.651958,
		0,
		-0.190305,
		0.934729,
		0.30011,
		0,
		-0.020486,
		0.334527,
		-0.316224,
		1
	},
	[0.366666666667] = {
		-0.807411,
		-0.329796,
		0.489205,
		0,
		0.556803,
		-0.151775,
		0.816661,
		0,
		-0.195082,
		0.931772,
		0.306177,
		0,
		-0.015091,
		0.350321,
		-0.307229,
		1
	},
	[0.3] = {
		-0.56782,
		-0.328974,
		0.754557,
		0,
		0.802728,
		-0.018364,
		0.596063,
		0,
		-0.182232,
		0.944161,
		0.274504,
		0,
		-0.019148,
		0.332955,
		-0.310879,
		1
	},
	[0.433333333333] = {
		-0.958903,
		-0.216718,
		0.183138,
		0,
		0.232069,
		-0.227681,
		0.945677,
		0,
		-0.163248,
		0.949313,
		0.268617,
		0,
		0.011338,
		0.431222,
		-0.268153,
		1
	},
	[0.466666666667] = {
		-0.982115,
		-0.158223,
		0.102058,
		0,
		0.133404,
		-0.202249,
		0.970206,
		0,
		-0.132867,
		0.966468,
		0.219739,
		0,
		0.024526,
		0.501497,
		-0.253242,
		1
	},
	[0.4] = {
		-0.936869,
		-0.262414,
		0.231118,
		0,
		0.294783,
		-0.237162,
		0.925666,
		0,
		-0.188095,
		0.935357,
		0.299545,
		0,
		-0.003094,
		0.386458,
		-0.284962,
		1
	},
	[0.533333333333] = {
		-0.791775,
		-0.0086,
		-0.610752,
		0,
		-0.601337,
		-0.164473,
		0.781884,
		0,
		-0.107177,
		0.986344,
		0.125054,
		0,
		0.05191,
		0.747372,
		-0.180231,
		1
	},
	[0.566666666667] = {
		-0.680287,
		0.030515,
		-0.73231,
		0,
		-0.729665,
		-0.122626,
		0.67272,
		0,
		-0.069272,
		0.991984,
		0.105687,
		0,
		0.078317,
		0.738442,
		-0.151307,
		1
	},
	[0.5] = {
		-0.986119,
		-0.046219,
		-0.159477,
		0,
		-0.147061,
		-0.20279,
		0.968116,
		0,
		-0.077086,
		0.978131,
		0.193178,
		0,
		0.032014,
		0.670575,
		-0.212828,
		1
	},
	[0.633333333333] = {
		-0.678666,
		0.055312,
		-0.732361,
		0,
		-0.728482,
		-0.177527,
		0.661663,
		0,
		-0.093416,
		0.98256,
		0.160776,
		0,
		0.077183,
		0.726106,
		-0.124129,
		1
	},
	[0.666666666667] = {
		-0.719343,
		0.05205,
		-0.692702,
		0,
		-0.688719,
		-0.183527,
		0.701416,
		0,
		-0.090621,
		0.981636,
		0.167866,
		0,
		0.075777,
		0.724897,
		-0.116297,
		1
	},
	[0.6] = {
		-0.649521,
		0.059136,
		-0.758041,
		0,
		-0.754884,
		-0.169415,
		0.6336,
		0,
		-0.090955,
		0.983769,
		0.154679,
		0,
		0.078997,
		0.729228,
		-0.133428,
		1
	},
	[0.733333333333] = {
		-0.801675,
		0.039351,
		-0.596464,
		0,
		-0.591718,
		-0.193764,
		0.782512,
		0,
		-0.084781,
		0.980259,
		0.17862,
		0,
		0.069958,
		0.723072,
		-0.10941,
		1
	},
	[0.766666666667] = {
		-0.832959,
		0.031282,
		-0.552449,
		0,
		-0.546821,
		-0.199276,
		0.813189,
		0,
		-0.084652,
		0.979444,
		0.183095,
		0,
		0.067134,
		0.720033,
		-0.110383,
		1
	},
	[0.7] = {
		-0.760635,
		0.046855,
		-0.647487,
		0,
		-0.643268,
		-0.188694,
		0.742024,
		0,
		-0.087409,
		0.980918,
		0.173667,
		0,
		0.073033,
		0.724305,
		-0.111485,
		1
	},
	[0.833333333333] = {
		-0.853065,
		0.021023,
		-0.521381,
		0,
		-0.512889,
		-0.217694,
		0.830394,
		0,
		-0.096044,
		0.975791,
		0.19649,
		0,
		0.06989,
		0.697825,
		-0.141354,
		1
	},
	[0.866666666667] = {
		-0.862333,
		0.011088,
		-0.506221,
		0,
		-0.494583,
		-0.232655,
		0.837412,
		0,
		-0.10849,
		0.972496,
		0.20611,
		0,
		0.084729,
		0.665859,
		-0.172166,
		1
	},
	[0.8] = {
		-0.847224,
		0.025914,
		-0.530603,
		0,
		-0.523739,
		-0.207944,
		0.826109,
		0,
		-0.088928,
		0.977797,
		0.189747,
		0,
		0.065206,
		0.714367,
		-0.11968,
		1
	},
	[0.933333333333] = {
		-0.88532,
		-0.021623,
		-0.464479,
		0,
		-0.437403,
		-0.300177,
		0.847686,
		0,
		-0.157755,
		0.953638,
		0.256295,
		0,
		0.130877,
		0.577331,
		-0.246522,
		1
	},
	[0.966666666667] = {
		-0.895278,
		-0.038503,
		-0.443841,
		0,
		-0.40538,
		-0.342812,
		0.847436,
		0,
		-0.184782,
		0.938615,
		0.291304,
		0,
		0.157926,
		0.5306,
		-0.28683,
		1
	},
	[0.9] = {
		-0.873694,
		-0.004012,
		-0.486459,
		0,
		-0.468642,
		-0.261324,
		0.843851,
		0,
		-0.130509,
		0.965243,
		0.226438,
		0,
		0.106006,
		0.623898,
		-0.207929,
		1
	},
	[1.03333333333] = {
		-0.906551,
		-0.05715,
		-0.41821,
		0,
		-0.358778,
		-0.417618,
		0.834789,
		0,
		-0.22236,
		0.906824,
		0.358088,
		0,
		0.210623,
		0.452106,
		-0.3635,
		1
	},
	[1.06666666667] = {
		-0.911267,
		-0.049985,
		-0.408772,
		0,
		-0.348068,
		-0.437012,
		0.829379,
		0,
		-0.220094,
		0.898066,
		0.380836,
		0,
		0.234749,
		0.425657,
		-0.403547,
		1
	},
	[1.13333333333] = {
		-0.928484,
		-0.012294,
		-0.371169,
		0,
		-0.328666,
		-0.438127,
		0.836674,
		0,
		-0.172905,
		0.898829,
		0.402753,
		0,
		0.277605,
		0.391717,
		-0.485554,
		1
	},
	[1.16666666667] = {
		-0.939,
		0.001223,
		-0.343915,
		0,
		-0.308351,
		-0.445863,
		0.840313,
		0,
		-0.152311,
		0.8951,
		0.419043,
		0,
		0.286215,
		0.385063,
		-0.500629,
		1
	},
	[1.1] = {
		-0.919012,
		-0.032028,
		-0.392926,
		0,
		-0.340098,
		-0.43965,
		0.831289,
		0,
		-0.199374,
		0.897598,
		0.393151,
		0,
		0.258829,
		0.405445,
		-0.448716,
		1
	},
	[1.23333333333] = {
		-0.955315,
		0.007006,
		-0.295506,
		0,
		-0.264283,
		-0.468008,
		0.843281,
		0,
		-0.132391,
		0.883696,
		0.448947,
		0,
		0.288868,
		0.38314,
		-0.496051,
		1
	},
	[1.26666666667] = {
		-0.959627,
		0.011831,
		-0.281028,
		0,
		-0.249475,
		-0.497277,
		0.83095,
		0,
		-0.129918,
		0.867511,
		0.480151,
		0,
		0.289599,
		0.384723,
		-0.490964,
		1
	},
	[1.2] = {
		-0.948448,
		0.00545,
		-0.316887,
		0,
		-0.284256,
		-0.456809,
		0.842926,
		0,
		-0.140163,
		0.889548,
		0.434809,
		0,
		0.287856,
		0.3832,
		-0.499369,
		1
	},
	[1.33333333333] = {
		-0.944905,
		0.091106,
		-0.314411,
		0,
		-0.31145,
		-0.545879,
		0.777827,
		0,
		-0.100765,
		0.832896,
		0.544179,
		0,
		0.291045,
		0.403047,
		-0.469112,
		1
	},
	[1.36666666667] = {
		-0.952767,
		0.108573,
		-0.283633,
		0,
		-0.293967,
		-0.564275,
		0.771477,
		0,
		-0.076285,
		0.818416,
		0.56954,
		0,
		0.287954,
		0.416603,
		-0.45658,
		1
	},
	[1.3] = {
		-0.955476,
		0.038536,
		-0.292543,
		0,
		-0.268388,
		-0.525486,
		0.807361,
		0,
		-0.122615,
		0.849929,
		0.512432,
		0,
		0.289717,
		0.392021,
		-0.48241,
		1
	},
	[1.43333333333] = {
		-0.981032,
		0.103526,
		-0.163886,
		0,
		-0.193024,
		-0.599519,
		0.776736,
		0,
		-0.01784,
		0.793637,
		0.60813,
		0,
		0.277566,
		0.444017,
		-0.434416,
		1
	},
	[1.46666666667] = {
		-0.99123,
		0.087512,
		-0.099017,
		0,
		-0.131998,
		-0.620079,
		0.773356,
		0,
		0.00628,
		0.779643,
		0.626192,
		0,
		0.272098,
		0.456654,
		-0.423255,
		1
	},
	[1.4] = {
		-0.96688,
		0.111708,
		-0.229489,
		0,
		-0.25087,
		-0.581481,
		0.773914,
		0,
		-0.046991,
		0.805854,
		0.590247,
		0,
		0.283157,
		0.43047,
		-0.44529,
		1
	},
	[1.53333333333] = {
		-0.999083,
		0.042252,
		-0.006959,
		0,
		-0.033736,
		-0.676572,
		0.735603,
		0,
		0.026372,
		0.735163,
		0.677377,
		0,
		0.263677,
		0.478953,
		-0.398664,
		1
	},
	[1.56666666667] = {
		-0.999537,
		0.009152,
		0.029017,
		0,
		0.013881,
		-0.711486,
		0.702563,
		0,
		0.027075,
		0.702641,
		0.71103,
		0,
		0.259595,
		0.490893,
		-0.384241,
		1
	},
	[1.5] = {
		-0.99662,
		0.067457,
		-0.046895,
		0,
		-0.079429,
		-0.645307,
		0.759783,
		0,
		0.020991,
		0.760939,
		0.648483,
		0,
		0.267573,
		0.467895,
		-0.411595,
		1
	},
	[1.63333333333] = {
		-0.993441,
		-0.073138,
		0.087897,
		0,
		0.111869,
		-0.780787,
		0.614701,
		0,
		0.023671,
		0.620502,
		0.783848,
		0,
		0.251257,
		0.514684,
		-0.353828,
		1
	},
	[1.66666666667] = {
		-0.986818,
		-0.117921,
		0.110839,
		0,
		0.160139,
		-0.810415,
		0.563545,
		0,
		0.023372,
		0.573866,
		0.818616,
		0,
		0.24725,
		0.525197,
		-0.339363,
		1
	},
	[1.6] = {
		-0.997705,
		-0.030012,
		0.060688,
		0,
		0.062726,
		-0.747105,
		0.66174,
		0,
		0.02548,
		0.664028,
		0.747273,
		0,
		0.255417,
		0.50303,
		-0.369046,
		1
	},
	[1.73333333333] = {
		-0.968276,
		-0.203062,
		0.145631,
		0,
		0.247977,
		-0.852712,
		0.459772,
		0,
		0.03082,
		0.481299,
		0.876014,
		0,
		0.24078,
		0.540302,
		-0.314101,
		1
	},
	[1.76666666667] = {
		-0.957776,
		-0.239102,
		0.159673,
		0,
		0.284818,
		-0.864929,
		0.413252,
		0,
		0.039297,
		0.441281,
		0.896508,
		0,
		0.238752,
		0.543777,
		-0.304244,
		1
	},
	[1.7] = {
		-0.978213,
		-0.161987,
		0.129841,
		0,
		0.206017,
		-0.834589,
		0.510899,
		0,
		0.025606,
		0.526518,
		0.849779,
		0,
		0.243663,
		0.533933,
		-0.326026,
		1
	},
	[1.83333333333] = {
		-0.937554,
		-0.292198,
		0.188714,
		0,
		0.341772,
		-0.874737,
		0.34355,
		0,
		0.064691,
		0.386594,
		0.919978,
		0,
		0.238367,
		0.539279,
		-0.29306,
		1
	},
	[1.86666666667] = {
		-0.927428,
		-0.313444,
		0.204037,
		0,
		0.365647,
		-0.874566,
		0.318491,
		0,
		0.078614,
		0.369983,
		0.925706,
		0,
		0.239393,
		0.53013,
		-0.292315,
		1
	},
	[1.8] = {
		-0.947534,
		-0.268314,
		0.173741,
		0,
		0.315552,
		-0.871939,
		0.374365,
		0,
		0.051044,
		0.409548,
		0.910859,
		0,
		0.237871,
		0.54386,
		-0.297089,
		1
	},
	[1.93333333333] = {
		-0.907588,
		-0.348463,
		0.234218,
		0,
		0.406309,
		-0.869528,
		0.280773,
		0,
		0.10582,
		0.349991,
		0.930757,
		0,
		0.242516,
		0.50436,
		-0.297711,
		1
	},
	[1.96666666667] = {
		-0.898407,
		-0.362402,
		0.248051,
		0,
		0.422848,
		-0.866359,
		0.265748,
		0,
		0.118594,
		0.343638,
		0.931584,
		0,
		0.244414,
		0.490871,
		-0.302093,
		1
	},
	[1.9] = {
		-0.917358,
		-0.332169,
		0.21936,
		0,
		0.387186,
		-0.872527,
		0.297966,
		0,
		0.092422,
		0.358275,
		0.92903,
		0,
		0.240813,
		0.51797,
		-0.294255,
		1
	},
	[2.03333333333] = {
		-0.883186,
		-0.38349,
		0.270034,
		0,
		0.44711,
		-0.862312,
		0.23772,
		0,
		0.141691,
		0.330685,
		0.933044,
		0,
		0.248546,
		0.470592,
		-0.311439,
		1
	},
	[2.06666666667] = {
		-0.877909,
		-0.390743,
		0.276758,
		0,
		0.454125,
		-0.862699,
		0.222531,
		0,
		0.151807,
		0.321045,
		0.934818,
		0,
		0.250693,
		0.466983,
		-0.31534,
		1
	},
	[2.13333333333] = {
		-0.875662,
		-0.395526,
		0.277083,
		0,
		0.452728,
		-0.872047,
		0.185934,
		0,
		0.168088,
		0.288259,
		0.942684,
		0,
		0.254691,
		0.468232,
		-0.318923,
		1
	},
	[2.16666666667] = {
		-0.880825,
		-0.388884,
		0.27003,
		0,
		0.440593,
		-0.882056,
		0.166899,
		0,
		0.173277,
		0.265982,
		0.948277,
		0,
		0.256145,
		0.470398,
		-0.318001,
		1
	},
	[2.1] = {
		-0.874718,
		-0.395808,
		0.279652,
		0,
		0.457166,
		-0.86541,
		0.205097,
		0,
		0.160834,
		0.307249,
		0.937939,
		0,
		0.252842,
		0.466902,
		-0.317971,
		1
	},
	[2.23333333333] = {
		-0.893562,
		-0.369897,
		0.254408,
		0,
		0.411194,
		-0.901778,
		0.133101,
		0,
		0.180186,
		0.223545,
		0.957894,
		0,
		0.258068,
		0.47577,
		-0.312478,
		1
	},
	[2.26666666667] = {
		-0.89648,
		-0.364883,
		0.251366,
		0,
		0.403083,
		-0.907165,
		0.120728,
		0,
		0.183979,
		0.209551,
		0.960333,
		0,
		0.258099,
		0.478305,
		-0.309091,
		1
	},
	[2.2] = {
		-0.887612,
		-0.379145,
		0.261524,
		0,
		0.42522,
		-0.892755,
		0.148921,
		0,
		0.177014,
		0.243389,
		0.953639,
		0,
		0.257344,
		0.473023,
		-0.315578,
		1
	},
	[2.33333333333] = {
		-0.89492,
		-0.365633,
		0.255795,
		0,
		0.402599,
		-0.908806,
		0.109478,
		0,
		0.192439,
		0.200957,
		0.960512,
		0,
		0.256445,
		0.483177,
		-0.302704,
		1
	},
	[2.36666666667] = {
		-0.892566,
		-0.367997,
		0.260584,
		0,
		0.405888,
		-0.907423,
		0.108803,
		0,
		0.19642,
		0.202882,
		0.959301,
		0,
		0.255247,
		0.485466,
		-0.300049,
		1
	},
	[2.3] = {
		-0.896371,
		-0.364357,
		0.252512,
		0,
		0.401308,
		-0.908943,
		0.113027,
		0,
		0.188337,
		0.202649,
		0.96097,
		0,
		0.257466,
		0.480716,
		-0.305769,
		1
	},
	[2.43333333333] = {
		-0.88694,
		-0.373134,
		0.27223,
		0,
		0.414125,
		-0.903434,
		0.110941,
		0,
		0.204546,
		0.211135,
		0.955815,
		0,
		0.253187,
		0.488644,
		-0.296607,
		1
	},
	[2.46666666667] = {
		-0.884594,
		-0.374548,
		0.277861,
		0,
		0.416903,
		-0.902122,
		0.111214,
		0,
		0.20901,
		0.21422,
		0.954162,
		0,
		0.252758,
		0.489099,
		-0.296143,
		1
	},
	[2.4] = {
		-0.889754,
		-0.37073,
		0.266265,
		0,
		0.410091,
		-0.905421,
		0.109716,
		0,
		0.200407,
		0.206814,
		0.957635,
		0,
		0.254089,
		0.487361,
		-0.297963,
		1
	}
}

return spline_matrices

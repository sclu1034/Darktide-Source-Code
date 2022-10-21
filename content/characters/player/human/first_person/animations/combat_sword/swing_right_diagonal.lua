local spline_matrices = {
	[0] = {
		0.642527,
		-0.546291,
		-0.537332,
		0,
		-0.735245,
		-0.242036,
		-0.633114,
		0,
		0.215811,
		0.801863,
		-0.557172,
		0,
		-0.00788,
		0.035994,
		-0.596498,
		1
	},
	{
		0.607554,
		-0.523174,
		-0.597635,
		0,
		-0.782492,
		-0.523386,
		-0.337303,
		0,
		-0.136325,
		0.672574,
		-0.727365,
		0,
		-0.037852,
		0.085274,
		-0.601123,
		1
	},
	[0.0333333333333] = {
		0.562312,
		-0.748402,
		-0.351709,
		0,
		-0.748345,
		-0.279595,
		-0.601503,
		0,
		0.35183,
		0.601432,
		-0.717283,
		0,
		-0.045066,
		0.032127,
		-0.568544,
		1
	},
	[0.0666666666667] = {
		0.205196,
		-0.946566,
		0.248811,
		0,
		-0.816033,
		-0.305823,
		-0.490471,
		0,
		0.540356,
		-0.102395,
		-0.835183,
		0,
		-0.123489,
		0.020243,
		-0.510177,
		1
	},
	[0.133333333333] = {
		-0.345894,
		-0.077449,
		0.935072,
		0,
		-0.934776,
		-0.057525,
		-0.350549,
		0,
		0.08094,
		-0.995335,
		-0.0525,
		0,
		-0.283604,
		-0.005489,
		-0.357758,
		1
	},
	[0.166666666667] = {
		-0.2943,
		0.079089,
		0.952435,
		0,
		-0.953059,
		-0.098502,
		-0.286314,
		0,
		0.071173,
		-0.991989,
		0.104366,
		0,
		-0.343654,
		-0.03083,
		-0.272055,
		1
	},
	[0.1] = {
		-0.220764,
		-0.558602,
		0.799517,
		0,
		-0.90026,
		-0.198664,
		-0.387383,
		0,
		0.375228,
		-0.805293,
		-0.459029,
		0,
		-0.206673,
		0.004738,
		-0.438496,
		1
	},
	[0.233333333333] = {
		0.055111,
		0.154531,
		0.98645,
		0,
		-0.924565,
		-0.365143,
		0.108855,
		0,
		0.377017,
		-0.918036,
		0.122751,
		0,
		-0.420858,
		-0.099375,
		-0.086217,
		1
	},
	[0.266666666667] = {
		0.271361,
		0.197496,
		0.941997,
		0,
		-0.890425,
		-0.320038,
		0.323603,
		0,
		0.365386,
		-0.926591,
		0.08901,
		0,
		-0.442195,
		-0.116048,
		-0.001843,
		1
	},
	[0.2] = {
		-0.149672,
		0.122395,
		0.981131,
		0,
		-0.962577,
		-0.244784,
		-0.116305,
		0,
		0.22593,
		-0.961821,
		0.154452,
		0,
		-0.390522,
		-0.067554,
		-0.178073,
		1
	},
	[0.333333333333] = {
		0.586019,
		-0.128184,
		0.800094,
		0,
		-0.347248,
		0.852416,
		0.390904,
		0,
		-0.73212,
		-0.506908,
		0.455021,
		0,
		-0.237143,
		0.477907,
		0.115,
		1
	},
	[0.366666666667] = {
		0.531042,
		0.01717,
		0.847172,
		0,
		0.58348,
		0.717585,
		-0.380293,
		0,
		-0.614448,
		0.696259,
		0.371049,
		0,
		0.026427,
		0.767692,
		-0.021446,
		1
	},
	[0.3] = {
		0.495584,
		0.140881,
		0.857058,
		0,
		-0.867726,
		0.123539,
		0.481445,
		0,
		-0.038053,
		-0.982289,
		0.18347,
		0,
		-0.424042,
		-0.003722,
		0.075484,
		1
	},
	[0.433333333333] = {
		0.536476,
		0.033733,
		0.843241,
		0,
		0.840778,
		-0.107441,
		-0.530611,
		0,
		0.072699,
		0.993639,
		-0.086002,
		0,
		0.54502,
		0.518825,
		-0.265311,
		1
	},
	[0.466666666667] = {
		0.547497,
		0.010495,
		0.836742,
		0,
		0.766019,
		-0.408784,
		-0.496095,
		0,
		0.336841,
		0.912571,
		-0.231848,
		0,
		0.614616,
		0.361436,
		-0.330337,
		1
	},
	[0.4] = {
		0.533837,
		-0.063495,
		0.8432,
		0,
		0.844901,
		0.080224,
		-0.528873,
		0,
		-0.034063,
		0.994752,
		0.096474,
		0,
		0.312627,
		0.739135,
		-0.180451,
		1
	},
	[0.533333333333] = {
		0.603124,
		-0.075399,
		0.794076,
		0,
		0.242631,
		-0.931006,
		-0.272686,
		0,
		0.75985,
		0.357131,
		-0.543218,
		0,
		0.68107,
		0.046829,
		-0.496503,
		1
	},
	[0.566666666667] = {
		0.811953,
		-0.080284,
		0.578175,
		0,
		-0.140681,
		-0.988214,
		0.060343,
		0,
		0.566517,
		-0.130334,
		-0.813678,
		0,
		0.720952,
		-0.11211,
		-0.682348,
		1
	},
	[0.5] = {
		0.546728,
		-0.055578,
		0.835464,
		0,
		0.562674,
		-0.71453,
		-0.415747,
		0,
		0.62007,
		0.697394,
		-0.359381,
		0,
		0.649276,
		0.206157,
		-0.392826,
		1
	},
	[0.633333333333] = {
		0.90954,
		-0.277761,
		0.309168,
		0,
		-0.359448,
		-0.899151,
		0.249648,
		0,
		0.208647,
		-0.338195,
		-0.917655,
		0,
		0.501171,
		-0.225669,
		-0.714404,
		1
	},
	[0.666666666667] = {
		0.901211,
		-0.398381,
		0.170621,
		0,
		-0.425046,
		-0.889338,
		0.168567,
		0,
		0.084586,
		-0.224436,
		-0.970811,
		0,
		0.394497,
		-0.197424,
		-0.710257,
		1
	},
	[0.6] = {
		0.887098,
		-0.171343,
		0.428602,
		0,
		-0.285556,
		-0.933252,
		0.217942,
		0,
		0.362651,
		-0.315726,
		-0.876813,
		0,
		0.609816,
		-0.198348,
		-0.701929,
		1
	},
	[0.733333333333] = {
		0.799372,
		-0.566625,
		-0.199851,
		0,
		-0.59287,
		-0.797845,
		-0.109309,
		0,
		-0.097513,
		0.205864,
		-0.97371,
		0,
		0.178964,
		-0.071854,
		-0.673221,
		1
	},
	[0.766666666667] = {
		0.726695,
		-0.57366,
		-0.377925,
		0,
		-0.673991,
		-0.701779,
		-0.230743,
		0,
		-0.132852,
		0.422399,
		-0.896621,
		0,
		0.088167,
		-0.002149,
		-0.645627,
		1
	},
	[0.7] = {
		0.862945,
		-0.505271,
		-0.005125,
		0,
		-0.504771,
		-0.862466,
		0.036861,
		0,
		-0.023045,
		-0.029223,
		-0.999307,
		0,
		0.283973,
		-0.142005,
		-0.696072,
		1
	},
	[0.833333333333] = {
		0.621786,
		-0.52543,
		-0.58078,
		0,
		-0.769979,
		-0.54573,
		-0.330622,
		0,
		-0.14323,
		0.652765,
		-0.743897,
		0,
		-0.02539,
		0.080641,
		-0.60558,
		1
	},
	[0.866666666667] = {
		0.597393,
		-0.510494,
		-0.61848,
		0,
		-0.789276,
		-0.510833,
		-0.340724,
		0,
		-0.142002,
		0.691698,
		-0.708089,
		0,
		-0.050208,
		0.095473,
		-0.597193,
		1
	},
	[0.8] = {
		0.663807,
		-0.548698,
		-0.508223,
		0,
		-0.734428,
		-0.606639,
		-0.30431,
		0,
		-0.141334,
		0.575256,
		-0.80567,
		0,
		0.018588,
		0.052025,
		-0.620633,
		1
	},
	[0.933333333333] = {
		0.587116,
		-0.506186,
		-0.63172,
		0,
		-0.797604,
		-0.495043,
		-0.344618,
		0,
		-0.138288,
		0.706193,
		-0.694383,
		0,
		-0.059779,
		0.100222,
		-0.593895,
		1
	},
	[0.966666666667] = {
		0.595033,
		-0.513368,
		-0.618376,
		0,
		-0.791897,
		-0.505882,
		-0.342027,
		0,
		-0.13724,
		0.693208,
		-0.707551,
		0,
		-0.051162,
		0.094217,
		-0.596769,
		1
	},
	[0.9] = {
		0.586888,
		-0.504408,
		-0.633352,
		0,
		-0.797488,
		-0.495294,
		-0.344525,
		0,
		-0.139914,
		0.707288,
		-0.692941,
		0,
		-0.060542,
		0.101302,
		-0.593652,
		1
	},
	[1.03333333333] = {
		0.621514,
		-0.533098,
		-0.574044,
		0,
		-0.771663,
		-0.542978,
		-0.331226,
		0,
		-0.135118,
		0.64883,
		-0.748841,
		0,
		-0.023013,
		0.07543,
		-0.605856,
		1
	},
	[1.06666666667] = {
		0.633825,
		-0.541082,
		-0.552717,
		0,
		-0.76183,
		-0.560253,
		-0.325166,
		0,
		-0.13372,
		0.627174,
		-0.767314,
		0,
		-0.009876,
		0.066764,
		-0.609944,
		1
	},
	[1.13333333333] = {
		0.642526,
		-0.546291,
		-0.537332,
		0,
		-0.754718,
		-0.572444,
		-0.320482,
		0,
		-0.132516,
		0.611452,
		-0.780106,
		0,
		-0.000551,
		0.060637,
		-0.612789,
		1
	},
	[1.1] = {
		0.641433,
		-0.545658,
		-0.539278,
		0,
		-0.755619,
		-0.570913,
		-0.321089,
		0,
		-0.132677,
		0.613446,
		-0.778512,
		0,
		-0.001725,
		0.061407,
		-0.612434,
		1
	}
}

return spline_matrices

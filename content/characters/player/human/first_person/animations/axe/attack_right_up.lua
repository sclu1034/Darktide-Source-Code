local spline_matrices = {
	[0] = {
		0.820091,
		-0.408136,
		-0.401092,
		0,
		-0.572193,
		-0.593162,
		-0.566352,
		0,
		-0.006764,
		0.693962,
		-0.71998,
		0,
		-0.111096,
		0.024082,
		-0.756679,
		1
	},
	{
		0.975197,
		-0.074168,
		0.208544,
		0,
		-0.103012,
		-0.986011,
		0.131036,
		0,
		0.195908,
		-0.149268,
		-0.969195,
		0,
		0.443154,
		-0.446569,
		-0.480726,
		1
	},
	[0.0166666666667] = {
		0.958283,
		-0.154202,
		-0.240658,
		0,
		-0.278625,
		-0.691745,
		-0.666226,
		0,
		-0.06374,
		0.705486,
		-0.705851,
		0,
		-0.117477,
		0.031449,
		-0.761456,
		1
	},
	[0.0333333333333] = {
		0.987092,
		0.155815,
		-0.037035,
		0,
		0.081229,
		-0.686362,
		-0.72271,
		0,
		-0.138028,
		0.710372,
		-0.690159,
		0,
		-0.116945,
		0.041946,
		-0.765804,
		1
	},
	[0.05] = {
		0.861568,
		0.469621,
		0.192759,
		0,
		0.452932,
		-0.539668,
		-0.709656,
		0,
		-0.229244,
		0.698724,
		-0.677667,
		0,
		-0.111104,
		0.058712,
		-0.767841,
		1
	},
	[0.0666666666667] = {
		0.576047,
		0.706126,
		0.411773,
		0,
		0.74851,
		-0.253233,
		-0.612867,
		0,
		-0.328487,
		0.661256,
		-0.674416,
		0,
		-0.104061,
		0.083656,
		-0.765829,
		1
	},
	[0.0833333333333] = {
		0.190003,
		0.794733,
		0.576454,
		0,
		0.887636,
		0.11184,
		-0.44676,
		0,
		-0.419525,
		0.596567,
		-0.684183,
		0,
		-0.101022,
		0.115598,
		-0.759267,
		1
	},
	[0.116666666667] = {
		-0.502145,
		0.537832,
		0.677191,
		0,
		0.684596,
		0.725678,
		-0.068705,
		0,
		-0.528374,
		0.429102,
		-0.732593,
		0,
		-0.116061,
		0.184043,
		-0.737627,
		1
	},
	[0.133333333333] = {
		-0.699633,
		0.306487,
		0.64543,
		0,
		0.460437,
		0.884147,
		0.079261,
		0,
		-0.546362,
		0.352634,
		-0.759696,
		0,
		-0.128386,
		0.212823,
		-0.720998,
		1
	},
	[0.15] = {
		-0.801616,
		0.079101,
		0.592583,
		0,
		0.233964,
		0.953659,
		0.189196,
		0,
		-0.550157,
		0.290305,
		-0.782975,
		0,
		-0.142272,
		0.237645,
		-0.705484,
		1
	},
	[0.166666666667] = {
		-0.836128,
		-0.118427,
		0.535597,
		0,
		0.035367,
		0.962745,
		0.268087,
		0,
		-0.547393,
		0.243098,
		-0.80079,
		0,
		-0.155888,
		0.259585,
		-0.691102,
		1
	},
	[0.183333333333] = {
		-0.830211,
		-0.277757,
		0.483322,
		0,
		-0.124221,
		0.937405,
		0.325333,
		0,
		-0.543432,
		0.210056,
		-0.812747,
		0,
		-0.168319,
		0.280014,
		-0.677549,
		1
	},
	[0.1] = {
		-0.196293,
		0.722784,
		0.66261,
		0,
		0.850651,
		0.461638,
		-0.251562,
		0,
		-0.487711,
		0.51427,
		-0.705453,
		0,
		-0.105208,
		0.150498,
		-0.749328,
		1
	},
	[0.216666666667] = {
		-0.773402,
		-0.487696,
		0.404971,
		0,
		-0.32587,
		0.853838,
		0.405918,
		0,
		-0.543744,
		0.18197,
		-0.819286,
		0,
		-0.18862,
		0.321245,
		-0.651332,
		1
	},
	[0.233333333333] = {
		-0.746301,
		-0.546438,
		0.380053,
		0,
		-0.373871,
		0.816543,
		0.439861,
		0,
		-0.550686,
		0.186178,
		-0.813685,
		0,
		-0.196492,
		0.34404,
		-0.63788,
		1
	},
	[0.25] = {
		-0.729367,
		-0.578784,
		0.364737,
		0,
		-0.389692,
		0.789688,
		0.473849,
		0,
		-0.562285,
		0.203474,
		-0.80152,
		0,
		-0.202831,
		0.369366,
		-0.623697,
		1
	},
	[0.266666666667] = {
		-0.725908,
		-0.58617,
		0.359809,
		0,
		-0.373468,
		0.775223,
		0.509462,
		0,
		-0.577564,
		0.235445,
		-0.781656,
		0,
		-0.207796,
		0.3978,
		-0.608364,
		1
	},
	[0.283333333333] = {
		-0.737072,
		-0.567608,
		0.366805,
		0,
		-0.32287,
		0.772568,
		0.546712,
		0,
		-0.593699,
		0.284536,
		-0.752702,
		0,
		-0.211181,
		0.429805,
		-0.591511,
		1
	},
	[0.2] = {
		-0.804534,
		-0.399536,
		0.439426,
		0,
		-0.243718,
		0.896825,
		0.369197,
		0,
		-0.541596,
		0.189936,
		-0.818901,
		0,
		-0.179241,
		0.300206,
		-0.664426,
		1
	},
	[0.316666666667] = {
		-0.7927,
		-0.436474,
		0.425579,
		0,
		-0.100093,
		0.781829,
		0.615406,
		0,
		-0.601339,
		0.445235,
		-0.663444,
		0,
		-0.206889,
		0.502794,
		-0.549047,
		1
	},
	[0.333333333333] = {
		-0.828652,
		-0.340331,
		0.444422,
		0,
		0.075965,
		0.718227,
		0.691649,
		0,
		-0.554585,
		0.606897,
		-0.569307,
		0,
		-0.165676,
		0.604469,
		-0.396939,
		1
	},
	[0.35] = {
		-0.853839,
		-0.133579,
		0.503105,
		0,
		0.327194,
		0.613982,
		0.71831,
		0,
		-0.404849,
		0.777935,
		-0.480536,
		0,
		-0.060575,
		0.724615,
		-0.236164,
		1
	},
	[0.366666666667] = {
		-0.855306,
		-0.115625,
		0.505057,
		0,
		0.46136,
		0.273654,
		0.843955,
		0,
		-0.235793,
		0.954853,
		-0.180714,
		0,
		0.068623,
		0.781674,
		0.015343,
		1
	},
	[0.383333333333] = {
		-0.891781,
		-0.10183,
		0.440861,
		0,
		0.445925,
		-0.032691,
		0.894473,
		0,
		-0.076672,
		0.994264,
		0.074562,
		0,
		0.153784,
		0.756117,
		0.156732,
		1
	},
	[0.3] = {
		-0.761406,
		-0.519488,
		0.387804,
		0,
		-0.233369,
		0.777748,
		0.58365,
		0,
		-0.604813,
		0.353893,
		-0.713415,
		0,
		-0.212066,
		0.465836,
		-0.572814,
		1
	},
	[0.416666666667] = {
		-0.92412,
		-0.1471,
		0.352652,
		0,
		0.360842,
		-0.639527,
		0.678821,
		0,
		0.125676,
		0.754564,
		0.64408,
		0,
		0.319128,
		0.464781,
		0.42924,
		1
	},
	[0.433333333333] = {
		-0.893193,
		0.307786,
		0.327832,
		0,
		-0.096593,
		-0.843351,
		0.52861,
		0,
		0.439177,
		0.440484,
		0.783005,
		0,
		0.679471,
		0.277575,
		0.363633,
		1
	},
	[0.45] = {
		-0.602846,
		0.618668,
		0.503813,
		0,
		-0.491756,
		-0.78537,
		0.375993,
		0,
		0.628294,
		-0.021087,
		0.77769,
		0,
		0.915161,
		0.019452,
		0.166824,
		1
	},
	[0.466666666667] = {
		-0.485981,
		0.651465,
		0.582594,
		0,
		-0.485483,
		-0.755528,
		0.439869,
		0,
		0.726725,
		-0.069072,
		0.683447,
		0,
		0.985632,
		-0.071169,
		0.088072,
		1
	},
	[0.483333333333] = {
		-0.352172,
		0.67448,
		0.648885,
		0,
		-0.466683,
		-0.727512,
		0.502924,
		0,
		0.811284,
		-0.125708,
		0.570978,
		0,
		1.022623,
		-0.149803,
		0.010415,
		1
	},
	[0.4] = {
		-0.918544,
		-0.092003,
		0.384465,
		0,
		0.387396,
		-0.40323,
		0.829054,
		0,
		0.078752,
		0.910462,
		0.406026,
		0,
		0.260057,
		0.59618,
		0.335403,
		1
	},
	[0.516666666667] = {
		-0.053861,
		0.683537,
		0.727926,
		0,
		-0.393547,
		-0.684511,
		0.61365,
		0,
		0.917725,
		-0.253422,
		0.305872,
		0,
		1.030586,
		-0.274033,
		-0.128423,
		1
	},
	[0.533333333333] = {
		0.097175,
		0.668848,
		0.737021,
		0,
		-0.343596,
		-0.672452,
		0.655554,
		0,
		0.934076,
		-0.316941,
		0.164468,
		0,
		1.014226,
		-0.322181,
		-0.18595,
		1
	},
	[0.55] = {
		0.240466,
		0.643091,
		0.727056,
		0,
		-0.289203,
		-0.667548,
		0.686106,
		0,
		0.926573,
		-0.375252,
		0.025461,
		0,
		0.990665,
		-0.362479,
		-0.234762,
		1
	},
	[0.566666666667] = {
		0.370903,
		0.608796,
		0.701283,
		0,
		-0.233984,
		-0.669522,
		0.704976,
		0,
		0.898712,
		-0.425567,
		-0.105879,
		0,
		0.963358,
		-0.395912,
		-0.275182,
		1
	},
	[0.583333333333] = {
		0.485413,
		0.568872,
		0.663897,
		0,
		-0.181062,
		-0.677487,
		0.712901,
		0,
		0.855331,
		-0.466258,
		-0.22586,
		0,
		0.934897,
		-0.423443,
		-0.307944,
		1
	},
	[0.5] = {
		-0.206013,
		0.685525,
		0.698294,
		0,
		-0.435513,
		-0.703263,
		0.561916,
		0,
		0.876291,
		-0.188354,
		0.443437,
		0,
		1.03525,
		-0.216981,
		-0.062544,
		1
	},
	[0.616666666667] = {
		0.663605,
		0.482626,
		0.571577,
		0,
		-0.090779,
		-0.706457,
		0.70191,
		0,
		0.742555,
		-0.517679,
		-0.424996,
		0,
		0.881572,
		-0.464432,
		-0.353842,
		1
	},
	[0.633333333333] = {
		0.729253,
		0.440163,
		0.523877,
		0,
		-0.055557,
		-0.725011,
		0.686493,
		0,
		0.681985,
		-0.529732,
		-0.504262,
		0,
		0.858814,
		-0.479484,
		-0.368829,
		1
	},
	[0.65] = {
		0.781831,
		0.399711,
		0.478509,
		0,
		-0.027181,
		-0.744889,
		0.666634,
		0,
		0.622897,
		-0.534202,
		-0.571513,
		0,
		0.839307,
		-0.491781,
		-0.379699,
		1
	},
	[0.666666666667] = {
		0.823507,
		0.361807,
		0.436958,
		0,
		-0.005282,
		-0.76531,
		0.64364,
		0,
		0.567282,
		-0.53235,
		-0.628327,
		0,
		0.823133,
		-0.501819,
		-0.387198,
		1
	},
	[0.683333333333] = {
		0.856316,
		0.326623,
		0.40005,
		0,
		0.010724,
		-0.78569,
		0.618528,
		0,
		0.51634,
		-0.525365,
		-0.676302,
		0,
		0.810148,
		-0.509974,
		-0.391948,
		1
	},
	[0.6] = {
		0.582839,
		0.526069,
		0.619314,
		0,
		-0.132823,
		-0.690223,
		0.711302,
		0,
		0.801659,
		-0.496834,
		-0.332414,
		0,
		0.907194,
		-0.446001,
		-0.333869,
		1
	},
	[0.716666666667] = {
		0.902184,
		0.263972,
		0.341149,
		0,
		0.027774,
		-0.824793,
		0.564752,
		0,
		0.430456,
		-0.500035,
		-0.751447,
		0,
		0.792381,
		-0.521613,
		-0.395182,
		1
	},
	[0.733333333333] = {
		0.917921,
		0.23605,
		0.318905,
		0,
		0.030226,
		-0.843037,
		0.537005,
		0,
		0.395609,
		-0.483289,
		-0.780977,
		0,
		0.786679,
		-0.525319,
		-0.394496,
		1
	},
	[0.75] = {
		0.930207,
		0.210028,
		0.301002,
		0,
		0.0295,
		-0.860223,
		0.509065,
		0,
		0.365847,
		-0.464656,
		-0.806381,
		0,
		0.782353,
		-0.527658,
		-0.39278,
		1
	},
	[0.766666666667] = {
		0.939783,
		0.185622,
		0.286971,
		0,
		0.026169,
		-0.876274,
		0.481102,
		0,
		0.340769,
		-0.444622,
		-0.828365,
		0,
		0.778763,
		-0.528624,
		-0.390423,
		1
	},
	[0.783333333333] = {
		0.947222,
		0.162566,
		0.2763,
		0,
		0.020737,
		-0.891151,
		0.453233,
		0,
		0.319906,
		-0.423583,
		-0.847489,
		0,
		0.775215,
		-0.528201,
		-0.387848,
		1
	},
	[0.7] = {
		0.882047,
		0.294078,
		0.368117,
		0,
		0.021506,
		-0.805613,
		0.592051,
		0,
		0.470669,
		-0.514301,
		-0.716913,
		0,
		0.800037,
		-0.51652,
		-0.394463,
		1
	},
	[0.816666666667] = {
		0.95738,
		0.119604,
		0.262903,
		0,
		0.005283,
		-0.917332,
		0.398088,
		0,
		0.288783,
		-0.379733,
		-0.878867,
		0,
		0.765254,
		-0.523177,
		-0.38396,
		1
	},
	[0.833333333333] = {
		0.960726,
		0.099336,
		0.25911,
		0,
		-0.004022,
		-0.928651,
		0.370932,
		0,
		0.277469,
		-0.357407,
		-0.89178,
		0,
		0.757274,
		-0.518641,
		-0.383681,
		1
	},
	[0.85] = {
		0.963239,
		0.079696,
		0.256554,
		0,
		-0.013981,
		-0.938818,
		0.34413,
		0,
		0.268283,
		-0.335066,
		-0.903191,
		0,
		0.746236,
		-0.512871,
		-0.385192,
		1
	},
	[0.866666666667] = {
		0.965113,
		0.060597,
		0.254727,
		0,
		-0.024349,
		-0.947865,
		0.31774,
		0,
		0.260701,
		-0.312858,
		-0.913321,
		0,
		0.731373,
		-0.506022,
		-0.388913,
		1
	},
	[0.883333333333] = {
		0.966521,
		0.041979,
		0.253132,
		0,
		-0.034916,
		-0.955832,
		0.291831,
		0,
		0.254202,
		-0.290899,
		-0.922366,
		0,
		0.711999,
		-0.498308,
		-0.395111,
		1
	},
	[0.8] = {
		0.952972,
		0.140627,
		0.268456,
		0,
		0.013647,
		-0.904836,
		0.42554,
		0,
		0.302752,
		-0.401864,
		-0.864203,
		0,
		0.770969,
		-0.526381,
		-0.385525,
		1
	},
	[0.916666666667] = {
		0.96856,
		0.006109,
		0.248706,
		0,
		-0.055969,
		-0.968721,
		0.24176,
		0,
		0.242404,
		-0.248079,
		-0.937922,
		0,
		0.657795,
		-0.481421,
		-0.414806,
		1
	},
	[0.933333333333] = {
		0.969476,
		-0.011121,
		0.244933,
		0,
		-0.066189,
		-0.973753,
		0.217772,
		0,
		0.236082,
		-0.227336,
		-0.944766,
		0,
		0.622687,
		-0.472921,
		-0.42755,
		1
	},
	[0.95] = {
		0.970497,
		-0.02783,
		0.239501,
		0,
		-0.076069,
		-0.977927,
		0.194609,
		0,
		0.228798,
		-0.207086,
		-0.951192,
		0,
		0.58267,
		-0.464861,
		-0.441318,
		1
	},
	[0.966666666667] = {
		0.971735,
		-0.043951,
		0.231946,
		0,
		-0.085535,
		-0.981306,
		0.172399,
		0,
		0.220033,
		-0.187366,
		-0.957329,
		0,
		0.53858,
		-0.457599,
		-0.455263,
		1
	},
	[0.983333333333] = {
		0.973282,
		-0.05942,
		0.221792,
		0,
		-0.094529,
		-0.983972,
		0.151205,
		0,
		0.209253,
		-0.168131,
		-0.963299,
		0,
		0.4916,
		-0.451428,
		-0.468605,
		1
	},
	[0.9] = {
		0.967621,
		0.023817,
		0.251283,
		0,
		-0.045504,
		-0.962767,
		0.266477,
		0,
		0.248274,
		-0.269283,
		-0.930509,
		0,
		0.687574,
		-0.490001,
		-0.403821,
		1
	},
	[1.01666666667] = {
		0.977493,
		-0.088108,
		0.191689,
		0,
		-0.110956,
		-0.987505,
		0.111906,
		0,
		0.179433,
		-0.130656,
		-0.975055,
		0,
		0.394753,
		-0.443197,
		-0.491204,
		1
	},
	[1.03333333333] = {
		0.98012,
		-0.101132,
		0.170697,
		0,
		-0.118342,
		-0.988529,
		0.093836,
		0,
		0.159249,
		-0.112171,
		-0.980845,
		0,
		0.347861,
		-0.441451,
		-0.499809,
		1
	},
	[1.05] = {
		0.982942,
		-0.113106,
		0.145023,
		0,
		-0.125159,
		-0.989156,
		0.07685,
		0,
		0.134759,
		-0.09369,
		-0.986439,
		0,
		0.303795,
		-0.441441,
		-0.506463,
		1
	},
	[1.06666666667] = {
		0.985716,
		-0.123865,
		0.114111,
		0,
		-0.131393,
		-0.989453,
		0.060979,
		0,
		0.105354,
		-0.075102,
		-0.991595,
		0,
		0.263675,
		-0.443261,
		-0.511178,
		1
	},
	[1.08333333333] = {
		0.988061,
		-0.133208,
		0.077406,
		0,
		-0.137025,
		-0.989487,
		0.046262,
		0,
		0.070429,
		-0.056316,
		-0.995926,
		0,
		0.22841,
		-0.446986,
		-0.514005,
		1
	},
	[1.1] = {
		0.989427,
		-0.140898,
		0.03438,
		0,
		-0.142021,
		-0.989322,
		0.032739,
		0,
		0.0294,
		-0.037276,
		-0.998872,
		0,
		0.198701,
		-0.452679,
		-0.515001,
		1
	}
}

return spline_matrices
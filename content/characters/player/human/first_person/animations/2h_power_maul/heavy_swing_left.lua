local spline_matrices = {
	[0] = {
		0.556565,
		-0.270988,
		-0.785367,
		0,
		0.788351,
		-0.126055,
		0.602174,
		0,
		-0.262181,
		-0.954293,
		0.143476,
		0,
		0.380532,
		0.307932,
		-0.081473,
		1
	},
	{
		0.92149,
		0.100312,
		-0.375225,
		0,
		-0.122547,
		-0.841636,
		-0.525957,
		0,
		-0.368563,
		0.530647,
		-0.763266,
		0,
		0.022245,
		-0.440246,
		-0.390785,
		1
	},
	[0.0166666666667] = {
		0.556587,
		-0.269312,
		-0.785927,
		0,
		0.783247,
		-0.145326,
		0.604487,
		0,
		-0.277011,
		-0.952025,
		0.130052,
		0,
		0.385873,
		0.299558,
		-0.078238,
		1
	},
	[0.0333333333333] = {
		0.561862,
		-0.261179,
		-0.784919,
		0,
		0.782264,
		-0.140826,
		0.606821,
		0,
		-0.269026,
		-0.954963,
		0.125186,
		0,
		0.385328,
		0.291355,
		-0.077885,
		1
	},
	[0.05] = {
		0.565157,
		-0.258692,
		-0.783375,
		0,
		0.780947,
		-0.138334,
		0.609086,
		0,
		-0.265933,
		-0.956003,
		0.123845,
		0,
		0.386107,
		0.280247,
		-0.079218,
		1
	},
	[0.0666666666667] = {
		0.572654,
		-0.255424,
		-0.77899,
		0,
		0.77644,
		-0.135944,
		0.615354,
		0,
		-0.263075,
		-0.957224,
		0.120473,
		0,
		0.386824,
		0.265985,
		-0.080738,
		1
	},
	[0.0833333333333] = {
		0.582742,
		-0.251643,
		-0.772715,
		0,
		0.769748,
		-0.133965,
		0.624132,
		0,
		-0.260575,
		-0.958504,
		0.115634,
		0,
		0.387544,
		0.249578,
		-0.082538,
		1
	},
	[0.116666666667] = {
		0.604416,
		-0.243846,
		-0.758433,
		0,
		0.753976,
		-0.132378,
		0.643425,
		0,
		-0.257296,
		-0.960737,
		0.103843,
		0,
		0.389299,
		0.214384,
		-0.087344,
		1
	},
	[0.133333333333] = {
		0.613048,
		-0.240651,
		-0.752502,
		0,
		0.747075,
		-0.133262,
		0.651245,
		0,
		-0.257003,
		-0.96142,
		0.098088,
		0,
		0.390528,
		0.197626,
		-0.090532,
		1
	},
	[0.15] = {
		0.618359,
		-0.238629,
		-0.748791,
		0,
		0.742311,
		-0.135543,
		0.656203,
		0,
		-0.258082,
		-0.961605,
		0.093323,
		0,
		0.392157,
		0.182783,
		-0.094377,
		1
	},
	[0.166666666667] = {
		0.618996,
		-0.238472,
		-0.748315,
		0,
		0.740747,
		-0.139401,
		0.657161,
		0,
		-0.261031,
		-0.961092,
		0.090359,
		0,
		0.394342,
		0.170863,
		-0.099014,
		1
	},
	[0.183333333333] = {
		0.613556,
		-0.24106,
		-0.751957,
		0,
		0.743332,
		-0.145028,
		0.653011,
		0,
		-0.26647,
		-0.959613,
		0.090205,
		0,
		0.397262,
		0.162868,
		-0.104628,
		1
	},
	[0.1] = {
		0.593835,
		-0.247659,
		-0.765523,
		0,
		0.761903,
		-0.132689,
		0.633954,
		0,
		-0.258581,
		-0.959718,
		0.109897,
		0,
		0.38834,
		0.23204,
		-0.084711,
		1
	},
	[0.216666666667] = {
		0.571445,
		-0.266481,
		-0.776169,
		0,
		0.768559,
		-0.157791,
		0.620016,
		0,
		-0.287695,
		-0.950836,
		0.114637,
		0,
		0.406249,
		0.163895,
		-0.122217,
		1
	},
	[0.233333333333] = {
		0.534558,
		-0.302107,
		-0.78929,
		0,
		0.777244,
		-0.191003,
		0.599508,
		0,
		-0.331873,
		-0.933943,
		0.132709,
		0,
		0.417575,
		0.174252,
		-0.131013,
		1
	},
	[0.25] = {
		0.511655,
		-0.339587,
		-0.789233,
		0,
		0.756978,
		-0.256364,
		0.601051,
		0,
		-0.40644,
		-0.904963,
		0.12589,
		0,
		0.432451,
		0.190645,
		-0.131401,
		1
	},
	[0.266666666667] = {
		0.518932,
		-0.351035,
		-0.779413,
		0,
		0.720678,
		-0.310688,
		0.619755,
		0,
		-0.459709,
		-0.883316,
		0.091757,
		0,
		0.437604,
		0.220038,
		-0.122581,
		1
	},
	[0.283333333333] = {
		0.541828,
		-0.330031,
		-0.772982,
		0,
		0.705171,
		-0.321923,
		0.631743,
		0,
		-0.457335,
		-0.887381,
		0.058302,
		0,
		0.424711,
		0.266632,
		-0.11415,
		1
	},
	[0.2] = {
		0.600537,
		-0.247503,
		-0.760328,
		0,
		0.750771,
		-0.152656,
		0.642681,
		0,
		-0.275134,
		-0.956785,
		0.094142,
		0,
		0.401118,
		0.159771,
		-0.111476,
		1
	},
	[0.316666666667] = {
		0.58119,
		-0.063847,
		-0.811259,
		0,
		0.809043,
		-0.061939,
		0.584477,
		0,
		-0.087565,
		-0.996036,
		0.015657,
		0,
		0.292271,
		0.438454,
		-0.097787,
		1
	},
	[0.333333333333] = {
		0.432286,
		0.30177,
		-0.849743,
		0,
		0.720651,
		0.450817,
		0.526713,
		0,
		0.542025,
		-0.840058,
		-0.022589,
		0,
		0.165963,
		0.56586,
		-0.077343,
		1
	},
	[0.35] = {
		0.111189,
		0.439022,
		-0.89157,
		0,
		0.338052,
		0.826926,
		0.449349,
		0,
		0.934536,
		-0.351359,
		-0.056467,
		0,
		0.006034,
		0.617818,
		-0.062523,
		1
	},
	[0.366666666667] = {
		-0.110446,
		0.304053,
		-0.946231,
		0,
		-0.272217,
		0.906395,
		0.323026,
		0,
		0.955876,
		0.293257,
		-0.01734,
		0,
		-0.135534,
		0.597314,
		-0.074349,
		1
	},
	[0.383333333333] = {
		-0.117667,
		0.131282,
		-0.984337,
		0,
		-0.854445,
		0.491724,
		0.167721,
		0,
		0.506041,
		0.860798,
		0.054314,
		0,
		-0.172987,
		0.456837,
		-0.103559,
		1
	},
	[0.3] = {
		0.568344,
		-0.25463,
		-0.782399,
		0,
		0.740293,
		-0.256763,
		0.62132,
		0,
		-0.359098,
		-0.932328,
		0.042571,
		0,
		0.383284,
		0.338303,
		-0.109748,
		1
	},
	[0.416666666667] = {
		-0.043076,
		0.114455,
		-0.992494,
		0,
		-0.973636,
		-0.227544,
		0.016017,
		0,
		-0.224003,
		0.967018,
		0.121239,
		0,
		-0.25211,
		0.283357,
		-0.151542,
		1
	},
	[0.433333333333] = {
		-0.020145,
		0.118038,
		-0.992805,
		0,
		-0.936077,
		-0.351058,
		-0.022745,
		0,
		-0.351217,
		0.928884,
		0.117565,
		0,
		-0.329249,
		0.223149,
		-0.156881,
		1
	},
	[0.45] = {
		-0.087108,
		0.09944,
		-0.991223,
		0,
		-0.760602,
		-0.649216,
		0.001711,
		0,
		-0.643348,
		0.754076,
		0.132186,
		0,
		-0.289753,
		0.148171,
		-0.1748,
		1
	},
	[0.466666666667] = {
		-0.188684,
		0.013864,
		-0.98194,
		0,
		-0.342802,
		-0.937932,
		0.052629,
		0,
		-0.920264,
		0.346541,
		0.181726,
		0,
		-0.219491,
		0.132163,
		-0.225617,
		1
	},
	[0.483333333333] = {
		-0.238696,
		-0.110983,
		-0.964731,
		0,
		0.146586,
		-0.986182,
		0.077182,
		0,
		-0.959967,
		-0.122993,
		0.251667,
		0,
		-0.192806,
		0.159839,
		-0.288433,
		1
	},
	[0.4] = {
		-0.078184,
		0.100456,
		-0.991865,
		0,
		-0.995332,
		-0.06433,
		0.071942,
		0,
		-0.05658,
		0.99286,
		0.105017,
		0,
		-0.151305,
		0.330825,
		-0.130965,
		1
	},
	[0.516666666667] = {
		-0.204811,
		-0.214002,
		-0.955121,
		0,
		0.556175,
		-0.828413,
		0.066349,
		0,
		-0.805433,
		-0.517625,
		0.28869,
		0,
		-0.195649,
		0.172075,
		-0.343446,
		1
	},
	[0.533333333333] = {
		-0.178262,
		-0.230638,
		-0.956571,
		0,
		0.652511,
		-0.755359,
		0.060525,
		0,
		-0.736514,
		-0.613384,
		0.285145,
		0,
		-0.211046,
		0.165656,
		-0.357852,
		1
	},
	[0.55] = {
		-0.152493,
		-0.23794,
		-0.959234,
		0,
		0.721394,
		-0.690214,
		0.056527,
		0,
		-0.675527,
		-0.683366,
		0.276901,
		0,
		-0.228122,
		0.156045,
		-0.370789,
		1
	},
	[0.566666666667] = {
		-0.128199,
		-0.237927,
		-0.962786,
		0,
		0.770124,
		-0.635561,
		0.054517,
		0,
		-0.62488,
		-0.734475,
		0.264711,
		0,
		-0.240605,
		0.145187,
		-0.382522,
		1
	},
	[0.583333333333] = {
		-0.105481,
		-0.232102,
		-0.966955,
		0,
		0.804104,
		-0.591996,
		0.054383,
		0,
		-0.585056,
		-0.771796,
		0.249078,
		0,
		-0.257478,
		0.129171,
		-0.394615,
		1
	},
	[0.5] = {
		-0.229517,
		-0.186748,
		-0.955221,
		0,
		0.427962,
		-0.900821,
		0.073284,
		0,
		-0.874168,
		-0.391979,
		0.286675,
		0,
		-0.186232,
		0.173975,
		-0.326738,
		1
	},
	[0.616666666667] = {
		-0.063505,
		-0.206933,
		-0.976292,
		0,
		0.841862,
		-0.536465,
		0.058948,
		0,
		-0.535944,
		-0.818159,
		0.208277,
		0,
		-0.279392,
		0.095297,
		-0.414523,
		1
	},
	[0.633333333333] = {
		-0.043334,
		-0.1888,
		-0.981059,
		0,
		0.84996,
		-0.523053,
		0.063116,
		0,
		-0.525063,
		-0.831126,
		0.183138,
		0,
		-0.282376,
		0.079231,
		-0.421709,
		1
	},
	[0.65] = {
		-0.023063,
		-0.167448,
		-0.985611,
		0,
		0.85252,
		-0.51824,
		0.068096,
		0,
		-0.522185,
		-0.838683,
		0.154705,
		0,
		-0.279007,
		0.0647,
		-0.426476,
		1
	},
	[0.666666666667] = {
		-0.002141,
		-0.143094,
		-0.989707,
		0,
		0.850148,
		-0.521383,
		0.073544,
		0,
		-0.52654,
		-0.84124,
		0.122767,
		0,
		-0.27104,
		0.050913,
		-0.429228,
		1
	},
	[0.683333333333] = {
		0.020006,
		-0.115903,
		-0.993059,
		0,
		0.843095,
		-0.531921,
		0.079067,
		0,
		-0.537393,
		-0.838825,
		0.087076,
		0,
		-0.260695,
		0.0365,
		-0.430713,
		1
	},
	[0.6] = {
		-0.084098,
		-0.221529,
		-0.971521,
		0,
		0.82715,
		-0.559193,
		0.055908,
		0,
		-0.555653,
		-0.798892,
		0.230264,
		0,
		-0.270816,
		0.112211,
		-0.405366,
		1
	},
	[0.716666666667] = {
		0.070375,
		-0.053667,
		-0.996076,
		0,
		0.814671,
		-0.57314,
		0.088439,
		0,
		-0.575638,
		-0.817698,
		0.003386,
		0,
		-0.233441,
		0.004186,
		-0.430056,
		1
	},
	[0.733333333333] = {
		0.099845,
		-0.019078,
		-0.99482,
		0,
		0.792692,
		-0.602774,
		0.091118,
		0,
		-0.60139,
		-0.797684,
		-0.045062,
		0,
		-0.218046,
		-0.01627,
		-0.429177,
		1
	},
	[0.75] = {
		0.133005,
		0.017346,
		-0.990964,
		0,
		0.764919,
		-0.637594,
		0.091506,
		0,
		-0.630245,
		-0.770177,
		-0.098072,
		0,
		-0.19792,
		-0.038406,
		-0.42667,
		1
	},
	[0.766666666667] = {
		0.170443,
		0.05504,
		-0.983829,
		0,
		0.730815,
		-0.676782,
		0.088747,
		0,
		-0.660953,
		-0.734124,
		-0.155577,
		0,
		-0.174384,
		-0.063958,
		-0.423112,
		1
	},
	[0.783333333333] = {
		0.212654,
		0.093226,
		-0.97267,
		0,
		0.689876,
		-0.719282,
		0.081887,
		0,
		-0.69199,
		-0.688435,
		-0.217272,
		0,
		-0.148436,
		-0.092767,
		-0.418612,
		1
	},
	[0.7] = {
		0.043972,
		-0.086031,
		-0.995322,
		0,
		0.831344,
		-0.549341,
		0.08421,
		0,
		-0.554015,
		-0.831158,
		0.047366,
		0,
		-0.248073,
		0.021099,
		-0.430957,
		1
	},
	[0.816666666667] = {
		0.312519,
		0.166678,
		-0.935174,
		0,
		0.586215,
		-0.808497,
		0.051803,
		0,
		-0.747451,
		-0.564403,
		-0.35038,
		0,
		-0.09272,
		-0.158244,
		-0.407176,
		1
	},
	[0.833333333333] = {
		0.370031,
		0.199113,
		-0.907431,
		0,
		0.5236,
		-0.851547,
		0.026662,
		0,
		-0.767411,
		-0.484997,
		-0.419354,
		0,
		-0.06419,
		-0.193112,
		-0.40006,
		1
	},
	[0.85] = {
		0.431856,
		0.226481,
		-0.873045,
		0,
		0.454612,
		-0.890668,
		-0.006177,
		0,
		-0.778992,
		-0.394229,
		-0.487601,
		0,
		-0.034504,
		-0.226557,
		-0.39012,
		1
	},
	[0.866666666667] = {
		0.496866,
		0.247073,
		-0.831913,
		0,
		0.380574,
		-0.923556,
		-0.046989,
		0,
		-0.779928,
		-0.293257,
		-0.552913,
		0,
		-0.008427,
		-0.260776,
		-0.381166,
		1
	},
	[0.883333333333] = {
		0.563486,
		0.259358,
		-0.784358,
		0,
		0.303396,
		-0.948064,
		-0.095529,
		0,
		-0.768397,
		-0.184142,
		-0.612909,
		0,
		0.013074,
		-0.29474,
		-0.373837,
		1
	},
	[0.8] = {
		0.259981,
		0.13087,
		-0.956704,
		0,
		0.641721,
		-0.763745,
		0.06991,
		0,
		-0.721529,
		-0.632112,
		-0.282541,
		0,
		-0.120937,
		-0.124404,
		-0.413262,
		1
	},
	[0.916666666667] = {
		0.693689,
		0.255106,
		-0.673584,
		0,
		0.149525,
		-0.965809,
		-0.211792,
		0,
		-0.704583,
		0.046201,
		-0.708116,
		0,
		0.039733,
		-0.35695,
		-0.366167,
		1
	},
	[0.933333333333] = {
		0.753179,
		0.238256,
		-0.613153,
		0,
		0.07821,
		-0.957926,
		-0.276155,
		0,
		-0.65315,
		0.16004,
		-0.740123,
		0,
		0.04429,
		-0.382588,
		-0.366432,
		1
	},
	[0.95] = {
		0.806577,
		0.212602,
		-0.551574,
		0,
		0.013912,
		-0.939654,
		-0.341843,
		0,
		-0.590965,
		0.268049,
		-0.760861,
		0,
		0.043021,
		-0.402997,
		-0.369442,
		1
	},
	[0.966666666667] = {
		0.852718,
		0.17971,
		-0.490485,
		0,
		-0.041564,
		-0.91264,
		-0.406645,
		0,
		-0.520715,
		0.36714,
		-0.770755,
		0,
		0.037753,
		-0.418784,
		-0.374858,
		1
	},
	[0.983333333333] = {
		0.890985,
		0.141561,
		-0.431401,
		0,
		-0.08719,
		-0.879122,
		-0.468554,
		0,
		-0.445583,
		0.455089,
		-0.770941,
		0,
		0.030594,
		-0.431157,
		-0.382166,
		1
	},
	[0.9] = {
		0.62979,
		0.262209,
		-0.731171,
		0,
		0.225482,
		-0.962483,
		-0.150943,
		0,
		-0.743319,
		-0.069804,
		-0.665285,
		0,
		0.029275,
		-0.327235,
		-0.3687,
		1
	},
	[1.01666666667] = {
		0.944766,
		0.05813,
		-0.32255,
		0,
		-0.147886,
		-0.802653,
		-0.577821,
		0,
		-0.292484,
		0.593606,
		-0.749723,
		0,
		0.013219,
		-0.446368,
		-0.400175,
		1
	},
	[1.03333333333] = {
		0.961703,
		0.016963,
		-0.273567,
		0,
		-0.163893,
		-0.764409,
		-0.623553,
		0,
		-0.219695,
		0.644509,
		-0.732354,
		0,
		0.003876,
		-0.450001,
		-0.40983,
		1
	},
	[1.05] = {
		0.973385,
		-0.021569,
		-0.228158,
		0,
		-0.171509,
		-0.72889,
		-0.6628,
		0,
		-0.152006,
		0.684291,
		-0.71319,
		0,
		-0.005584,
		-0.451783,
		-0.419242,
		1
	},
	[1.06666666667] = {
		0.980955,
		-0.056122,
		-0.185951,
		0,
		-0.171752,
		-0.69773,
		-0.695467,
		0,
		-0.090713,
		0.714159,
		-0.694081,
		0,
		-0.015103,
		-0.45239,
		-0.427974,
		1
	},
	[1.08333333333] = {
		0.985515,
		-0.08558,
		-0.14641,
		0,
		-0.165576,
		-0.672227,
		-0.721592,
		0,
		-0.036667,
		0.735382,
		-0.67666,
		0,
		-0.024731,
		-0.452487,
		-0.435663,
		1
	},
	[1.1] = {
		0.988061,
		-0.108971,
		-0.108912,
		0,
		-0.153766,
		-0.653399,
		-0.741233,
		0,
		0.00961,
		0.74913,
		-0.662354,
		0,
		-0.034586,
		-0.452691,
		-0.442006,
		1
	}
}

return spline_matrices

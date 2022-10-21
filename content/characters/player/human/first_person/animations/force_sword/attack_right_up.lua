local spline_matrices = {
	[0] = {
		0.982932,
		-0.181514,
		0.029948,
		0,
		-0.16956,
		-0.957021,
		-0.235287,
		0,
		0.071369,
		0.226194,
		-0.971464,
		0,
		0.038143,
		-0.565988,
		-0.326855,
		1
	},
	{
		0.986113,
		-0.10421,
		-0.129312,
		0,
		-0.143249,
		-0.139744,
		-0.979771,
		0,
		0.084031,
		0.984689,
		-0.152732,
		0,
		0.059668,
		-1.097404,
		-0.049142,
		1
	},
	[0.0333333333333] = {
		0.998977,
		-0.02891,
		-0.034786,
		0,
		-0.040508,
		-0.913983,
		-0.403725,
		0,
		-0.020122,
		0.404721,
		-0.914219,
		0,
		0.000811,
		-0.459886,
		-0.331632,
		1
	},
	[0.0666666666667] = {
		0.954635,
		0.265667,
		-0.134513,
		0,
		0.114953,
		-0.745486,
		-0.656534,
		0,
		-0.274697,
		0.611287,
		-0.742206,
		0,
		-0.064011,
		-0.238066,
		-0.341956,
		1
	},
	[0.133333333333] = {
		0.888956,
		0.325383,
		-0.322309,
		0,
		-0.026972,
		-0.665327,
		-0.746064,
		0,
		-0.457197,
		0.671912,
		-0.582671,
		0,
		-0.129011,
		0.161776,
		-0.35653,
		1
	},
	[0.166666666667] = {
		0.897738,
		0.168623,
		-0.40698,
		0,
		-0.189987,
		-0.685315,
		-0.703028,
		0,
		-0.397456,
		0.708456,
		-0.583197,
		0,
		-0.154082,
		0.31572,
		-0.34976,
		1
	},
	[0.1] = {
		0.896731,
		0.382642,
		-0.222391,
		0,
		0.095746,
		-0.65832,
		-0.746624,
		0,
		-0.432095,
		0.648228,
		-0.626972,
		0,
		-0.098278,
		-0.029184,
		-0.352086,
		1
	},
	[0.233333333333] = {
		0.890291,
		-0.112563,
		-0.441261,
		0,
		-0.398774,
		-0.660621,
		-0.63605,
		0,
		-0.21991,
		0.742233,
		-0.633032,
		0,
		-0.137972,
		0.433863,
		-0.286512,
		1
	},
	[0.266666666667] = {
		0.895825,
		-0.096491,
		-0.433806,
		0,
		-0.388606,
		-0.643649,
		-0.659319,
		0,
		-0.2156,
		0.759214,
		-0.614093,
		0,
		-0.097906,
		0.453163,
		-0.229984,
		1
	},
	[0.2] = {
		0.896866,
		-0.017533,
		-0.441955,
		0,
		-0.333701,
		-0.682648,
		-0.650104,
		0,
		-0.290301,
		0.730537,
		-0.618094,
		0,
		-0.161259,
		0.402177,
		-0.326495,
		1
	},
	[0.333333333333] = {
		0.914429,
		-0.012812,
		-0.404543,
		0,
		-0.343209,
		-0.554335,
		-0.758235,
		0,
		-0.214538,
		0.832195,
		-0.511297,
		0,
		-0.01958,
		0.48557,
		-0.072001,
		1
	},
	[0.366666666667] = {
		0.912876,
		0.033132,
		-0.406891,
		0,
		-0.403333,
		-0.080838,
		-0.911476,
		0,
		-0.063091,
		0.996176,
		-0.060431,
		0,
		0.035916,
		0.504061,
		0.037172,
		1
	},
	[0.3] = {
		0.906552,
		-0.058247,
		-0.418055,
		0,
		-0.360341,
		-0.622581,
		-0.694656,
		0,
		-0.219811,
		0.780384,
		-0.585391,
		0,
		-0.060084,
		0.469926,
		-0.157004,
		1
	},
	[0.433333333333] = {
		0.904722,
		0.069782,
		-0.420249,
		0,
		0.022168,
		0.977444,
		0.210027,
		0,
		0.425426,
		-0.199332,
		0.882768,
		0,
		0.14674,
		0.469117,
		0.261854,
		1
	},
	[0.466666666667] = {
		0.906235,
		0.057973,
		-0.418782,
		0,
		0.197887,
		0.817179,
		0.541349,
		0,
		0.373603,
		-0.573461,
		0.729084,
		0,
		0.188816,
		0.364942,
		0.34574,
		1
	},
	[0.4] = {
		0.904603,
		0.073592,
		-0.419855,
		0,
		-0.200046,
		0.943069,
		-0.26571,
		0,
		0.376398,
		0.324353,
		0.867825,
		0,
		0.105193,
		0.514404,
		0.176946,
		1
	},
	[0.533333333333] = {
		0.914977,
		0.016829,
		-0.403156,
		0,
		0.385174,
		0.261311,
		0.885075,
		0,
		0.120244,
		-0.965108,
		0.232611,
		0,
		0.236131,
		0.153011,
		0.448744,
		1
	},
	[0.566666666667] = {
		0.922414,
		-0.020179,
		-0.385674,
		0,
		0.382102,
		-0.097445,
		0.918968,
		0,
		-0.056126,
		-0.995036,
		-0.082174,
		0,
		0.237256,
		0.088461,
		0.425365,
		1
	},
	[0.5] = {
		0.909508,
		0.040535,
		-0.413706,
		0,
		0.318093,
		0.57283,
		0.755435,
		0,
		0.267604,
		-0.818671,
		0.508099,
		0,
		0.221827,
		0.248107,
		0.416265,
		1
	},
	[0.633333333333] = {
		0.934335,
		-0.118747,
		-0.336032,
		0,
		0.160117,
		-0.702488,
		0.69345,
		0,
		-0.318404,
		-0.701719,
		-0.637345,
		0,
		0.236896,
		-0.021021,
		0.273852,
		1
	},
	[0.666666666667] = {
		0.937879,
		-0.15724,
		-0.309287,
		0,
		0.008727,
		-0.880441,
		0.474076,
		0,
		-0.346853,
		-0.447325,
		-0.824375,
		0,
		0.234877,
		-0.086426,
		0.190318,
		1
	},
	[0.6] = {
		0.929425,
		-0.069215,
		-0.362462,
		0,
		0.299184,
		-0.43363,
		0.849973,
		0,
		-0.216005,
		-0.898429,
		-0.382318,
		0,
		0.237581,
		0.033419,
		0.359204,
		1
	},
	[0.733333333333] = {
		0.950498,
		-0.169708,
		-0.260294,
		0,
		-0.190713,
		-0.979961,
		-0.057496,
		0,
		-0.245321,
		0.104291,
		-0.963816,
		0,
		0.218628,
		-0.302239,
		0.088993,
		1
	},
	[0.766666666667] = {
		0.959499,
		-0.159843,
		-0.231975,
		0,
		-0.236718,
		-0.903894,
		-0.356287,
		0,
		-0.152731,
		0.396769,
		-0.905123,
		0,
		0.192924,
		-0.46362,
		0.051483,
		1
	},
	[0.7] = {
		0.942762,
		-0.173074,
		-0.285034,
		0,
		-0.110306,
		-0.968502,
		0.223239,
		0,
		-0.314693,
		-0.17902,
		-0.932159,
		0,
		0.231322,
		-0.174794,
		0.129751,
		1
	},
	[0.833333333333] = {
		0.975765,
		-0.131573,
		-0.174847,
		0,
		-0.218468,
		-0.540406,
		-0.812547,
		0,
		0.012421,
		0.831054,
		-0.556054,
		0,
		0.124104,
		-0.8105,
		-0.009534,
		1
	},
	[0.866666666667] = {
		0.981395,
		-0.118004,
		-0.151459,
		0,
		-0.183271,
		-0.340569,
		-0.922185,
		0,
		0.057239,
		0.932785,
		-0.355859,
		0,
		0.091965,
		-0.956838,
		-0.030787,
		1
	},
	[0.8] = {
		0.968264,
		-0.146328,
		-0.202614,
		0,
		-0.24258,
		-0.745373,
		-0.620946,
		0,
		-0.060161,
		0.65039,
		-0.757214,
		0,
		0.159587,
		-0.639568,
		0.018264,
		1
	},
	[0.933333333333] = {
		0.986113,
		-0.10421,
		-0.129312,
		0,
		-0.143249,
		-0.139744,
		-0.979771,
		0,
		0.084031,
		0.984689,
		-0.152732,
		0,
		0.059668,
		-1.097404,
		-0.049142,
		1
	},
	[0.966666666667] = {
		0.986113,
		-0.10421,
		-0.129312,
		0,
		-0.143249,
		-0.139744,
		-0.979771,
		0,
		0.084031,
		0.984689,
		-0.152732,
		0,
		0.059668,
		-1.097404,
		-0.049142,
		1
	},
	[0.9] = {
		0.984891,
		-0.108066,
		-0.135322,
		0,
		-0.154451,
		-0.194704,
		-0.968625,
		0,
		0.078328,
		0.974891,
		-0.208453,
		0,
		0.068657,
		-1.058999,
		-0.044365,
		1
	},
	[1.03333333333] = {
		0.986113,
		-0.10421,
		-0.129312,
		0,
		-0.143249,
		-0.139744,
		-0.979771,
		0,
		0.084031,
		0.984689,
		-0.152732,
		0,
		0.059668,
		-1.097404,
		-0.049142,
		1
	},
	[1.06666666667] = {
		0.986113,
		-0.10421,
		-0.129312,
		0,
		-0.143249,
		-0.139744,
		-0.979771,
		0,
		0.084031,
		0.984689,
		-0.152732,
		0,
		0.059668,
		-1.097404,
		-0.049142,
		1
	},
	[1.13333333333] = {
		0.986113,
		-0.10421,
		-0.129312,
		0,
		-0.143249,
		-0.139744,
		-0.979771,
		0,
		0.084031,
		0.984689,
		-0.152732,
		0,
		0.059668,
		-1.097404,
		-0.049142,
		1
	},
	[1.16666666667] = {
		0.986113,
		-0.10421,
		-0.129312,
		0,
		-0.143249,
		-0.139744,
		-0.979771,
		0,
		0.084031,
		0.984689,
		-0.152732,
		0,
		0.059668,
		-1.097404,
		-0.049142,
		1
	},
	[1.1] = {
		0.986113,
		-0.10421,
		-0.129312,
		0,
		-0.143249,
		-0.139744,
		-0.979771,
		0,
		0.084031,
		0.984689,
		-0.152732,
		0,
		0.059668,
		-1.097404,
		-0.049142,
		1
	},
	[1.23333333333] = {
		0.986113,
		-0.10421,
		-0.129312,
		0,
		-0.143249,
		-0.139744,
		-0.979771,
		0,
		0.084031,
		0.984689,
		-0.152732,
		0,
		0.059668,
		-1.097404,
		-0.049142,
		1
	},
	[1.26666666667] = {
		0.986113,
		-0.10421,
		-0.129312,
		0,
		-0.143249,
		-0.139744,
		-0.979771,
		0,
		0.084031,
		0.984689,
		-0.152732,
		0,
		0.059668,
		-1.097404,
		-0.049142,
		1
	},
	[1.2] = {
		0.986113,
		-0.10421,
		-0.129312,
		0,
		-0.143249,
		-0.139744,
		-0.979771,
		0,
		0.084031,
		0.984689,
		-0.152732,
		0,
		0.059668,
		-1.097404,
		-0.049142,
		1
	},
	[1.33333333333] = {
		0.986113,
		-0.10421,
		-0.129312,
		0,
		-0.143249,
		-0.139744,
		-0.979771,
		0,
		0.084031,
		0.984689,
		-0.152732,
		0,
		0.059668,
		-1.097404,
		-0.049142,
		1
	},
	[1.3] = {
		0.986113,
		-0.10421,
		-0.129312,
		0,
		-0.143249,
		-0.139744,
		-0.979771,
		0,
		0.084031,
		0.984689,
		-0.152732,
		0,
		0.059668,
		-1.097404,
		-0.049142,
		1
	}
}

return spline_matrices
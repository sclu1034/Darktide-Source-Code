local spline_matrices = {
	[0] = {
		0.722507,
		-0.503251,
		-0.474048,
		0,
		0.258524,
		-0.439271,
		0.860352,
		0,
		-0.641209,
		-0.744164,
		-0.187275,
		0,
		-0.851896,
		0.635522,
		-0.62313,
		1
	},
	[0.0333333333333] = {
		0.756565,
		-0.40123,
		-0.516356,
		0,
		0.379652,
		-0.37341,
		0.846421,
		0,
		-0.532422,
		-0.836409,
		-0.130181,
		0,
		-0.823764,
		0.59386,
		-0.646307,
		1
	},
	[0.0666666666667] = {
		0.771768,
		-0.295797,
		-0.56292,
		0,
		0.488926,
		-0.290001,
		0.822709,
		0,
		-0.406603,
		-0.910166,
		-0.079191,
		0,
		-0.771579,
		0.532875,
		-0.700762,
		1
	},
	[0.133333333333] = {
		0.753038,
		-0.269476,
		-0.600263,
		0,
		0.547351,
		-0.249737,
		0.798773,
		0,
		-0.365158,
		-0.930061,
		-0.040564,
		0,
		-0.786532,
		0.435194,
		-0.69894,
		1
	},
	[0.166666666667] = {
		0.725792,
		-0.354728,
		-0.589401,
		0,
		0.501868,
		-0.312944,
		0.806347,
		0,
		-0.470483,
		-0.881042,
		-0.049105,
		0,
		-0.890254,
		0.402434,
		-0.634941,
		1
	},
	[0.1] = {
		0.767818,
		-0.237989,
		-0.594825,
		0,
		0.549688,
		-0.232191,
		0.802453,
		0,
		-0.329088,
		-0.943106,
		-0.047461,
		0,
		-0.740654,
		0.475933,
		-0.728344,
		1
	},
	[0.233333333333] = {
		0.698373,
		-0.441581,
		-0.563278,
		0,
		0.448515,
		-0.3433,
		0.825215,
		0,
		-0.557772,
		-0.828946,
		-0.041695,
		0,
		-1.033214,
		0.31381,
		-0.483287,
		1
	},
	[0.266666666667] = {
		0.781542,
		-0.271577,
		-0.561638,
		0,
		0.541383,
		-0.1521,
		0.826904,
		0,
		-0.309994,
		-0.950322,
		0.028155,
		0,
		-1.000723,
		0.205542,
		-0.413808,
		1
	},
	[0.2] = {
		0.696579,
		-0.430426,
		-0.57403,
		0,
		0.450864,
		-0.359763,
		0.81688,
		0,
		-0.558121,
		-0.827831,
		-0.056539,
		0,
		-0.99092,
		0.366584,
		-0.556446,
		1
	},
	[0.333333333333] = {
		0.796116,
		0.001402,
		-0.605143,
		0,
		0.593458,
		0.193768,
		0.781192,
		0,
		0.118353,
		-0.981046,
		0.15343,
		0,
		-0.813778,
		0.062925,
		-0.277633,
		1
	},
	[0.366666666667] = {
		0.655924,
		-0.448316,
		-0.60727,
		0,
		0.559765,
		-0.250819,
		0.78978,
		0,
		-0.506385,
		-0.857965,
		0.086434,
		0,
		-0.685881,
		0.496634,
		-0.241278,
		1
	},
	[0.3] = {
		0.811073,
		-0.018132,
		-0.584664,
		0,
		0.581847,
		0.127737,
		0.803204,
		0,
		0.06012,
		-0.991642,
		0.114154,
		0,
		-0.911592,
		0.096318,
		-0.340183,
		1
	},
	[0.433333333333] = {
		-0.631814,
		-0.637931,
		-0.440289,
		0,
		-0.215052,
		-0.40146,
		0.890271,
		0,
		-0.74469,
		0.657171,
		0.11646,
		0,
		-0.0522,
		1.454738,
		-0.206391,
		1
	},
	[0.466666666667] = {
		-0.893169,
		-0.286515,
		-0.34664,
		0,
		-0.285397,
		-0.234577,
		0.929259,
		0,
		-0.34756,
		0.928915,
		0.127747,
		0,
		0.365847,
		1.508327,
		-0.213342,
		1
	},
	[0.4] = {
		0.083263,
		-0.785442,
		-0.613309,
		0,
		0.134095,
		-0.601018,
		0.787906,
		0,
		-0.987464,
		-0.147845,
		0.055281,
		0,
		-0.416159,
		1.177537,
		-0.207578,
		1
	},
	[0.533333333333] = {
		-0.773573,
		0.54388,
		-0.325239,
		0,
		-0.397102,
		-0.016064,
		0.917634,
		0,
		0.493858,
		0.83901,
		0.228402,
		0,
		1.208398,
		0.950165,
		-0.309482,
		1
	},
	[0.566666666667] = {
		-0.714276,
		0.665259,
		-0.217347,
		0,
		-0.305747,
		-0.01726,
		0.951956,
		0,
		0.629546,
		0.746413,
		0.215729,
		0,
		1.408104,
		0.598828,
		-0.489634,
		1
	},
	[0.5] = {
		-0.931193,
		0.1674,
		-0.323815,
		0,
		-0.342688,
		-0.099168,
		0.9342,
		0,
		0.124273,
		0.980889,
		0.14971,
		0,
		0.897293,
		1.273687,
		-0.24388,
		1
	},
	[0.633333333333] = {
		-0.725804,
		0.680236,
		0.102411,
		0,
		0.022255,
		-0.125577,
		0.991834,
		0,
		0.687542,
		0.722156,
		0.076006,
		0,
		1.455921,
		0.244112,
		-0.804748,
		1
	},
	[0.666666666667] = {
		-0.722537,
		0.622812,
		0.300077,
		0,
		0.233815,
		-0.188329,
		0.953867,
		0,
		0.650593,
		0.759367,
		-0.009548,
		0,
		1.326746,
		0.165334,
		-0.948808,
		1
	},
	[0.6] = {
		-0.718206,
		0.6924,
		-0.069009,
		0,
		-0.156831,
		-0.064453,
		0.98552,
		0,
		0.677926,
		0.718629,
		0.15488,
		0,
		1.507704,
		0.34919,
		-0.666449,
		1
	},
	[0.733333333333] = {
		-0.598619,
		0.414721,
		0.685319,
		0,
		0.652563,
		-0.243694,
		0.717478,
		0,
		0.464561,
		0.87671,
		-0.124752,
		0,
		0.972443,
		0.076046,
		-1.187396,
		1
	},
	[0.766666666667] = {
		-0.471597,
		0.302346,
		0.828361,
		0,
		0.808882,
		-0.22575,
		0.542905,
		0,
		0.351148,
		0.92608,
		-0.138099,
		0,
		0.822523,
		0.058429,
		-1.254305,
		1
	},
	[0.7] = {
		-0.683869,
		0.528627,
		0.502869,
		0,
		0.453537,
		-0.231884,
		0.860543,
		0,
		0.571514,
		0.816568,
		-0.081174,
		0,
		1.153403,
		0.110552,
		-1.081509,
		1
	},
	[0.833333333333] = {
		-0.316717,
		0.209783,
		0.925031,
		0,
		0.914098,
		-0.192837,
		0.356706,
		0,
		0.253211,
		0.958543,
		-0.130687,
		0,
		0.742046,
		0.054614,
		-1.273091,
		1
	},
	[0.866666666667] = {
		-0.316178,
		0.210594,
		0.925031,
		0,
		0.913601,
		-0.195178,
		0.356706,
		0,
		0.255666,
		0.957891,
		-0.130687,
		0,
		0.742183,
		0.052713,
		-1.273091,
		1
	},
	[0.8] = {
		-0.317296,
		0.208905,
		0.925031,
		0,
		0.914628,
		-0.190306,
		0.356706,
		0,
		0.250556,
		0.95924,
		-0.130687,
		0,
		0.741892,
		0.056668,
		-1.273091,
		1
	},
	[0.933333333333] = {
		-0.315425,
		0.21172,
		0.925031,
		0,
		0.912899,
		-0.198436,
		0.356706,
		0,
		0.259081,
		0.956973,
		-0.130687,
		0,
		0.742367,
		0.050065,
		-1.273091,
		1
	},
	[0.966666666667] = {
		-0.315312,
		0.211888,
		0.925031,
		0,
		0.912793,
		-0.198923,
		0.356706,
		0,
		0.259592,
		0.956835,
		-0.130687,
		0,
		0.742393,
		0.049669,
		-1.273091,
		1
	},
	[0.9] = {
		-0.315731,
		0.211264,
		0.925031,
		0,
		0.913185,
		-0.197116,
		0.356706,
		0,
		0.257698,
		0.957347,
		-0.130687,
		0,
		0.742293,
		0.051138,
		-1.273091,
		1
	}
}

return spline_matrices
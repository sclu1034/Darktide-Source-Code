local spline_matrices = {
	[0] = {
		0.88938,
		0.061119,
		0.453065,
		0,
		-0.415047,
		-0.307556,
		0.856239,
		0,
		0.191676,
		-0.949565,
		-0.248167,
		0,
		0.592246,
		-0.356475,
		0.709907,
		1
	},
	[0.0166666666667] = {
		0.881954,
		0.117967,
		0.456334,
		0,
		-0.417252,
		-0.254891,
		0.872314,
		0,
		0.21922,
		-0.959747,
		-0.17558,
		0,
		0.579007,
		-0.303549,
		0.737429,
		1
	},
	[0.0333333333333] = {
		0.86999,
		0.175984,
		0.460594,
		0,
		-0.425244,
		-0.205015,
		0.881553,
		0,
		0.249568,
		-0.962808,
		-0.103525,
		0,
		0.565574,
		-0.254974,
		0.766446,
		1
	},
	[0.05] = {
		0.855011,
		0.234402,
		0.462614,
		0,
		-0.436512,
		-0.156379,
		0.886004,
		0,
		0.280025,
		-0.95948,
		-0.031387,
		0,
		0.551824,
		-0.207905,
		0.795729,
		1
	},
	[0.0666666666667] = {
		0.838889,
		0.292229,
		0.459204,
		0,
		-0.448496,
		-0.106915,
		0.887367,
		0,
		0.30841,
		-0.950353,
		0.041373,
		0,
		0.537681,
		-0.159397,
		0.823981,
		1
	},
	[0.0833333333333] = {
		0.823829,
		0.348248,
		0.447246,
		0,
		-0.458659,
		-0.054083,
		0.886965,
		0,
		0.333072,
		-0.935841,
		0.115172,
		0,
		0.5231,
		-0.106406,
		0.849831,
		1
	},
	[0.116666666667] = {
		0.806623,
		0.448121,
		0.385417,
		0,
		-0.463029,
		0.073783,
		0.883267,
		0,
		0.367373,
		-0.890923,
		0.267008,
		0,
		0.4927,
		0.025651,
		0.888279,
		1
	},
	[0.133333333333] = {
		0.809054,
		0.48675,
		0.329403,
		0,
		-0.451251,
		0.155352,
		0.878771,
		0,
		0.376568,
		-0.859616,
		0.345335,
		0,
		0.47716,
		0.111197,
		0.897415,
		1
	},
	[0.15] = {
		0.818991,
		0.516531,
		0.2499,
		0,
		-0.419171,
		0.241148,
		0.875296,
		0,
		0.391855,
		-0.82161,
		0.414012,
		0,
		0.467422,
		0.215048,
		0.89324,
		1
	},
	[0.166666666667] = {
		0.83355,
		0.532194,
		0.1482,
		0,
		-0.368211,
		0.335221,
		0.867207,
		0,
		0.411842,
		-0.777429,
		0.475383,
		0,
		0.460552,
		0.346479,
		0.865975,
		1
	},
	[0.183333333333] = {
		0.853619,
		0.519952,
		0.031387,
		0,
		-0.309158,
		0.457214,
		0.833893,
		0,
		0.419233,
		-0.72153,
		0.551034,
		0,
		0.444059,
		0.51636,
		0.807065,
		1
	},
	[0.1] = {
		0.81226,
		0.400917,
		0.423673,
		0,
		-0.464427,
		0.005068,
		0.885597,
		0,
		0.352904,
		-0.9161,
		0.190313,
		0,
		0.508081,
		-0.045795,
		0.871804,
		1
	},
	[0.216666666667] = {
		0.93839,
		0.272752,
		-0.212204,
		0,
		-0.095016,
		0.794026,
		0.600412,
		0,
		0.332259,
		-0.543258,
		0.771022,
		0,
		0.356833,
		1.028677,
		0.553824,
		1
	},
	[0.233333333333] = {
		0.965555,
		0.073904,
		-0.249482,
		0,
		-0.020866,
		0.97772,
		0.208873,
		0,
		0.25936,
		-0.196473,
		0.945585,
		0,
		0.251502,
		1.391658,
		0.275842,
		1
	},
	[0.25] = {
		0.982877,
		0.112471,
		-0.145957,
		0,
		-0.183615,
		0.531417,
		-0.826971,
		0,
		-0.015446,
		0.839611,
		0.542969,
		0,
		0.010135,
		1.667208,
		-0.330053,
		1
	},
	[0.266666666667] = {
		0.971923,
		0.157667,
		-0.174664,
		0,
		-0.228789,
		0.459806,
		-0.858041,
		0,
		-0.054973,
		0.873911,
		0.482968,
		0,
		-0.112304,
		1.790876,
		-0.646277,
		1
	},
	[0.283333333333] = {
		0.92706,
		0.166842,
		-0.335742,
		0,
		-0.349481,
		0.060369,
		-0.934997,
		0,
		-0.135728,
		0.984134,
		0.114274,
		0,
		-0.255738,
		1.62686,
		-1.01277,
		1
	},
	[0.2] = {
		0.883253,
		0.460082,
		-0.090493,
		0,
		-0.246736,
		0.620147,
		0.744674,
		0,
		0.39873,
		-0.635408,
		0.661265,
		0,
		0.406655,
		0.735344,
		0.706069,
		1
	},
	[0.316666666667] = {
		0.8316,
		-0.029737,
		-0.554578,
		0,
		-0.492524,
		-0.500918,
		-0.711689,
		0,
		-0.256634,
		0.864984,
		-0.43121,
		0,
		-0.356047,
		1.111796,
		-1.385967,
		1
	},
	[0.333333333333] = {
		0.795943,
		-0.141751,
		-0.588542,
		0,
		-0.556143,
		-0.555237,
		-0.618398,
		0,
		-0.239122,
		0.819523,
		-0.520771,
		0,
		-0.310849,
		0.8574,
		-1.410597,
		1
	},
	[0.35] = {
		0.754068,
		-0.253149,
		-0.60605,
		0,
		-0.623164,
		-0.567246,
		-0.538422,
		0,
		-0.207478,
		0.783676,
		-0.585495,
		0,
		-0.246881,
		0.599774,
		-1.404454,
		1
	},
	[0.366666666667] = {
		0.703677,
		-0.36365,
		-0.610408,
		0,
		-0.683814,
		-0.579933,
		-0.442804,
		0,
		-0.19297,
		0.728997,
		-0.656754,
		0,
		-0.192147,
		0.346377,
		-1.411768,
		1
	},
	[0.383333333333] = {
		0.703677,
		-0.36365,
		-0.610408,
		0,
		-0.683814,
		-0.579933,
		-0.442804,
		0,
		-0.19297,
		0.728997,
		-0.656754,
		0,
		-0.192147,
		0.346377,
		-1.411768,
		1
	},
	[0.3] = {
		0.869288,
		0.078992,
		-0.487954,
		0,
		-0.434835,
		-0.347239,
		-0.830869,
		0,
		-0.235068,
		0.934444,
		-0.267502,
		0,
		-0.353662,
		1.356986,
		-1.282186,
		1
	},
	[0.416666666667] = {
		0.703677,
		-0.36365,
		-0.610408,
		0,
		-0.683814,
		-0.579933,
		-0.442804,
		0,
		-0.19297,
		0.728997,
		-0.656754,
		0,
		-0.192147,
		0.346377,
		-1.411768,
		1
	},
	[0.433333333333] = {
		0.703677,
		-0.36365,
		-0.610408,
		0,
		-0.683814,
		-0.579933,
		-0.442804,
		0,
		-0.19297,
		0.728997,
		-0.656754,
		0,
		-0.192147,
		0.346377,
		-1.411768,
		1
	},
	[0.45] = {
		0.703677,
		-0.36365,
		-0.610408,
		0,
		-0.683814,
		-0.579933,
		-0.442804,
		0,
		-0.19297,
		0.728997,
		-0.656754,
		0,
		-0.192147,
		0.346377,
		-1.411768,
		1
	},
	[0.466666666667] = {
		0.703677,
		-0.36365,
		-0.610408,
		0,
		-0.683814,
		-0.579933,
		-0.442804,
		0,
		-0.19297,
		0.728997,
		-0.656754,
		0,
		-0.192147,
		0.346377,
		-1.411768,
		1
	},
	[0.483333333333] = {
		0.703677,
		-0.36365,
		-0.610408,
		0,
		-0.683814,
		-0.579933,
		-0.442804,
		0,
		-0.19297,
		0.728997,
		-0.656754,
		0,
		-0.192147,
		0.346377,
		-1.411768,
		1
	},
	[0.4] = {
		0.703677,
		-0.36365,
		-0.610408,
		0,
		-0.683814,
		-0.579933,
		-0.442804,
		0,
		-0.19297,
		0.728997,
		-0.656754,
		0,
		-0.192147,
		0.346377,
		-1.411768,
		1
	},
	[0.516666666667] = {
		0.703677,
		-0.36365,
		-0.610408,
		0,
		-0.683814,
		-0.579933,
		-0.442804,
		0,
		-0.19297,
		0.728997,
		-0.656754,
		0,
		-0.192146,
		0.346377,
		-1.411768,
		1
	},
	[0.533333333333] = {
		0.703677,
		-0.36365,
		-0.610408,
		0,
		-0.683814,
		-0.579933,
		-0.442804,
		0,
		-0.19297,
		0.728997,
		-0.656754,
		0,
		-0.192146,
		0.346377,
		-1.411768,
		1
	},
	[0.55] = {
		0.703677,
		-0.36365,
		-0.610408,
		0,
		-0.683814,
		-0.579933,
		-0.442804,
		0,
		-0.19297,
		0.728997,
		-0.656754,
		0,
		-0.192146,
		0.346377,
		-1.411768,
		1
	},
	[0.566666666667] = {
		0.703677,
		-0.36365,
		-0.610408,
		0,
		-0.683814,
		-0.579933,
		-0.442804,
		0,
		-0.19297,
		0.728997,
		-0.656754,
		0,
		-0.192146,
		0.346377,
		-1.411768,
		1
	},
	[0.583333333333] = {
		0.703677,
		-0.36365,
		-0.610408,
		0,
		-0.683814,
		-0.579933,
		-0.442804,
		0,
		-0.19297,
		0.728997,
		-0.656754,
		0,
		-0.192146,
		0.346377,
		-1.411768,
		1
	},
	[0.5] = {
		0.703677,
		-0.36365,
		-0.610408,
		0,
		-0.683814,
		-0.579933,
		-0.442804,
		0,
		-0.19297,
		0.728997,
		-0.656754,
		0,
		-0.192146,
		0.346377,
		-1.411768,
		1
	},
	[0.616666666667] = {
		0.703677,
		-0.36365,
		-0.610408,
		0,
		-0.683814,
		-0.579933,
		-0.442804,
		0,
		-0.19297,
		0.728997,
		-0.656754,
		0,
		-0.192146,
		0.346377,
		-1.411768,
		1
	},
	[0.633333333333] = {
		0.703677,
		-0.36365,
		-0.610408,
		0,
		-0.683814,
		-0.579933,
		-0.442804,
		0,
		-0.19297,
		0.728997,
		-0.656754,
		0,
		-0.192146,
		0.346377,
		-1.411768,
		1
	},
	[0.65] = {
		0.703677,
		-0.36365,
		-0.610408,
		0,
		-0.683814,
		-0.579933,
		-0.442804,
		0,
		-0.19297,
		0.728997,
		-0.656754,
		0,
		-0.192146,
		0.346377,
		-1.411768,
		1
	},
	[0.666666666667] = {
		0.703677,
		-0.36365,
		-0.610408,
		0,
		-0.683814,
		-0.579933,
		-0.442804,
		0,
		-0.19297,
		0.728997,
		-0.656754,
		0,
		-0.192146,
		0.346377,
		-1.411768,
		1
	},
	[0.683333333333] = {
		0.703677,
		-0.36365,
		-0.610408,
		0,
		-0.683814,
		-0.579933,
		-0.442804,
		0,
		-0.19297,
		0.728997,
		-0.656754,
		0,
		-0.192146,
		0.346377,
		-1.411768,
		1
	},
	[0.6] = {
		0.703677,
		-0.36365,
		-0.610408,
		0,
		-0.683814,
		-0.579933,
		-0.442804,
		0,
		-0.19297,
		0.728997,
		-0.656754,
		0,
		-0.192146,
		0.346377,
		-1.411768,
		1
	},
	[0.716666666667] = {
		0.703677,
		-0.36365,
		-0.610408,
		0,
		-0.683814,
		-0.579933,
		-0.442804,
		0,
		-0.19297,
		0.728997,
		-0.656754,
		0,
		-0.192146,
		0.346377,
		-1.411768,
		1
	},
	[0.733333333333] = {
		0.703677,
		-0.36365,
		-0.610408,
		0,
		-0.683814,
		-0.579933,
		-0.442804,
		0,
		-0.19297,
		0.728997,
		-0.656754,
		0,
		-0.192146,
		0.346377,
		-1.411768,
		1
	},
	[0.7] = {
		0.703677,
		-0.36365,
		-0.610408,
		0,
		-0.683814,
		-0.579933,
		-0.442804,
		0,
		-0.19297,
		0.728997,
		-0.656754,
		0,
		-0.192146,
		0.346377,
		-1.411768,
		1
	}
}

return spline_matrices

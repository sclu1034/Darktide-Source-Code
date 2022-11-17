local spline_matrices = {
	[0] = {
		-0.807351,
		0.527905,
		0.263627,
		0,
		0.589166,
		0.69646,
		0.409666,
		0,
		0.032659,
		0.486065,
		-0.873312,
		0,
		-0.009483,
		0.017107,
		-0.590287,
		1
	},
	{
		-0.786641,
		0.535535,
		0.307243,
		0,
		0.616872,
		0.702518,
		0.354877,
		0,
		-0.025795,
		0.468691,
		-0.882986,
		0,
		-0.039801,
		0.030228,
		-0.586892,
		1
	},
	[0.0166666666667] = {
		-0.785493,
		0.611342,
		0.096242,
		0,
		0.613069,
		0.747417,
		0.255958,
		0,
		0.084545,
		0.260056,
		-0.961885,
		0,
		-0.037199,
		-0.001211,
		-0.542175,
		1
	},
	[0.0333333333333] = {
		-0.749652,
		0.652355,
		-0.111599,
		0,
		0.648687,
		0.757682,
		0.071577,
		0,
		0.13125,
		-0.018735,
		-0.991172,
		0,
		-0.064562,
		-0.021293,
		-0.490781,
		1
	},
	[0.05] = {
		-0.69972,
		0.627233,
		-0.34201,
		0,
		0.695383,
		0.707731,
		-0.124738,
		0,
		0.163811,
		-0.325109,
		-0.931381,
		0,
		-0.091523,
		-0.040621,
		-0.436801,
		1
	},
	[0.0666666666667] = {
		-0.641473,
		0.527194,
		-0.557296,
		0,
		0.747238,
		0.593812,
		-0.298368,
		0,
		0.173631,
		-0.607827,
		-0.774854,
		0,
		-0.117834,
		-0.056385,
		-0.382163,
		1
	},
	[0.0833333333333] = {
		-0.585401,
		0.375415,
		-0.718589,
		0,
		0.794773,
		0.440792,
		-0.417179,
		0,
		0.160133,
		-0.815332,
		-0.556409,
		0,
		-0.142878,
		-0.066724,
		-0.330056,
		1
	},
	[0.116666666667] = {
		-0.509224,
		0.10146,
		-0.854632,
		0,
		0.853921,
		0.18335,
		-0.487033,
		0,
		0.107282,
		-0.977798,
		-0.180006,
		0,
		-0.185698,
		-0.071571,
		-0.245432,
		1
	},
	[0.133333333333] = {
		-0.491611,
		0.036142,
		-0.870064,
		0,
		0.865374,
		0.131787,
		-0.483487,
		0,
		0.097189,
		-0.990619,
		-0.096064,
		0,
		-0.20436,
		-0.070248,
		-0.213146,
		1
	},
	[0.15] = {
		-0.482878,
		0.007167,
		-0.875658,
		0,
		0.86946,
		0.122973,
		-0.478453,
		0,
		0.104254,
		-0.992384,
		-0.065612,
		0,
		-0.223363,
		-0.069214,
		-0.183883,
		1
	},
	[0.166666666667] = {
		-0.477486,
		0.003726,
		-0.878632,
		0,
		0.870394,
		0.138685,
		-0.472421,
		0,
		0.120093,
		-0.99033,
		-0.069464,
		0,
		-0.241793,
		-0.066759,
		-0.15781,
		1
	},
	[0.183333333333] = {
		-0.471092,
		0.016157,
		-0.881936,
		0,
		0.871548,
		0.162601,
		-0.462564,
		0,
		0.13593,
		-0.98656,
		-0.090682,
		0,
		-0.258731,
		-0.06109,
		-0.135269,
		1
	},
	[0.1] = {
		-0.540407,
		0.218794,
		-0.812459,
		0,
		0.830785,
		0.291674,
		-0.474049,
		0,
		0.133253,
		-0.931158,
		-0.339394,
		0,
		-0.165775,
		-0.071495,
		-0.283745,
		1
	},
	[0.216666666667] = {
		-0.435543,
		0.051454,
		-0.898696,
		0,
		0.890593,
		0.169855,
		-0.421892,
		0,
		0.13094,
		-0.984125,
		-0.119804,
		0,
		-0.284603,
		-0.032973,
		-0.102021,
		1
	},
	[0.233333333333] = {
		-0.394638,
		0.052579,
		-0.917331,
		0,
		0.914543,
		0.118874,
		-0.386625,
		0,
		0.088718,
		-0.991516,
		-0.094998,
		0,
		-0.291006,
		-0.00697,
		-0.092572,
		1
	},
	[0.25] = {
		-0.318755,
		0.027364,
		-0.947442,
		0,
		0.94769,
		0.026818,
		-0.318063,
		0,
		0.016705,
		-0.999266,
		-0.034481,
		0,
		-0.295647,
		0.051577,
		-0.088242,
		1
	},
	[0.266666666667] = {
		-0.215214,
		-0.019012,
		-0.976382,
		0,
		0.972549,
		-0.094777,
		-0.212524,
		0,
		-0.088498,
		-0.995317,
		0.038888,
		0,
		-0.299093,
		0.151017,
		-0.086667,
		1
	},
	[0.283333333333] = {
		-0.118557,
		-0.073324,
		-0.990236,
		0,
		0.963544,
		-0.249387,
		-0.096894,
		0,
		-0.239847,
		-0.965624,
		0.100218,
		0,
		-0.295053,
		0.270036,
		-0.08587,
		1
	},
	[0.2] = {
		-0.458997,
		0.035317,
		-0.887736,
		0,
		0.87689,
		0.178591,
		-0.446284,
		0,
		0.14278,
		-0.983289,
		-0.112942,
		0,
		-0.273291,
		-0.050415,
		-0.116582,
		1
	},
	[0.316666666667] = {
		-0.070136,
		-0.103629,
		-0.99214,
		0,
		0.688363,
		-0.724861,
		0.02705,
		0,
		-0.721967,
		-0.681056,
		0.122173,
		0,
		-0.222289,
		0.511282,
		-0.077258,
		1
	},
	[0.333333333333] = {
		-0.128706,
		-0.000958,
		-0.991682,
		0,
		0.155264,
		-0.987686,
		-0.019197,
		0,
		-0.979453,
		-0.156444,
		0.12727,
		0,
		-0.043652,
		0.620805,
		-0.069978,
		1
	},
	[0.35] = {
		-0.121276,
		0.022385,
		-0.992366,
		0,
		-0.451651,
		-0.891504,
		0.035086,
		0,
		-0.883914,
		0.452459,
		0.118229,
		0,
		0.191326,
		0.635832,
		-0.072759,
		1
	},
	[0.366666666667] = {
		-0.100386,
		0.082195,
		-0.991548,
		0,
		-0.900703,
		-0.43088,
		0.055471,
		0,
		-0.422678,
		0.898658,
		0.117287,
		0,
		0.442008,
		0.577335,
		-0.072692,
		1
	},
	[0.383333333333] = {
		-0.053454,
		0.121683,
		-0.991129,
		0,
		-0.997579,
		-0.050734,
		0.047573,
		0,
		-0.044495,
		0.991272,
		0.124101,
		0,
		0.557226,
		0.485733,
		-0.070763,
		1
	},
	[0.3] = {
		-0.060952,
		-0.115537,
		-0.991431,
		0,
		0.896328,
		-0.443379,
		-0.003436,
		0,
		-0.439183,
		-0.888857,
		0.130583,
		0,
		-0.276833,
		0.387997,
		-0.083788,
		1
	},
	[0.416666666667] = {
		0.046497,
		0.117322,
		-0.992005,
		0,
		-0.700039,
		0.712251,
		0.051424,
		0,
		0.71259,
		0.692051,
		0.115247,
		0,
		0.724225,
		0.231073,
		-0.067549,
		1
	},
	[0.433333333333] = {
		0.062051,
		0.132911,
		-0.989184,
		0,
		-0.529064,
		0.844772,
		0.080319,
		0,
		0.84631,
		0.518358,
		0.122737,
		0,
		0.754327,
		0.143017,
		-0.074722,
		1
	},
	[0.45] = {
		0.069411,
		0.16339,
		-0.984117,
		0,
		-0.417192,
		0.900843,
		0.120139,
		0,
		0.906164,
		0.402227,
		0.130693,
		0,
		0.772252,
		0.068324,
		-0.095569,
		1
	},
	[0.466666666667] = {
		0.069644,
		0.207574,
		-0.975737,
		0,
		-0.365807,
		0.915291,
		0.168605,
		0,
		0.928081,
		0.345189,
		0.139677,
		0,
		0.780963,
		0.00457,
		-0.12753,
		1
	},
	[0.483333333333] = {
		0.061206,
		0.263111,
		-0.962822,
		0,
		-0.364902,
		0.903755,
		0.223773,
		0,
		0.929032,
		0.337639,
		0.151325,
		0,
		0.78196,
		-0.049866,
		-0.16802,
		1
	},
	[0.4] = {
		-0.033426,
		0.126681,
		-0.99138,
		0,
		-0.972026,
		0.226618,
		0.061732,
		0,
		0.232485,
		0.96571,
		0.115562,
		0,
		0.627826,
		0.383904,
		-0.069922,
		1
	},
	[0.516666666667] = {
		0.007385,
		0.393224,
		-0.919413,
		0,
		-0.464776,
		0.81544,
		0.345022,
		0,
		0.885397,
		0.424773,
		0.188783,
		0,
		0.76428,
		-0.133898,
		-0.264187,
		1
	},
	[0.533333333333] = {
		-0.04151,
		0.456964,
		-0.888516,
		0,
		-0.53828,
		0.738965,
		0.405198,
		0,
		0.841743,
		0.49509,
		0.2153,
		0,
		0.746986,
		-0.164879,
		-0.314714,
		1
	},
	[0.55] = {
		-0.103569,
		0.511699,
		-0.8529,
		0,
		-0.608736,
		0.64554,
		0.461213,
		0,
		0.786584,
		0.566958,
		0.244632,
		0,
		0.725142,
		-0.189729,
		-0.363589,
		1
	},
	[0.566666666667] = {
		-0.174031,
		0.553004,
		-0.814801,
		0,
		-0.664252,
		0.54491,
		0.511706,
		0,
		0.726968,
		0.630285,
		0.272502,
		0,
		0.699984,
		-0.209636,
		-0.408584,
		1
	},
	[0.583333333333] = {
		-0.246133,
		0.57966,
		-0.776797,
		0,
		-0.697002,
		0.451058,
		0.557437,
		0,
		0.673504,
		0.678632,
		0.293004,
		0,
		0.673186,
		-0.225875,
		-0.447665,
		1
	},
	[0.5] = {
		0.041302,
		0.3266,
		-0.94426,
		0,
		-0.402303,
		0.870507,
		0.283494,
		0,
		0.914574,
		0.36817,
		0.167346,
		0,
		0.776165,
		-0.095788,
		-0.214439,
		1
	},
	[0.616666666667] = {
		-0.367602,
		0.600922,
		-0.709762,
		0,
		-0.681263,
		0.345511,
		0.64537,
		0,
		0.633048,
		0.720774,
		0.282376,
		0,
		0.622846,
		-0.251632,
		-0.500623,
		1
	},
	[0.633333333333] = {
		-0.417859,
		0.602715,
		-0.6798,
		0,
		-0.637084,
		0.339061,
		0.692215,
		0,
		0.647703,
		0.722338,
		0.242301,
		0,
		0.597646,
		-0.259282,
		-0.516747,
		1
	},
	[0.65] = {
		-0.473686,
		0.59852,
		-0.646061,
		0,
		-0.578969,
		0.341155,
		0.740546,
		0,
		0.663638,
		0.724836,
		0.184925,
		0,
		0.566457,
		-0.259622,
		-0.532433,
		1
	},
	[0.666666666667] = {
		-0.533621,
		0.589466,
		-0.606447,
		0,
		-0.506368,
		0.351647,
		0.78736,
		0,
		0.677377,
		0.727237,
		0.110841,
		0,
		0.529879,
		-0.253583,
		-0.547415,
		1
	},
	[0.683333333333] = {
		-0.595693,
		0.57676,
		-0.559016,
		0,
		-0.419347,
		0.37027,
		0.828884,
		0,
		0.685054,
		0.728181,
		0.021295,
		0,
		0.488589,
		-0.242112,
		-0.561386,
		1
	},
	[0.6] = {
		-0.312773,
		0.593992,
		-0.741179,
		0,
		-0.703356,
		0.379576,
		0.601009,
		0,
		0.638328,
		0.709293,
		0.299067,
		0,
		0.646774,
		-0.239541,
		-0.478952,
		1
	},
	[0.716666666667] = {
		-0.715549,
		0.545973,
		-0.435779,
		0,
		-0.208031,
		0.428976,
		0.879035,
		0,
		0.666868,
		0.719648,
		-0.193374,
		0,
		0.395036,
		-0.206506,
		-0.584799,
		1
	},
	[0.733333333333] = {
		-0.767088,
		0.530976,
		-0.360055,
		0,
		-0.090342,
		0.466237,
		0.880035,
		0,
		0.635149,
		0.707592,
		-0.309676,
		0,
		0.344662,
		-0.184075,
		-0.593494,
		1
	},
	[0.75] = {
		-0.809105,
		0.518208,
		-0.277144,
		0,
		0.028787,
		0.505988,
		0.86206,
		0,
		0.586958,
		0.689519,
		-0.424316,
		0,
		0.293376,
		-0.159603,
		-0.599831,
		1
	},
	[0.766666666667] = {
		-0.839624,
		0.508775,
		-0.19021,
		0,
		0.143688,
		0.545758,
		0.825531,
		0,
		0.523819,
		0.665805,
		-0.531336,
		0,
		0.242398,
		-0.133831,
		-0.603758,
		1
	},
	[0.783333333333] = {
		-0.857972,
		0.503249,
		-0.103079,
		0,
		0.249195,
		0.583207,
		0.773157,
		0,
		0.449206,
		0.63766,
		-0.625782,
		0,
		0.192942,
		-0.107499,
		-0.605432,
		1
	},
	[0.7] = {
		-0.657349,
		0.561757,
		-0.502316,
		0,
		-0.319051,
		0.396418,
		0.860848,
		0,
		0.682714,
		0.726142,
		-0.081356,
		0,
		0.443351,
		-0.226127,
		-0.573979,
		1
	},
	[0.816666666667] = {
		-0.862166,
		0.5034,
		0.057082,
		0,
		0.418568,
		0.644296,
		0.640065,
		0,
		0.285431,
		0.575735,
		-0.766197,
		0,
		0.102974,
		-0.056251,
		-0.603495,
		1
	},
	[0.833333333333] = {
		-0.85247,
		0.507707,
		0.124615,
		0,
		0.480207,
		0.666264,
		0.57052,
		0,
		0.206631,
		0.546192,
		-0.811775,
		0,
		0.064289,
		-0.033035,
		-0.600842,
		1
	},
	[0.85] = {
		-0.838597,
		0.513534,
		0.181762,
		0,
		0.527562,
		0.682434,
		0.505927,
		0,
		0.13577,
		0.52016,
		-0.843208,
		0,
		0.030789,
		-0.012642,
		-0.597716,
		1
	},
	[0.866666666667] = {
		-0.823219,
		0.519896,
		0.228075,
		0,
		0.562603,
		0.693237,
		0.450444,
		0,
		0.076074,
		0.49913,
		-0.863181,
		0,
		0.003097,
		0.003955,
		-0.594533,
		1
	},
	[0.883333333333] = {
		-0.808644,
		0.525926,
		0.263624,
		0,
		0.587538,
		0.699191,
		0.407347,
		0,
		0.029911,
		0.484287,
		-0.874398,
		0,
		-0.018199,
		0.015781,
		-0.591637,
		1
	},
	[0.8] = {
		-0.864859,
		0.501632,
		-0.019573,
		0,
		0.341494,
		0.616449,
		0.709488,
		0,
		0.367968,
		0.606923,
		-0.704446,
		0,
		0.146137,
		-0.081366,
		-0.605191,
		1
	},
	[0.916666666667] = {
		-0.788149,
		0.534285,
		0.305548,
		0,
		0.614981,
		0.703685,
		0.355846,
		0,
		-0.024887,
		0.468366,
		-0.883184,
		0,
		-0.043082,
		0.028992,
		-0.587714,
		1
	},
	[0.933333333333] = {
		-0.782874,
		0.536443,
		0.315178,
		0,
		0.621038,
		0.704435,
		0.343632,
		0,
		-0.037683,
		0.464758,
		-0.884635,
		0,
		-0.048494,
		0.032257,
		-0.58669,
		1
	},
	[0.95] = {
		-0.780585,
		0.537449,
		0.319117,
		0,
		0.623584,
		0.704561,
		0.338729,
		0,
		-0.042788,
		0.463402,
		-0.885114,
		0,
		-0.050191,
		0.0337,
		-0.586184,
		1
	},
	[0.966666666667] = {
		-0.78082,
		0.537492,
		0.31847,
		0,
		0.623369,
		0.704222,
		0.339828,
		0,
		-0.041618,
		0.463869,
		-0.884926,
		0,
		-0.048863,
		0.033628,
		-0.58611,
		1
	},
	[0.983333333333] = {
		-0.783031,
		0.536783,
		0.314207,
		0,
		0.620968,
		0.703512,
		0.345645,
		0,
		-0.035512,
		0.465763,
		-0.884197,
		0,
		-0.045178,
		0.032366,
		-0.586375,
		1
	},
	[0.9] = {
		-0.796723,
		0.530813,
		0.288912,
		0,
		0.604338,
		0.702068,
		0.376665,
		0,
		-0.002897,
		0.474698,
		-0.880144,
		0,
		-0.033238,
		0.023596,
		-0.589338,
		1
	},
	[1.01666666667] = {
		-0.79107,
		0.533954,
		0.2985,
		0,
		0.611571,
		0.701317,
		0.366246,
		0,
		-0.013785,
		0.47228,
		-0.881341,
		0,
		-0.033393,
		0.027546,
		-0.58757,
		1
	},
	[1.03333333333] = {
		-0.79576,
		0.532243,
		0.288936,
		0,
		0.605612,
		0.70001,
		0.378445,
		0,
		-0.000833,
		0.476134,
		-0.879372,
		0,
		-0.02662,
		0.024636,
		-0.588319,
		1
	},
	[1.05] = {
		-0.800189,
		0.530607,
		0.27956,
		0,
		0.599634,
		0.698716,
		0.390174,
		0,
		0.011696,
		0.479847,
		-0.877274,
		0,
		-0.020157,
		0.021815,
		-0.589053,
		1
	},
	[1.06666666667] = {
		-0.803888,
		0.529216,
		0.271468,
		0,
		0.594359,
		0.69758,
		0.400149,
		0,
		0.022395,
		0.483025,
		-0.87532,
		0,
		-0.014687,
		0.019412,
		-0.589682,
		1
	},
	[1.08333333333] = {
		-0.806415,
		0.528259,
		0.265777,
		0,
		0.590596,
		0.696768,
		0.407076,
		0,
		0.029857,
		0.485239,
		-0.873872,
		0,
		-0.010899,
		0.017737,
		-0.590122,
		1
	},
	[1.1] = {
		-0.807352,
		0.527905,
		0.263627,
		0,
		0.589166,
		0.69646,
		0.409666,
		0,
		0.032659,
		0.486065,
		-0.873312,
		0,
		-0.009483,
		0.017107,
		-0.590287,
		1
	}
}

return spline_matrices

local spline_matrices = {
	[0] = {
		0.914085,
		-0.404404,
		-0.030095,
		0,
		0.00525,
		0.086008,
		-0.996281,
		0,
		0.405488,
		0.910527,
		0.080742,
		0,
		0.482944,
		-0.18906,
		-1.095529,
		1
	},
	{
		0.87148,
		-0.444516,
		0.207191,
		0,
		0.263027,
		0.067063,
		-0.962455,
		0,
		0.413932,
		0.893257,
		0.175364,
		0,
		0.55052,
		0.269425,
		-1.209589,
		1
	},
	[0.0166666666667] = {
		0.876075,
		-0.48023,
		-0.043264,
		0,
		-0.027536,
		0.039751,
		-0.99883,
		0,
		0.481388,
		0.876241,
		0.021601,
		0,
		0.471866,
		-0.19649,
		-1.094597,
		1
	},
	[0.0333333333333] = {
		0.826563,
		-0.560049,
		-0.056027,
		0,
		-0.069826,
		-0.003259,
		-0.997554,
		0,
		0.558496,
		0.828453,
		-0.0418,
		0,
		0.44378,
		-0.201415,
		-1.086967,
		1
	},
	[0.05] = {
		0.763123,
		-0.642866,
		-0.066084,
		0,
		-0.121002,
		-0.041687,
		-0.991777,
		0,
		0.634824,
		0.764844,
		-0.1096,
		0,
		0.400479,
		-0.20375,
		-1.073287,
		1
	},
	[0.0666666666667] = {
		0.683447,
		-0.726563,
		-0.07075,
		0,
		-0.180131,
		-0.073929,
		-0.98086,
		0,
		0.707427,
		0.683111,
		-0.181403,
		0,
		0.343775,
		-0.203366,
		-1.054207,
		1
	},
	[0.0833333333333] = {
		0.58573,
		-0.807725,
		-0.067086,
		0,
		-0.245835,
		-0.098177,
		-0.964327,
		0,
		0.772325,
		0.581328,
		-0.256072,
		0,
		0.275518,
		-0.200091,
		-1.030388,
		1
	},
	[0.116666666667] = {
		0.334673,
		-0.942044,
		-0.023385,
		0,
		-0.388585,
		-0.115356,
		-0.914163,
		0,
		0.858484,
		0.315033,
		-0.404671,
		0,
		0.11203,
		-0.184053,
		-0.971293,
		1
	},
	[0.133333333333] = {
		0.185261,
		-0.982469,
		0.020802,
		0,
		-0.459932,
		-0.105396,
		-0.881677,
		0,
		0.868413,
		0.153773,
		-0.471394,
		0,
		0.020838,
		-0.170889,
		-0.937499,
		1
	},
	[0.15] = {
		0.026568,
		-0.996401,
		0.080488,
		0,
		-0.526733,
		-0.082386,
		-0.846029,
		0,
		0.849615,
		-0.019918,
		-0.527026,
		0,
		-0.073828,
		-0.154114,
		-0.901961,
		1
	},
	[0.166666666667] = {
		-0.133472,
		-0.97905,
		0.153775,
		0,
		-0.585599,
		-0.047267,
		-0.809221,
		0,
		0.799536,
		-0.198059,
		-0.567022,
		0,
		-0.169785,
		-0.13373,
		-0.865569,
		1
	},
	[0.183333333333] = {
		-0.285572,
		-0.92865,
		0.236763,
		0,
		-0.633798,
		-0.002304,
		-0.773495,
		0,
		0.718852,
		-0.370949,
		-0.587919,
		0,
		-0.264861,
		-0.109891,
		-0.829262,
		1
	},
	[0.1] = {
		0.469188,
		-0.881557,
		-0.052147,
		0,
		-0.316174,
		-0.112554,
		-0.942001,
		0,
		0.824559,
		0.458463,
		-0.331534,
		0,
		0.19761,
		-0.193724,
		-1.002511,
		1
	},
	[0.216666666667] = {
		-0.531698,
		-0.74116,
		0.409853,
		0,
		-0.693546,
		0.103276,
		-0.712971,
		0,
		0.486098,
		-0.663337,
		-0.56894,
		0,
		-0.444096,
		-0.053239,
		-0.760644,
		1
	},
	[0.233333333333] = {
		-0.614815,
		-0.618802,
		0.488965,
		0,
		-0.706421,
		0.156415,
		-0.690292,
		0,
		0.350673,
		-0.769818,
		-0.533301,
		0,
		-0.524466,
		-0.021369,
		-0.730064,
		1
	},
	[0.25] = {
		-0.6698,
		-0.490043,
		0.557876,
		0,
		-0.710786,
		0.20577,
		-0.672638,
		0,
		0.214827,
		-0.847063,
		-0.486141,
		0,
		-0.596386,
		0.012204,
		-0.702969,
		1
	},
	[0.266666666667] = {
		-0.699459,
		-0.364,
		0.61503,
		0,
		-0.709438,
		0.249665,
		-0.659064,
		0,
		0.086348,
		-0.897313,
		-0.432865,
		0,
		-0.658271,
		0.047057,
		-0.679984,
		1
	},
	[0.283333333333] = {
		-0.708511,
		-0.248028,
		0.660677,
		0,
		-0.705096,
		0.287514,
		-0.648209,
		0,
		-0.029179,
		-0.925104,
		-0.378591,
		0,
		-0.708581,
		0.082853,
		-0.661652,
		1
	},
	[0.2] = {
		-0.420674,
		-0.847355,
		0.324071,
		0,
		-0.669795,
		0.049159,
		-0.740917,
		0,
		0.611889,
		-0.528746,
		-0.588235,
		0,
		-0.356955,
		-0.082913,
		-0.793985,
		1
	},
	[0.316666666667] = {
		-0.686378,
		-0.065162,
		0.72432,
		0,
		-0.696254,
		0.346531,
		-0.628607,
		0,
		-0.210038,
		-0.935773,
		-0.28322,
		0,
		-0.768315,
		0.156324,
		-0.640884,
		1
	},
	[0.333333333333] = {
		-0.664884,
		-0.003311,
		0.74694,
		0,
		-0.69497,
		0.369249,
		-0.616986,
		0,
		-0.273763,
		-0.929325,
		-0.247808,
		0,
		-0.774608,
		0.193647,
		-0.639361,
		1
	},
	[0.35] = {
		-0.639342,
		0.042557,
		0.767744,
		0,
		-0.700041,
		0.380839,
		-0.604073,
		0,
		-0.318094,
		-0.923661,
		-0.213695,
		0,
		-0.772476,
		0.238042,
		-0.644626,
		1
	},
	[0.366666666667] = {
		-0.60957,
		0.077469,
		0.788938,
		0,
		-0.713479,
		0.380137,
		-0.588595,
		0,
		-0.345502,
		-0.92168,
		-0.176448,
		0,
		-0.770756,
		0.295038,
		-0.655337,
		1
	},
	[0.383333333333] = {
		-0.576178,
		0.100802,
		0.811085,
		0,
		-0.732918,
		0.375481,
		-0.567314,
		0,
		-0.361733,
		-0.921332,
		-0.142464,
		0,
		-0.769243,
		0.362514,
		-0.668921,
		1
	},
	[0.3] = {
		-0.702405,
		-0.147334,
		0.696362,
		0,
		-0.700091,
		0.319564,
		-0.638554,
		0,
		-0.128452,
		-0.93604,
		-0.32761,
		0,
		-0.74578,
		0.119339,
		-0.648465,
		1
	},
	[0.416666666667] = {
		-0.499208,
		0.104838,
		0.860117,
		0,
		-0.777698,
		0.383491,
		-0.498116,
		0,
		-0.382069,
		-0.917575,
		-0.10991,
		0,
		-0.765855,
		0.519618,
		-0.694947,
		1
	},
	[0.433333333333] = {
		-0.456966,
		0.077872,
		0.886069,
		0,
		-0.796088,
		0.408548,
		-0.446466,
		0,
		-0.396769,
		-0.909409,
		-0.1247,
		0,
		-0.763693,
		0.604127,
		-0.702514,
		1
	},
	[0.45] = {
		-0.416063,
		0.023674,
		0.909028,
		0,
		-0.805811,
		0.453635,
		-0.380635,
		0,
		-0.421378,
		-0.890873,
		-0.169665,
		0,
		-0.760514,
		0.689092,
		-0.703318,
		1
	},
	[0.466666666667] = {
		-0.383645,
		-0.065174,
		0.921178,
		0,
		-0.801232,
		0.519477,
		-0.296938,
		0,
		-0.459178,
		-0.851996,
		-0.251514,
		0,
		-0.755348,
		0.771451,
		-0.694707,
		1
	},
	[0.483333333333] = {
		-0.359133,
		-0.279358,
		0.890496,
		0,
		-0.791884,
		0.596159,
		-0.132342,
		0,
		-0.493906,
		-0.752697,
		-0.43532,
		0,
		-0.720109,
		0.929207,
		-0.619185,
		1
	},
	[0.4] = {
		-0.539333,
		0.110933,
		0.834754,
		0,
		-0.755387,
		0.374374,
		-0.537805,
		0,
		-0.372171,
		-0.920618,
		-0.118115,
		0,
		-0.767642,
		0.438212,
		-0.68295,
		1
	},
	[0.516666666667] = {
		-0.396512,
		-0.574285,
		0.716223,
		0,
		-0.710984,
		0.68565,
		0.156159,
		0,
		-0.580758,
		-0.447304,
		-0.680176,
		0,
		-0.4146,
		1.257878,
		-0.339324,
		1
	},
	[0.533333333333] = {
		-0.461115,
		-0.593816,
		0.65936,
		0,
		-0.573549,
		0.766442,
		0.28915,
		0,
		-0.677063,
		-0.244844,
		-0.694,
		0,
		-0.138826,
		1.404033,
		-0.18078,
		1
	},
	[0.55] = {
		-0.678644,
		-0.431272,
		0.594514,
		0,
		-0.076086,
		0.846375,
		0.527125,
		0,
		-0.730516,
		0.312496,
		-0.607201,
		0,
		0.175431,
		1.470781,
		0.062984,
		1
	},
	[0.566666666667] = {
		-0.744973,
		-0.197908,
		0.637061,
		0,
		0.449548,
		0.556631,
		0.698619,
		0,
		-0.49287,
		0.806842,
		-0.325706,
		0,
		0.48763,
		1.412243,
		0.278098,
		1
	},
	[0.583333333333] = {
		-0.748608,
		-0.156217,
		0.644347,
		0,
		0.624741,
		0.159208,
		0.764429,
		0,
		-0.222002,
		0.974807,
		-0.02159,
		0,
		0.765378,
		1.21897,
		0.465679,
		1
	},
	[0.5] = {
		-0.358682,
		-0.510385,
		0.781572,
		0,
		-0.779151,
		0.624804,
		0.05044,
		0,
		-0.514073,
		-0.590871,
		-0.621772,
		0,
		-0.625543,
		1.112314,
		-0.477058,
		1
	},
	[0.616666666667] = {
		-0.92565,
		-0.060709,
		0.373479,
		0,
		0.366623,
		-0.388047,
		0.845581,
		0,
		0.093593,
		0.919638,
		0.381453,
		0,
		1.140562,
		0.705838,
		0.922715,
		1
	},
	[0.633333333333] = {
		-0.810089,
		-0.364707,
		0.45907,
		0,
		0.586294,
		-0.498647,
		0.638444,
		0,
		-0.00393,
		0.786346,
		0.617774,
		0,
		1.215364,
		0.433311,
		0.865303,
		1
	},
	[0.65] = {
		-0.655063,
		-0.632255,
		0.413699,
		0,
		0.755481,
		-0.556674,
		0.345487,
		0,
		0.01186,
		0.538858,
		0.842313,
		0,
		1.368821,
		0.105179,
		0.739562,
		1
	},
	[0.666666666667] = {
		-0.563822,
		-0.711362,
		0.419606,
		0,
		0.82005,
		-0.54254,
		0.182123,
		0,
		0.098097,
		0.446783,
		0.889248,
		0,
		1.368229,
		0.047923,
		0.659335,
		1
	},
	[0.683333333333] = {
		-0.456884,
		-0.76936,
		0.446479,
		0,
		0.869655,
		-0.491834,
		0.042407,
		0,
		0.186968,
		0.407657,
		0.893789,
		0,
		1.335453,
		0.016702,
		0.496556,
		1
	},
	[0.6] = {
		-0.825317,
		-0.19394,
		0.530319,
		0,
		0.553533,
		-0.092272,
		0.8277,
		0,
		-0.11159,
		0.976664,
		0.183506,
		0,
		1.05195,
		0.957478,
		0.718675,
		1
	},
	[0.716666666667] = {
		-0.154344,
		-0.830304,
		0.535513,
		0,
		0.921107,
		-0.31699,
		-0.226008,
		0,
		0.357407,
		0.458382,
		0.813724,
		0,
		1.196255,
		0.016462,
		0.002559,
		1
	},
	[0.733333333333] = {
		0.042952,
		-0.821296,
		0.568883,
		0,
		0.904401,
		-0.209983,
		-0.371438,
		0,
		0.424517,
		0.530452,
		0.733762,
		0,
		1.099121,
		0.039664,
		-0.287543,
		1
	},
	[0.75] = {
		0.256415,
		-0.778268,
		0.573194,
		0,
		0.845861,
		-0.106288,
		-0.522706,
		0,
		0.467729,
		0.618872,
		0.631052,
		0,
		0.990164,
		0.072404,
		-0.576854,
		1
	},
	[0.766666666667] = {
		0.464897,
		-0.703974,
		0.536927,
		0,
		0.742458,
		-0.020384,
		-0.669582,
		0,
		0.482313,
		0.709933,
		0.513195,
		0,
		0.875763,
		0.109911,
		-0.841653,
		1
	},
	[0.783333333333] = {
		0.645483,
		-0.611491,
		0.457636,
		0,
		0.600755,
		0.036483,
		-0.7986,
		0,
		0.471641,
		0.79041,
		0.390905,
		0,
		0.764084,
		0.148056,
		-1.057542,
		1
	},
	[0.7] = {
		-0.322125,
		-0.810436,
		0.489315,
		0,
		0.905778,
		-0.414158,
		-0.089665,
		0,
		0.275321,
		0.414327,
		0.867486,
		0,
		1.276529,
		0.007454,
		0.270968,
		1
	},
	[0.816666666667] = {
		0.863784,
		-0.459444,
		0.206855,
		0,
		0.261268,
		0.057378,
		-0.963559,
		0,
		0.430832,
		0.886352,
		0.1696,
		0,
		0.586972,
		0.217065,
		-1.247707,
		1
	},
	[0.833333333333] = {
		0.871894,
		-0.446461,
		0.201181,
		0,
		0.2556,
		0.064486,
		-0.96463,
		0,
		0.417696,
		0.892476,
		0.170341,
		0,
		0.557435,
		0.247333,
		-1.231498,
		1
	},
	[0.85] = {
		0.876972,
		-0.437753,
		0.198225,
		0,
		0.25199,
		0.067686,
		-0.96536,
		0,
		0.409172,
		0.896544,
		0.169668,
		0,
		0.539221,
		0.266712,
		-1.220523,
		1
	},
	[0.866666666667] = {
		0.877967,
		-0.435656,
		0.19844,
		0,
		0.252061,
		0.068281,
		-0.965299,
		0,
		0.406988,
		0.89752,
		0.169761,
		0,
		0.534897,
		0.273103,
		-1.215758,
		1
	},
	[0.883333333333] = {
		0.876569,
		-0.437588,
		0.200359,
		0,
		0.254455,
		0.068017,
		-0.96469,
		0,
		0.408509,
		0.896599,
		0.170968,
		0,
		0.538311,
		0.272305,
		-1.214429,
		1
	},
	[0.8] = {
		0.780997,
		-0.522007,
		0.342859,
		0,
		0.434948,
		0.060659,
		-0.89841,
		0,
		0.448179,
		0.850781,
		0.27442,
		0,
		0.664609,
		0.184135,
		-1.200513,
		1
	},
	[0.916666666667] = {
		0.87403,
		-0.441065,
		0.203797,
		0,
		0.25876,
		0.06754,
		-0.963578,
		0,
		0.411236,
		0.89493,
		0.173162,
		0,
		0.544445,
		0.270863,
		-1.212015,
		1
	},
	[0.933333333333] = {
		0.872995,
		-0.44247,
		0.205181,
		0,
		0.260498,
		0.067346,
		-0.963123,
		0,
		0.412335,
		0.894251,
		0.174055,
		0,
		0.54692,
		0.270278,
		-1.21103,
		1
	},
	[0.95] = {
		0.872189,
		-0.44356,
		0.206253,
		0,
		0.261846,
		0.067196,
		-0.962768,
		0,
		0.413186,
		0.893722,
		0.174752,
		0,
		0.548838,
		0.269824,
		-1.210263,
		1
	},
	[0.966666666667] = {
		0.871666,
		-0.444266,
		0.206945,
		0,
		0.262717,
		0.067098,
		-0.962537,
		0,
		0.413736,
		0.893379,
		0.175203,
		0,
		0.550079,
		0.269529,
		-1.209766,
		1
	},
	[0.983333333333] = {
		0.87148,
		-0.444516,
		0.207191,
		0,
		0.263027,
		0.067063,
		-0.962455,
		0,
		0.413932,
		0.893257,
		0.175364,
		0,
		0.55052,
		0.269425,
		-1.209589,
		1
	},
	[0.9] = {
		0.875239,
		-0.439414,
		0.202167,
		0,
		0.256717,
		0.067767,
		-0.964108,
		0,
		0.409943,
		0.895725,
		0.172117,
		0,
		0.541534,
		0.271549,
		-1.213164,
		1
	}
}

return spline_matrices

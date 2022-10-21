local spline_matrices = {
	[0] = {
		0.242047,
		0.032618,
		0.969716,
		0,
		-0.00104,
		0.999443,
		-0.033358,
		0,
		-0.970264,
		0.007066,
		0.241946,
		0,
		0.866551,
		-0.126506,
		-0.407546,
		1
	},
	{
		0.947778,
		0.034969,
		0.317009,
		0,
		0.317128,
		0.002243,
		-0.94838,
		0,
		-0.033875,
		0.999386,
		-0.008963,
		0,
		0.570398,
		0.142449,
		-1.020725,
		1
	},
	[0.0166666666667] = {
		0.24153,
		0.033556,
		0.969813,
		0,
		-0.002655,
		0.999421,
		-0.033919,
		0,
		-0.97039,
		0.005618,
		0.241479,
		0,
		0.866951,
		-0.125285,
		-0.408564,
		1
	},
	[0.0333333333333] = {
		0.240182,
		0.035845,
		0.970066,
		0,
		-0.00618,
		0.999354,
		-0.035397,
		0,
		-0.970708,
		0.002507,
		0.240249,
		0,
		0.867914,
		-0.122552,
		-0.411575,
		1
	},
	[0.05] = {
		0.239406,
		0.03711,
		0.97021,
		0,
		-0.00802,
		0.999311,
		-0.036244,
		0,
		-0.970886,
		0.000896,
		0.239539,
		0,
		0.868452,
		-0.12063,
		-0.417587,
		1
	},
	[0.0666666666667] = {
		0.237869,
		0.039585,
		0.97049,
		0,
		-0.011605,
		0.999214,
		-0.037912,
		0,
		-0.971228,
		-0.002245,
		0.238141,
		0,
		0.869505,
		-0.116899,
		-0.42502,
		1
	},
	[0.0833333333333] = {
		0.236315,
		0.041994,
		0.970769,
		0,
		-0.015016,
		0.999104,
		-0.039565,
		0,
		-0.97156,
		-0.005228,
		0.236734,
		0,
		0.870549,
		-0.112501,
		-0.434258,
		1
	},
	[0.116666666667] = {
		0.233909,
		0.045286,
		0.971203,
		0,
		-0.019401,
		0.998933,
		-0.041906,
		0,
		-0.972065,
		-0.00904,
		0.234538,
		0,
		0.872081,
		-0.102168,
		-0.457537,
		1
	},
	[0.133333333333] = {
		0.233207,
		0.046003,
		0.971338,
		0,
		-0.020355,
		0.998892,
		-0.042421,
		0,
		-0.972214,
		-0.009878,
		0.233885,
		0,
		0.872489,
		-0.095743,
		-0.471069,
		1
	},
	[0.15] = {
		0.232757,
		0.046327,
		0.971431,
		0,
		-0.020649,
		0.998875,
		-0.042688,
		0,
		-0.972316,
		-0.010123,
		0.233452,
		0,
		0.872704,
		-0.088119,
		-0.485335,
		1
	},
	[0.166666666667] = {
		0.232517,
		0.046455,
		0.971482,
		0,
		-0.020788,
		0.998868,
		-0.042789,
		0,
		-0.97237,
		-0.010246,
		0.233219,
		0,
		0.872774,
		-0.078675,
		-0.499981,
		1
	},
	[0.183333333333] = {
		0.232437,
		0.046484,
		0.9715,
		0,
		-0.020851,
		0.998866,
		-0.042805,
		0,
		-0.972388,
		-0.010307,
		0.233143,
		0,
		0.872715,
		-0.067159,
		-0.514632,
		1
	},
	[0.1] = {
		0.234934,
		0.044004,
		0.971015,
		0,
		-0.017771,
		0.999002,
		-0.040973,
		0,
		-0.971849,
		-0.00763,
		0.235481,
		0,
		0.87145,
		-0.107557,
		-0.445149,
		1
	},
	[0.216666666667] = {
		0.221079,
		-0.003962,
		0.975248,
		0,
		-0.029826,
		0.999497,
		0.010822,
		0,
		-0.9748,
		-0.031481,
		0.22085,
		0,
		0.836335,
		0.009749,
		-0.463869,
		1
	},
	[0.233333333333] = {
		0.11828,
		-0.06083,
		0.991115,
		0,
		-0.021232,
		0.997739,
		0.06377,
		0,
		-0.992753,
		-0.028586,
		0.116721,
		0,
		0.774108,
		0.138321,
		-0.425975,
		1
	},
	[0.25] = {
		-0.019668,
		-0.131261,
		0.991153,
		0,
		-0.033798,
		0.990865,
		0.130553,
		0,
		-0.999235,
		-0.030932,
		-0.023924,
		0,
		0.678403,
		0.327885,
		-0.377316,
		1
	},
	[0.266666666667] = {
		0.074257,
		-0.199369,
		0.977107,
		0,
		-0.123048,
		0.970493,
		0.207371,
		0,
		-0.989619,
		-0.13563,
		0.047534,
		0,
		0.427399,
		0.767439,
		-0.267685,
		1
	},
	[0.283333333333] = {
		0.080126,
		-0.317642,
		0.944819,
		0,
		-0.184253,
		0.926813,
		0.327214,
		0,
		-0.979607,
		-0.200304,
		0.015736,
		0,
		0.172179,
		1.263972,
		-0.201648,
		1
	},
	[0.2] = {
		-0.011837,
		0.001946,
		0.999928,
		0,
		0.011446,
		0.999933,
		-0.001811,
		0,
		-0.999864,
		0.011424,
		-0.011859,
		0,
		0.891926,
		-0.051354,
		-0.508457,
		1
	},
	[0.316666666667] = {
		0.095621,
		-0.299826,
		0.94919,
		0,
		-0.198106,
		0.928752,
		0.313327,
		0,
		-0.975505,
		-0.218001,
		0.029411,
		0,
		0.160096,
		1.355821,
		-0.177059,
		1
	},
	[0.333333333333] = {
		0.094291,
		-0.299067,
		0.949562,
		0,
		-0.197386,
		0.92926,
		0.312273,
		0,
		-0.975781,
		-0.216874,
		0.028589,
		0,
		0.162463,
		1.46957,
		-0.175741,
		1
	},
	[0.35] = {
		0.091992,
		-0.296869,
		0.950477,
		0,
		-0.197842,
		0.930046,
		0.309635,
		0,
		-0.975908,
		-0.216528,
		0.026824,
		0,
		0.158716,
		1.461865,
		-0.177401,
		1
	},
	[0.366666666667] = {
		0.088876,
		-0.292581,
		0.952102,
		0,
		-0.200706,
		0.931017,
		0.304836,
		0,
		-0.975612,
		-0.218185,
		0.024022,
		0,
		0.152208,
		1.4541,
		-0.181737,
		1
	},
	[0.383333333333] = {
		0.08558,
		-0.287789,
		0.953862,
		0,
		-0.202311,
		0.93241,
		0.299468,
		0,
		-0.975575,
		-0.218605,
		0.021573,
		0,
		0.147892,
		1.455768,
		-0.186811,
		1
	},
	[0.3] = {
		0.088708,
		-0.309578,
		0.946727,
		0,
		-0.190377,
		0.927682,
		0.321189,
		0,
		-0.977695,
		-0.208727,
		0.023356,
		0,
		0.160278,
		1.18484,
		-0.192017,
		1
	},
	[0.416666666667] = {
		0.078285,
		-0.277706,
		0.957471,
		0,
		-0.204798,
		0.935455,
		0.288065,
		0,
		-0.975669,
		-0.218639,
		0.016358,
		0,
		0.140916,
		1.468442,
		-0.197676,
		1
	},
	[0.433333333333] = {
		0.074727,
		-0.272742,
		0.959181,
		0,
		-0.205803,
		0.936945,
		0.282453,
		0,
		-0.975736,
		-0.218509,
		0.013884,
		0,
		0.137701,
		1.476578,
		-0.203082,
		1
	},
	[0.45] = {
		0.071522,
		-0.268053,
		0.960746,
		0,
		-0.206732,
		0.938313,
		0.277184,
		0,
		-0.97578,
		-0.218441,
		0.011695,
		0,
		0.13431,
		1.484,
		-0.208172,
		1
	},
	[0.466666666667] = {
		0.068888,
		-0.263809,
		0.962112,
		0,
		-0.207649,
		0.939489,
		0.272473,
		0,
		-0.975775,
		-0.218551,
		0.00994,
		0,
		0.130485,
		1.489275,
		-0.212693,
		1
	},
	[0.483333333333] = {
		0.067041,
		-0.260182,
		0.963229,
		0,
		-0.208619,
		0.940407,
		0.268537,
		0,
		-0.975696,
		-0.218951,
		0.008767,
		0,
		0.125975,
		1.49097,
		-0.216374,
		1
	},
	[0.4] = {
		0.081976,
		-0.282777,
		0.955676,
		0,
		-0.203655,
		0.933918,
		0.293807,
		0,
		-0.975605,
		-0.218713,
		0.01897,
		0,
		0.144222,
		1.461027,
		-0.192184,
		1
	},
	[0.516666666667] = {
		0.064557,
		-0.253695,
		0.965128,
		0,
		-0.211666,
		0.941658,
		0.261684,
		0,
		-0.975208,
		-0.221178,
		0.007092,
		0,
		0.114502,
		1.489927,
		-0.222553,
		1
	},
	[0.533333333333] = {
		0.063487,
		-0.250458,
		0.966043,
		0,
		-0.213923,
		0.942081,
		0.258304,
		0,
		-0.974785,
		-0.223058,
		0.006231,
		0,
		0.107612,
		1.489463,
		-0.225559,
		1
	},
	[0.55] = {
		0.062333,
		-0.247298,
		0.966932,
		0,
		-0.215903,
		0.942535,
		0.254976,
		0,
		-0.974423,
		-0.224657,
		0.005359,
		0,
		0.101161,
		1.488947,
		-0.228482,
		1
	},
	[0.566666666667] = {
		0.061203,
		-0.24423,
		0.967784,
		0,
		-0.217948,
		0.942934,
		0.251742,
		0,
		-0.974039,
		-0.226334,
		0.004481,
		0,
		0.094596,
		1.488429,
		-0.231262,
		1
	},
	[0.583333333333] = {
		0.059751,
		-0.24079,
		0.968736,
		0,
		-0.217502,
		0.944012,
		0.24806,
		0,
		-0.974229,
		-0.225524,
		0.004034,
		0,
		0.091764,
		1.487523,
		-0.234882,
		1
	},
	[0.5] = {
		0.065734,
		-0.256932,
		0.964191,
		0,
		-0.209893,
		0.941102,
		0.265088,
		0,
		-0.975512,
		-0.219802,
		0.007934,
		0,
		0.120634,
		1.490424,
		-0.219499,
		1
	},
	[0.616666666667] = {
		0.061943,
		-0.244611,
		0.967641,
		0,
		-0.229265,
		0.940091,
		0.252323,
		0,
		-0.971391,
		-0.237475,
		0.002151,
		0,
		0.072341,
		1.486398,
		-0.24123,
		1
	},
	[0.633333333333] = {
		0.065626,
		-0.255754,
		0.964512,
		0,
		-0.237548,
		0.934802,
		0.264039,
		0,
		-0.969157,
		-0.246445,
		0.000593,
		0,
		0.060199,
		1.48592,
		-0.245612,
		1
	},
	[0.65] = {
		0.070753,
		-0.271699,
		0.959778,
		0,
		-0.247213,
		0.927395,
		0.280756,
		0,
		-0.966374,
		-0.257134,
		-0.001551,
		0,
		0.050737,
		1.485166,
		-0.248086,
		1
	},
	[0.666666666667] = {
		0.080553,
		-0.287484,
		0.954392,
		0,
		-0.265026,
		0.916859,
		0.298547,
		0,
		-0.960871,
		-0.276988,
		-0.002335,
		0,
		0.038897,
		1.482668,
		-0.253864,
		1
	},
	[0.683333333333] = {
		0.096344,
		-0.30333,
		0.948003,
		0,
		-0.293331,
		0.901482,
		0.318256,
		0,
		-0.951144,
		-0.30874,
		-0.002123,
		0,
		0.026989,
		1.477882,
		-0.260306,
		1
	},
	[0.6] = {
		0.058917,
		-0.237481,
		0.969604,
		0,
		-0.220716,
		0.944154,
		0.244659,
		0,
		-0.973557,
		-0.228422,
		0.003211,
		0,
		0.083349,
		1.487022,
		-0.237925,
		1
	},
	[0.716666666667] = {
		0.14971,
		-0.333854,
		0.93066,
		0,
		-0.382868,
		0.848258,
		0.365884,
		0,
		-0.911591,
		-0.411097,
		-0.000829,
		0,
		0.001846,
		1.462578,
		-0.275353,
		1
	},
	[0.733333333333] = {
		0.184585,
		-0.34705,
		0.919502,
		0,
		-0.436038,
		0.809543,
		0.39308,
		0,
		-0.880795,
		-0.473494,
		-0.001898,
		0,
		-0.010666,
		1.449746,
		-0.28365,
		1
	},
	[0.75] = {
		0.222174,
		-0.35752,
		0.907093,
		0,
		-0.488992,
		0.764023,
		0.4209,
		0,
		-0.84352,
		-0.537074,
		-0.005078,
		0,
		-0.022211,
		1.43092,
		-0.292135,
		1
	},
	[0.766666666667] = {
		0.260079,
		-0.364984,
		0.893949,
		0,
		-0.537844,
		0.71413,
		0.448043,
		0,
		-0.801925,
		-0.597331,
		-0.010574,
		0,
		-0.031985,
		1.404369,
		-0.300591,
		1
	},
	[0.783333333333] = {
		0.295874,
		-0.369885,
		0.880706,
		0,
		-0.579609,
		0.663344,
		0.473316,
		0,
		-0.759284,
		-0.650507,
		-0.018123,
		0,
		-0.039371,
		1.368522,
		-0.308781,
		1
	},
	[0.7] = {
		0.11969,
		-0.318849,
		0.940218,
		0,
		-0.333807,
		0.878968,
		0.340571,
		0,
		-0.935012,
		-0.354615,
		-0.00123,
		0,
		0.014628,
		1.471283,
		-0.267475,
		1
	},
	[0.816666666667] = {
		0.323291,
		-0.305752,
		0.895544,
		0,
		-0.663049,
		0.602022,
		0.444899,
		0,
		-0.675166,
		-0.737622,
		-0.008101,
		0,
		-0.016543,
		1.277669,
		-0.377853,
		1
	},
	[0.833333333333] = {
		0.376399,
		-0.2263,
		0.898394,
		0,
		-0.594572,
		0.684663,
		0.421569,
		0,
		-0.710499,
		-0.692838,
		0.123155,
		0,
		0.018244,
		1.24203,
		-0.423315,
		1
	},
	[0.85] = {
		0.403714,
		-0.120507,
		0.906914,
		0,
		-0.534679,
		0.773302,
		0.340766,
		0,
		-0.742384,
		-0.62248,
		0.24776,
		0,
		0.052631,
		1.201016,
		-0.487263,
		1
	},
	[0.866666666667] = {
		0.413233,
		0.003692,
		0.910618,
		0,
		-0.472342,
		0.855818,
		0.210877,
		0,
		-0.778544,
		-0.517264,
		0.355396,
		0,
		0.086282,
		1.151322,
		-0.564823,
		1
	},
	[0.883333333333] = {
		0.417469,
		0.135426,
		0.898543,
		0,
		-0.393087,
		0.918438,
		0.044207,
		0,
		-0.819269,
		-0.371661,
		0.436654,
		0,
		0.119843,
		1.090044,
		-0.648766,
		1
	},
	[0.8] = {
		0.31264,
		-0.344358,
		0.885254,
		0,
		-0.618152,
		0.63386,
		0.464876,
		0,
		-0.721211,
		-0.69256,
		-0.014696,
		0,
		-0.035709,
		1.326622,
		-0.33869,
		1
	},
	[0.916666666667] = {
		0.486909,
		0.358621,
		0.796436,
		0,
		-0.116268,
		0.930322,
		-0.347825,
		0,
		-0.865679,
		0.076759,
		0.494679,
		0,
		0.202052,
		0.916723,
		-0.80813,
		1
	},
	[0.933333333333] = {
		0.591334,
		0.401135,
		0.699582,
		0,
		0.093739,
		0.827436,
		-0.553681,
		0,
		-0.80096,
		0.392988,
		0.451689,
		0,
		0.268986,
		0.789527,
		-0.876927,
		1
	},
	[0.95] = {
		0.723207,
		0.365215,
		0.586165,
		0,
		0.27286,
		0.628589,
		-0.728301,
		0,
		-0.634443,
		0.686654,
		0.354948,
		0,
		0.344556,
		0.636357,
		-0.933855,
		1
	},
	[0.966666666667] = {
		0.839754,
		0.259715,
		0.476824,
		0,
		0.364409,
		0.381436,
		-0.849537,
		0,
		-0.402515,
		0.887161,
		0.22567,
		0,
		0.420443,
		0.468337,
		-0.976281,
		1
	},
	[0.983333333333] = {
		0.913223,
		0.13036,
		0.386043,
		0,
		0.365435,
		0.157024,
		-0.917497,
		0,
		-0.180223,
		0.978953,
		0.09576,
		0,
		0.494648,
		0.299865,
		-1.004441,
		1
	},
	[0.9] = {
		0.433478,
		0.260795,
		0.862602,
		0,
		-0.28428,
		0.947907,
		-0.143729,
		0,
		-0.85515,
		-0.182917,
		0.485035,
		0,
		0.153947,
		1.014529,
		-0.731423,
		1
	}
}

return spline_matrices
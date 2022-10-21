local spline_matrices = {
	[0] = {
		0.976321,
		0.123617,
		0.177526,
		0,
		0.128253,
		0.330092,
		-0.935195,
		0,
		-0.174206,
		0.935819,
		0.306422,
		0,
		0.260625,
		-0.471896,
		-0.189234,
		1
	},
	{
		0.857798,
		0.046293,
		0.511898,
		0,
		0.426851,
		0.490637,
		-0.759653,
		0,
		-0.286323,
		0.870133,
		0.401107,
		0,
		0.313875,
		0.342049,
		-0.213035,
		1
	},
	[0.0333333333333] = {
		0.994476,
		0.03292,
		0.099664,
		0,
		0.091225,
		0.198528,
		-0.97584,
		0,
		-0.05191,
		0.979542,
		0.194428,
		0,
		0.300273,
		-0.435909,
		-0.242228,
		1
	},
	[0.0666666666667] = {
		0.997448,
		-0.053636,
		0.047114,
		0,
		0.051647,
		0.086511,
		-0.994911,
		0,
		0.049287,
		0.994806,
		0.089061,
		0,
		0.359949,
		-0.343651,
		-0.319695,
		1
	},
	[0.133333333333] = {
		0.994936,
		0.040652,
		0.091928,
		0,
		0.082937,
		0.18468,
		-0.979293,
		0,
		-0.056787,
		0.981958,
		0.180373,
		0,
		0.347772,
		-0.078761,
		-0.299956,
		1
	},
	[0.166666666667] = {
		0.979477,
		0.172327,
		0.104537,
		0,
		0.055814,
		0.266468,
		-0.962226,
		0,
		-0.193674,
		0.948313,
		0.251381,
		0,
		0.310513,
		0.073663,
		-0.256002,
		1
	},
	[0.1] = {
		0.996263,
		-0.050139,
		0.07033,
		0,
		0.074873,
		0.095372,
		-0.992622,
		0,
		0.043061,
		0.994178,
		0.09877,
		0,
		0.37009,
		-0.222932,
		-0.329241,
		1
	},
	[0.233333333333] = {
		0.951715,
		0.30161,
		0.057186,
		0,
		-0.032268,
		0.283538,
		-0.958418,
		0,
		-0.305283,
		0.910295,
		0.279579,
		0,
		0.234745,
		0.354876,
		-0.160412,
		1
	},
	[0.266666666667] = {
		0.981212,
		0.192593,
		-0.011478,
		0,
		-0.060902,
		0.252733,
		-0.965618,
		0,
		-0.183071,
		0.948174,
		0.259713,
		0,
		0.051066,
		0.745822,
		-0.076246,
		1
	},
	[0.2] = {
		0.956248,
		0.277106,
		0.093823,
		0,
		0.011287,
		0.285513,
		-0.958308,
		0,
		-0.292341,
		0.917439,
		0.269893,
		0,
		0.272571,
		0.217868,
		-0.212515,
		1
	},
	[0.333333333333] = {
		0.983208,
		0.181999,
		-0.013387,
		0,
		-0.060278,
		0.254641,
		-0.965155,
		0,
		-0.172248,
		0.949755,
		0.261335,
		0,
		0.051758,
		0.747036,
		-0.073615,
		1
	},
	[0.366666666667] = {
		0.983658,
		0.179274,
		-0.01667,
		0,
		-0.06288,
		0.255304,
		-0.964814,
		0,
		-0.16871,
		0.950095,
		0.262405,
		0,
		0.049967,
		0.746653,
		-0.07325,
		1
	},
	[0.3] = {
		0.982733,
		0.184719,
		-0.010669,
		0,
		-0.058221,
		0.253981,
		-0.965455,
		0,
		-0.175628,
		0.949406,
		0.26035,
		0,
		0.053509,
		0.746766,
		-0.074472,
		1
	},
	[0.433333333333] = {
		0.9834,
		0.181426,
		0.002925,
		0,
		-0.043914,
		0.253612,
		-0.966309,
		0,
		-0.176056,
		0.95014,
		0.25737,
		0,
		0.050272,
		0.744455,
		-0.073947,
		1
	},
	[0.466666666667] = {
		0.98312,
		0.182507,
		0.012878,
		0,
		-0.034273,
		0.252842,
		-0.9669,
		0,
		-0.179722,
		0.950138,
		0.25483,
		0,
		0.050456,
		0.743436,
		-0.074778,
		1
	},
	[0.4] = {
		0.983578,
		0.180349,
		-0.006935,
		0,
		-0.053463,
		0.25444,
		-0.96561,
		0,
		-0.172382,
		0.950124,
		0.259903,
		0,
		0.050108,
		0.745619,
		-0.073418,
		1
	},
	[0.533333333333] = {
		0.982247,
		0.184682,
		0.032927,
		0,
		-0.014857,
		0.251555,
		-0.967729,
		0,
		-0.187005,
		0.950059,
		0.249833,
		0,
		0.050863,
		0.74298,
		-0.077105,
		1
	},
	[0.566666666667] = {
		0.981653,
		0.185775,
		0.042958,
		0,
		-0.005158,
		0.251078,
		-0.967953,
		0,
		-0.190607,
		0.949972,
		0.24743,
		0,
		0.051077,
		0.744109,
		-0.07848,
		1
	},
	[0.5] = {
		0.982736,
		0.183592,
		0.02289,
		0,
		-0.024574,
		0.25215,
		-0.967376,
		0,
		-0.183375,
		0.950113,
		0.252309,
		0,
		0.050655,
		0.742849,
		-0.075851,
		1
	},
	[0.633333333333] = {
		0.933274,
		0.070568,
		0.352163,
		0,
		0.317708,
		0.295101,
		-0.901098,
		0,
		-0.167513,
		0.952856,
		0.252991,
		0,
		0.066,
		0.71642,
		-0.102953,
		1
	},
	[0.666666666667] = {
		0.928627,
		0.039368,
		0.36892,
		0,
		0.345969,
		0.267261,
		-0.899376,
		0,
		-0.134004,
		0.96282,
		0.234565,
		0,
		0.106611,
		0.566049,
		-0.131548,
		1
	},
	[0.6] = {
		0.971836,
		0.142767,
		0.187489,
		0,
		0.141133,
		0.284535,
		-0.94822,
		0,
		-0.188722,
		0.947975,
		0.256373,
		0,
		0.054149,
		0.753095,
		-0.078625,
		1
	},
	[0.733333333333] = {
		0.660228,
		-0.049763,
		0.749415,
		0,
		0.688967,
		0.437404,
		-0.577929,
		0,
		-0.299037,
		0.897887,
		0.323071,
		0,
		0.177511,
		0.378409,
		-0.160457,
		1
	},
	[0.766666666667] = {
		0.649161,
		-0.043837,
		0.759386,
		0,
		0.69796,
		0.431213,
		-0.571758,
		0,
		-0.302392,
		0.901185,
		0.310523,
		0,
		0.185036,
		0.352358,
		-0.162955,
		1
	},
	[0.7] = {
		0.801839,
		-0.013131,
		0.597396,
		0,
		0.554676,
		0.388182,
		-0.735968,
		0,
		-0.222234,
		0.921489,
		0.318543,
		0,
		0.15446,
		0.43592,
		-0.151584,
		1
	},
	[0.833333333333] = {
		0.60352,
		-0.040575,
		0.796315,
		0,
		0.720444,
		0.455675,
		-0.522801,
		0,
		-0.341648,
		0.889221,
		0.304241,
		0,
		0.189336,
		0.328528,
		-0.161081,
		1
	},
	[0.866666666667] = {
		0.594415,
		-0.037532,
		0.803282,
		0,
		0.719277,
		0.471501,
		-0.510223,
		0,
		-0.359598,
		0.881067,
		0.307263,
		0,
		0.192946,
		0.327657,
		-0.160898,
		1
	},
	[0.8] = {
		0.626158,
		-0.041573,
		0.778587,
		0,
		0.711167,
		0.43982,
		-0.548453,
		0,
		-0.319637,
		0.897123,
		0.304962,
		0,
		0.187846,
		0.336973,
		-0.162476,
		1
	},
	[0.933333333333] = {
		0.66903,
		-0.010207,
		0.743165,
		0,
		0.655125,
		0.48033,
		-0.583176,
		0,
		-0.351013,
		0.877028,
		0.328042,
		0,
		0.222551,
		0.348557,
		-0.172601,
		1
	},
	[0.966666666667] = {
		0.761983,
		0.015198,
		0.647419,
		0,
		0.558679,
		0.49016,
		-0.669045,
		0,
		-0.327507,
		0.8715,
		0.365003,
		0,
		0.264219,
		0.35161,
		-0.188969,
		1
	},
	[0.9] = {
		0.612103,
		-0.028345,
		0.79027,
		0,
		0.70168,
		0.48031,
		-0.526258,
		0,
		-0.364658,
		0.876641,
		0.313888,
		0,
		0.202143,
		0.335036,
		-0.164036,
		1
	},
	[1.03333333333] = {
		0.932446,
		0.074774,
		0.353487,
		0,
		0.282558,
		0.458823,
		-0.842403,
		0,
		-0.225178,
		0.885376,
		0.406699,
		0,
		0.354652,
		0.320952,
		-0.245174,
		1
	},
	[1.06666666667] = {
		0.978142,
		0.08523,
		0.189667,
		0,
		0.145462,
		0.371336,
		-0.917034,
		0,
		-0.148589,
		0.924579,
		0.350822,
		0,
		0.368829,
		0.289434,
		-0.286585,
		1
	},
	[1.13333333333] = {
		0.982084,
		-0.039673,
		-0.184221,
		0,
		-0.186377,
		-0.060088,
		-0.980639,
		0,
		0.027836,
		0.997404,
		-0.066406,
		0,
		0.254428,
		0.132049,
		-0.424303,
		1
	},
	[1.16666666667] = {
		0.919709,
		-0.198194,
		-0.338902,
		0,
		-0.387689,
		-0.322358,
		-0.863587,
		0,
		0.06191,
		0.925637,
		-0.373313,
		0,
		0.154562,
		0.023327,
		-0.499046,
		1
	},
	[1.1] = {
		0.99843,
		0.055244,
		0.00921,
		0,
		-0.001691,
		0.194103,
		-0.98098,
		0,
		-0.055981,
		0.979424,
		0.193892,
		0,
		0.333848,
		0.228328,
		-0.347389,
		1
	},
	[1.23333333333] = {
		0.716173,
		-0.554763,
		-0.423479,
		0,
		-0.696075,
		-0.611885,
		-0.375601,
		0,
		-0.050751,
		0.563768,
		-0.824372,
		0,
		-0.002737,
		-0.134466,
		-0.583954,
		1
	},
	[1.2] = {
		0.82369,
		-0.38382,
		-0.417394,
		0,
		-0.566219,
		-0.517128,
		-0.641852,
		0,
		0.03051,
		0.765024,
		-0.643279,
		0,
		0.060121,
		-0.073342,
		-0.556212,
		1
	}
}

return spline_matrices

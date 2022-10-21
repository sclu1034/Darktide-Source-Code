local spline_matrices = {
	[0] = {
		-0.126379,
		0.230886,
		0.964738,
		0,
		-0.955734,
		0.23216,
		-0.180761,
		0,
		-0.265709,
		-0.944877,
		0.191325,
		0,
		-0.437412,
		0.157014,
		-0.137372,
		1
	},
	{
		0.554484,
		0.826777,
		-0.094799,
		0,
		0.35982,
		-0.3409,
		-0.868514,
		0,
		-0.750385,
		0.447467,
		-0.486514,
		0,
		0.099006,
		0.163939,
		-0.620885,
		1
	},
	[0.0166666666667] = {
		-0.049844,
		0.112651,
		0.992384,
		0,
		-0.98768,
		0.142012,
		-0.065728,
		0,
		-0.148335,
		-0.983434,
		0.104185,
		0,
		-0.478767,
		0.181852,
		-0.116276,
		1
	},
	[0.0333333333333] = {
		-0.040846,
		0.099612,
		0.994188,
		0,
		-0.987936,
		0.144734,
		-0.055091,
		0,
		-0.149381,
		-0.984444,
		0.092499,
		0,
		-0.470521,
		0.25336,
		-0.083507,
		1
	},
	[0.05] = {
		-0.055683,
		0.13036,
		0.989902,
		0,
		-0.966268,
		0.242648,
		-0.086308,
		0,
		-0.251449,
		-0.961316,
		0.112451,
		0,
		-0.437074,
		0.348498,
		-0.053194,
		1
	},
	[0.0666666666667] = {
		-0.046561,
		0.156496,
		0.986581,
		0,
		-0.888877,
		0.444143,
		-0.112402,
		0,
		-0.455773,
		-0.882183,
		0.118426,
		0,
		-0.399956,
		0.445118,
		-0.040335,
		1
	},
	[0.0833333333333] = {
		0.00497,
		0.159639,
		0.987163,
		0,
		-0.586261,
		0.800193,
		-0.126452,
		0,
		-0.810107,
		-0.578106,
		0.097567,
		0,
		-0.318278,
		0.564435,
		-0.040544,
		1
	},
	[0.116666666667] = {
		0.110184,
		0.077477,
		0.990887,
		0,
		0.610328,
		0.781578,
		-0.128978,
		0,
		-0.784448,
		0.618977,
		0.038831,
		0,
		0.058327,
		0.711152,
		-0.038196,
		1
	},
	[0.133333333333] = {
		0.115685,
		-0.004608,
		0.993275,
		0,
		0.947008,
		0.302189,
		-0.108894,
		0,
		-0.299655,
		0.953237,
		0.039322,
		0,
		0.339703,
		0.624327,
		-0.036986,
		1
	},
	[0.15] = {
		0.087725,
		-0.076872,
		0.993174,
		0,
		0.969095,
		-0.22418,
		-0.10295,
		0,
		0.230564,
		0.971511,
		0.05483,
		0,
		0.556072,
		0.475623,
		-0.03695,
		1
	},
	[0.166666666667] = {
		0.061109,
		-0.123686,
		0.990438,
		0,
		0.843181,
		-0.524624,
		-0.117539,
		0,
		0.534146,
		0.842301,
		0.072231,
		0,
		0.624928,
		0.325855,
		-0.038668,
		1
	},
	[0.183333333333] = {
		0.031424,
		-0.166885,
		0.985476,
		0,
		0.674437,
		-0.724127,
		-0.144133,
		0,
		0.737663,
		0.669171,
		0.089798,
		0,
		0.663635,
		0.166762,
		-0.041788,
		1
	},
	[0.1] = {
		0.070693,
		0.134559,
		0.988381,
		0,
		0.050743,
		0.989092,
		-0.138285,
		0,
		-0.996207,
		0.059929,
		0.063093,
		0,
		-0.148844,
		0.678992,
		-0.039751,
		1
	},
	[0.216666666667] = {
		-0.004234,
		-0.228609,
		0.973509,
		0,
		0.347527,
		-0.913174,
		-0.212929,
		0,
		0.93766,
		0.337419,
		0.083314,
		0,
		0.679226,
		-0.11381,
		-0.0513,
		1
	},
	[0.233333333333] = {
		0.013276,
		-0.240256,
		0.970619,
		0,
		0.237557,
		-0.942154,
		-0.236459,
		0,
		0.971283,
		0.233716,
		0.044567,
		0,
		0.66843,
		-0.202296,
		-0.056529,
		1
	},
	[0.25] = {
		0.064114,
		-0.240403,
		0.968553,
		0,
		0.181812,
		-0.951493,
		-0.248204,
		0,
		0.981241,
		0.192008,
		-0.017295,
		0,
		0.645378,
		-0.250074,
		-0.083579,
		1
	},
	[0.266666666667] = {
		0.141422,
		-0.233832,
		0.961937,
		0,
		0.170898,
		-0.951347,
		-0.256383,
		0,
		0.975087,
		0.200651,
		-0.09458,
		0,
		0.607208,
		-0.271656,
		-0.146635,
		1
	},
	[0.283333333333] = {
		0.238436,
		-0.217043,
		0.946594,
		0,
		0.194853,
		-0.944194,
		-0.265573,
		0,
		0.95141,
		0.247769,
		-0.182838,
		0,
		0.558158,
		-0.273035,
		-0.233682,
		1
	},
	[0.2] = {
		0.006104,
		-0.202956,
		0.979169,
		0,
		0.500691,
		-0.846984,
		-0.178679,
		0,
		0.865604,
		0.491352,
		0.096449,
		0,
		0.679627,
		0.014707,
		-0.046157,
		1
	},
	[0.316666666667] = {
		0.457336,
		-0.139464,
		0.87829,
		0,
		0.304847,
		-0.9032,
		-0.302157,
		0,
		0.835411,
		0.405931,
		-0.370551,
		0,
		0.444196,
		-0.238023,
		-0.431537,
		1
	},
	[0.333333333333] = {
		0.560142,
		-0.078385,
		0.82468,
		0,
		0.368266,
		-0.868171,
		-0.332654,
		0,
		0.742039,
		0.490035,
		-0.457432,
		0,
		0.38774,
		-0.213025,
		-0.518004,
		1
	},
	[0.35] = {
		0.648153,
		-0.008246,
		0.761465,
		0,
		0.423432,
		-0.827202,
		-0.36938,
		0,
		0.632932,
		0.561844,
		-0.532662,
		0,
		0.337449,
		-0.190769,
		-0.579764,
		1
	},
	[0.366666666667] = {
		0.718254,
		0.063101,
		0.692914,
		0,
		0.463077,
		-0.786632,
		-0.408376,
		0,
		0.519299,
		0.61419,
		-0.594222,
		0,
		0.297887,
		-0.17715,
		-0.604429,
		1
	},
	[0.383333333333] = {
		0.776786,
		0.145692,
		0.61268,
		0,
		0.497278,
		-0.738842,
		-0.454782,
		0,
		0.386416,
		0.657941,
		-0.646372,
		0,
		0.269659,
		-0.15274,
		-0.602556,
		1
	},
	[0.3] = {
		0.346933,
		-0.186212,
		0.919218,
		0,
		0.243241,
		-0.928692,
		-0.279936,
		0,
		0.905799,
		0.320711,
		-0.2769,
		0,
		0.502422,
		-0.259935,
		-0.332688,
		1
	},
	[0.416666666667] = {
		0.834418,
		0.368457,
		0.409862,
		0,
		0.55033,
		-0.597159,
		-0.583556,
		0,
		0.029738,
		0.712489,
		-0.701053,
		0,
		0.233644,
		-0.039963,
		-0.584077,
		1
	},
	[0.433333333333] = {
		0.819627,
		0.481892,
		0.309825,
		0,
		0.552238,
		-0.520649,
		-0.65112,
		0,
		-0.15246,
		0.704773,
		-0.692857,
		0,
		0.222438,
		0.022611,
		-0.572954,
		1
	},
	[0.45] = {
		0.785271,
		0.575987,
		0.227132,
		0,
		0.539146,
		-0.45576,
		-0.70824,
		0,
		-0.30442,
		0.678617,
		-0.668436,
		0,
		0.21403,
		0.072201,
		-0.564317,
		1
	},
	[0.466666666667] = {
		0.749661,
		0.639776,
		0.169394,
		0,
		0.520741,
		-0.412242,
		-0.747587,
		0,
		-0.408457,
		0.648647,
		-0.642199,
		0,
		0.207344,
		0.096182,
		-0.561157,
		1
	},
	[0.483333333333] = {
		0.719414,
		0.682583,
		0.128548,
		0,
		0.502855,
		-0.384167,
		-0.774308,
		0,
		-0.479146,
		0.621689,
		-0.619615,
		0,
		0.201297,
		0.102867,
		-0.561784,
		1
	},
	[0.4] = {
		0.819469,
		0.25116,
		0.515159,
		0,
		0.530223,
		-0.673451,
		-0.515098,
		0,
		0.217562,
		0.695257,
		-0.685044,
		0,
		0.24887,
		-0.102716,
		-0.594855,
		1
	},
	[0.516666666667] = {
		0.658732,
		0.749718,
		0.06321,
		0,
		0.4658,
		-0.340405,
		-0.816795,
		0,
		-0.590849,
		0.567493,
		-0.573454,
		0,
		0.190056,
		0.114481,
		-0.563225,
		1
	},
	[0.533333333333] = {
		0.630246,
		0.775491,
		0.037469,
		0,
		0.447992,
		-0.323822,
		-0.833332,
		0,
		-0.634108,
		0.54199,
		-0.551502,
		0,
		0.184861,
		0.119508,
		-0.564075,
		1
	},
	[0.55] = {
		0.603803,
		0.796982,
		0.015544,
		0,
		0.431244,
		-0.310192,
		-0.847236,
		0,
		-0.670411,
		0.518267,
		-0.530989,
		0,
		0.179939,
		0.12407,
		-0.565027,
		1
	},
	[0.566666666667] = {
		0.579738,
		0.814797,
		-0.003103,
		0,
		0.415807,
		-0.299122,
		-0.858854,
		0,
		-0.70072,
		0.49662,
		-0.512211,
		0,
		0.175276,
		0.128206,
		-0.566092,
		1
	},
	[0.583333333333] = {
		0.558234,
		0.829467,
		-0.018945,
		0,
		0.401828,
		-0.290268,
		-0.868492,
		0,
		-0.725885,
		0.477209,
		-0.49534,
		0,
		0.170858,
		0.131948,
		-0.567273,
		1
	},
	[0.5] = {
		0.688723,
		0.718988,
		0.093361,
		0,
		0.484277,
		-0.360369,
		-0.797251,
		0,
		-0.53957,
		0.594298,
		-0.596384,
		0,
		0.195534,
		0.10895,
		-0.562467,
		1
	},
	[0.616666666667] = {
		0.523124,
		0.85113,
		-0.043799,
		0,
		0.378463,
		-0.278044,
		-0.882869,
		0,
		-0.763614,
		0.445274,
		-0.467573,
		0,
		0.162694,
		0.13837,
		-0.569991,
		1
	},
	[0.633333333333] = {
		0.509454,
		0.858836,
		-0.053455,
		0,
		0.369066,
		-0.274199,
		-0.888035,
		0,
		-0.777333,
		0.432684,
		-0.456659,
		0,
		0.158916,
		0.141103,
		-0.571526,
		1
	},
	[0.65] = {
		0.498257,
		0.864838,
		-0.06161,
		0,
		0.361131,
		-0.271609,
		-0.892084,
		0,
		-0.788242,
		0.422237,
		-0.44765,
		0,
		0.155321,
		0.143549,
		-0.573174,
		1
	},
	[0.666666666667] = {
		0.489411,
		0.869361,
		-0.068471,
		0,
		0.354585,
		-0.270119,
		-0.895156,
		0,
		-0.796709,
		0.413821,
		-0.440462,
		0,
		0.151894,
		0.145731,
		-0.57493,
		1
	},
	[0.683333333333] = {
		0.482779,
		0.872592,
		-0.074209,
		0,
		0.349345,
		-0.269599,
		-0.897371,
		0,
		-0.803046,
		0.407307,
		-0.434992,
		0,
		0.14862,
		0.147671,
		-0.576788,
		1
	},
	[0.6] = {
		0.539365,
		0.841449,
		-0.032394,
		0,
		0.389375,
		-0.283327,
		-0.87642,
		0,
		-0.746641,
		0.460097,
		-0.480456,
		0,
		0.166669,
		0.135327,
		-0.568573,
		1
	},
	[0.716666666667] = {
		0.475551,
		0.875776,
		-0.082867,
		0,
		0.342396,
		-0.271045,
		-0.89961,
		0,
		-0.810318,
		0.399437,
		-0.428759,
		0,
		0.142478,
		0.150902,
		-0.580783,
		1
	},
	[0.733333333333] = {
		0.474637,
		0.875969,
		-0.086009,
		0,
		0.340486,
		-0.272837,
		-0.899794,
		0,
		-0.811658,
		0.397791,
		-0.427754,
		0,
		0.139585,
		0.152233,
		-0.582905,
		1
	},
	[0.75] = {
		0.475304,
		0.875362,
		-0.088479,
		0,
		0.339478,
		-0.275243,
		-0.899442,
		0,
		-0.81169,
		0.397471,
		-0.42799,
		0,
		0.136793,
		0.1534,
		-0.585099,
		1
	},
	[0.766666666667] = {
		0.477382,
		0.874038,
		-0.090356,
		0,
		0.339265,
		-0.278197,
		-0.898613,
		0,
		-0.810559,
		0.398327,
		-0.429337,
		0,
		0.13409,
		0.154422,
		-0.587357,
		1
	},
	[0.783333333333] = {
		0.480702,
		0.872075,
		-0.09171,
		0,
		0.339739,
		-0.281639,
		-0.897361,
		0,
		-0.808395,
		0.400206,
		-0.431662,
		0,
		0.131464,
		0.155317,
		-0.589671,
		1
	},
	[0.7] = {
		0.478211,
		0.874687,
		-0.078968,
		0,
		0.345315,
		-0.269939,
		-0.898827,
		0,
		-0.80751,
		0.40256,
		-0.43113,
		0,
		0.145486,
		0.149387,
		-0.578741,
		1
	},
	[0.816666666667] = {
		0.490366,
		0.866529,
		-0.093107,
		0,
		0.34231,
		-0.289749,
		-0.893795,
		0,
		-0.801477,
		0.406415,
		-0.438705,
		0,
		0.126397,
		0.156801,
		-0.594429,
		1
	},
	[0.833333333333] = {
		0.496355,
		0.863094,
		-0.093281,
		0,
		0.34419,
		-0.2943,
		-0.891583,
		0,
		-0.796973,
		0.410435,
		-0.443145,
		0,
		0.123932,
		0.157426,
		-0.596856,
		1
	},
	[0.85] = {
		0.502873,
		0.859321,
		-0.093195,
		0,
		0.346321,
		-0.299098,
		-0.889158,
		0,
		-0.791947,
		0.414858,
		-0.44801,
		0,
		0.121497,
		0.157999,
		-0.599304,
		1
	},
	[0.866666666667] = {
		0.509738,
		0.855297,
		-0.092922,
		0,
		0.348598,
		-0.304077,
		-0.886576,
		0,
		-0.786541,
		0.419529,
		-0.453154,
		0,
		0.119081,
		0.158539,
		-0.601765,
		1
	},
	[0.883333333333] = {
		0.516762,
		0.851113,
		-0.09254,
		0,
		0.350914,
		-0.309166,
		-0.883898,
		0,
		-0.780907,
		0.424292,
		-0.458432,
		0,
		0.116671,
		0.159063,
		-0.604229,
		1
	},
	[0.8] = {
		0.485089,
		0.869548,
		-0.092605,
		0,
		0.34079,
		-0.285509,
		-0.895738,
		0,
		-0.805326,
		0.402954,
		-0.434831,
		0,
		0.128904,
		0.156104,
		-0.592031,
		1
	},
	[0.916666666667] = {
		0.53054,
		0.842675,
		-0.091796,
		0,
		0.355252,
		-0.319365,
		-0.878523,
		0,
		-0.769625,
		0.433481,
		-0.468797,
		0,
		0.111825,
		0.160144,
		-0.609134,
		1
	},
	[0.933333333333] = {
		0.536914,
		0.838646,
		-0.091626,
		0,
		0.357074,
		-0.324308,
		-0.87597,
		0,
		-0.764344,
		0.437603,
		-0.473584,
		0,
		0.109365,
		0.160738,
		-0.611559,
		1
	},
	[0.95] = {
		0.54269,
		0.834909,
		-0.091729,
		0,
		0.358535,
		-0.329028,
		-0.873609,
		0,
		-0.759566,
		0.441211,
		-0.477905,
		0,
		0.106864,
		0.161396,
		-0.613955,
		1
	},
	[0.966666666667] = {
		0.547674,
		0.831595,
		-0.092215,
		0,
		0.359542,
		-0.333431,
		-0.871524,
		0,
		-0.755502,
		0.444155,
		-0.481605,
		0,
		0.104312,
		0.162135,
		-0.616313,
		1
	},
	[0.983333333333] = {
		0.551671,
		0.828838,
		-0.0932,
		0,
		0.360001,
		-0.337421,
		-0.869797,
		0,
		-0.752369,
		0.44629,
		-0.484528,
		0,
		0.101696,
		0.162976,
		-0.618626,
		1
	},
	[0.9] = {
		0.523759,
		0.846869,
		-0.092134,
		0,
		0.353165,
		-0.314289,
		-0.881191,
		0,
		-0.77521,
		0.428993,
		-0.463697,
		0,
		0.114256,
		0.159592,
		-0.606688,
		1
	},
	[1.01666666667] = {
		0.555909,
		0.825549,
		-0.097125,
		0,
		0.358907,
		-0.343772,
		-0.867759,
		0,
		-0.749767,
		0.447537,
		-0.487402,
		0,
		0.096229,
		0.165042,
		-0.623081,
		1
	},
	[1.03333333333] = {
		0.55574,
		0.825286,
		-0.100286,
		0,
		0.357169,
		-0.345944,
		-0.867613,
		0,
		-0.750722,
		0.446348,
		-0.487021,
		0,
		0.093355,
		0.166304,
		-0.625205,
		1
	},
	[1.05] = {
		0.55376,
		0.826108,
		-0.10438,
		0,
		0.354508,
		-0.347328,
		-0.868152,
		0,
		-0.753442,
		0.443744,
		-0.485198,
		0,
		0.090374,
		0.167744,
		-0.627244,
		1
	},
	[1.06666666667] = {
		0.549746,
		0.828125,
		-0.10949,
		0,
		0.350821,
		-0.347844,
		-0.869442,
		0,
		-0.758092,
		0.439561,
		-0.481749,
		0,
		0.087275,
		0.169378,
		-0.629187,
		1
	},
	[1.08333333333] = {
		0.543467,
		0.831422,
		-0.115677,
		0,
		0.346,
		-0.347424,
		-0.871539,
		0,
		-0.764806,
		0.433628,
		-0.476485,
		0,
		0.084051,
		0.171221,
		-0.631014,
		1
	}
}

return spline_matrices
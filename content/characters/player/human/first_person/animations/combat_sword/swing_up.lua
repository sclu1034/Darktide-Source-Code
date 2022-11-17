local spline_matrices = {
	[0] = {
		0.787215,
		-0.458595,
		-0.41229,
		0,
		-0.615612,
		-0.545092,
		-0.569119,
		0,
		0.036259,
		0.70183,
		-0.711422,
		0,
		-0.205659,
		0.013001,
		-0.688494,
		1
	},
	{
		0.046226,
		0.273286,
		-0.960821,
		0,
		-0.810136,
		-0.552466,
		-0.196114,
		0,
		-0.584416,
		0.787462,
		0.19586,
		0,
		0.175797,
		-0.256104,
		-0.695276,
		1
	},
	[0.0166666666667] = {
		0.644707,
		-0.66573,
		-0.375707,
		0,
		-0.709889,
		-0.339087,
		-0.617316,
		0,
		0.283569,
		0.664698,
		-0.691206,
		0,
		-0.19922,
		0.029236,
		-0.701519,
		1
	},
	[0.0333333333333] = {
		0.42205,
		-0.835325,
		-0.352285,
		0,
		-0.746402,
		-0.099622,
		-0.657997,
		0,
		0.514547,
		0.540654,
		-0.665534,
		0,
		-0.184943,
		0.043781,
		-0.715779,
		1
	},
	[0.05] = {
		0.129014,
		-0.933573,
		-0.33436,
		0,
		-0.69368,
		0.155986,
		-0.703191,
		0,
		0.708635,
		0.32266,
		-0.627476,
		0,
		-0.155668,
		0.054413,
		-0.723643,
		1
	},
	[0.0666666666667] = {
		-0.206495,
		-0.922954,
		-0.324832,
		0,
		-0.522803,
		0.384699,
		-0.760713,
		0,
		0.827065,
		0.01274,
		-0.561961,
		0,
		-0.105127,
		0.057942,
		-0.715562,
		1
	},
	[0.0833333333333] = {
		-0.541337,
		-0.749741,
		-0.38058,
		0,
		-0.247299,
		0.574592,
		-0.780184,
		0,
		0.803615,
		-0.328226,
		-0.496459,
		0,
		-0.046667,
		0.055744,
		-0.702475,
		1
	},
	[0.116666666667] = {
		-0.828986,
		0.122231,
		-0.545749,
		0,
		0.508545,
		0.570823,
		-0.644626,
		0,
		0.232733,
		-0.811924,
		-0.535364,
		0,
		0.076152,
		0.021748,
		-0.663096,
		1
	},
	[0.133333333333] = {
		-0.803833,
		-0.04614,
		-0.593063,
		0,
		0.457319,
		0.589641,
		-0.66572,
		0,
		0.38041,
		-0.806346,
		-0.452872,
		0,
		0.112876,
		0.021309,
		-0.647814,
		1
	},
	[0.15] = {
		-0.74824,
		0.08751,
		-0.657631,
		0,
		0.587472,
		0.547959,
		-0.595498,
		0,
		0.308243,
		-0.831915,
		-0.461415,
		0,
		0.158766,
		0.014465,
		-0.62699,
		1
	},
	[0.166666666667] = {
		-0.680551,
		0.173076,
		-0.711966,
		0,
		0.691089,
		0.474432,
		-0.545262,
		0,
		0.243407,
		-0.86311,
		-0.442486,
		0,
		0.201985,
		0.008781,
		-0.607328,
		1
	},
	[0.183333333333] = {
		-0.572359,
		-0.118581,
		-0.811384,
		0,
		0.681884,
		0.480765,
		-0.55127,
		0,
		0.455455,
		-0.868794,
		-0.194312,
		0,
		0.244635,
		0.018237,
		-0.586889,
		1
	},
	[0.1] = {
		-0.749587,
		-0.479174,
		-0.456631,
		0,
		0.060231,
		0.637632,
		-0.767983,
		0,
		0.65916,
		-0.603173,
		-0.449099,
		0,
		0.012323,
		0.044442,
		-0.686102,
		1
	},
	[0.216666666667] = {
		-0.471475,
		0.37084,
		-0.800118,
		0,
		0.878367,
		0.278369,
		-0.388564,
		0,
		0.078633,
		-0.885996,
		-0.456977,
		0,
		0.338778,
		0.022347,
		-0.553478,
		1
	},
	[0.233333333333] = {
		-0.302876,
		0.407919,
		-0.861317,
		0,
		0.94781,
		0.223388,
		-0.227495,
		0,
		0.099608,
		-0.885268,
		-0.454289,
		0,
		0.383422,
		0.039708,
		-0.528257,
		1
	},
	[0.25] = {
		-0.210911,
		0.44032,
		-0.872717,
		0,
		0.970258,
		0.202819,
		-0.132154,
		0,
		0.118814,
		-0.874633,
		-0.47,
		0,
		0.417888,
		0.067183,
		-0.51622,
		1
	},
	[0.266666666667] = {
		-0.146375,
		0.465862,
		-0.872667,
		0,
		0.977476,
		0.203698,
		-0.055213,
		0,
		0.152039,
		-0.861092,
		-0.485185,
		0,
		0.44067,
		0.10435,
		-0.513989,
		1
	},
	[0.283333333333] = {
		-0.179529,
		0.573359,
		-0.799393,
		0,
		0.959936,
		0.279823,
		-0.014883,
		0,
		0.215155,
		-0.770039,
		-0.600624,
		0,
		0.44067,
		0.149218,
		-0.520419,
		1
	},
	[0.2] = {
		-0.507371,
		0.321803,
		-0.799386,
		0,
		0.850168,
		0.33837,
		-0.403387,
		0,
		0.140678,
		-0.884279,
		-0.445265,
		0,
		0.294153,
		0.011896,
		-0.567228,
		1
	},
	[0.316666666667] = {
		-0.485762,
		0.688955,
		-0.537937,
		0,
		0.819327,
		0.5733,
		-0.005614,
		0,
		0.304531,
		-0.443474,
		-0.842966,
		0,
		0.339244,
		0.262834,
		-0.521481,
		1
	},
	[0.333333333333] = {
		-0.684944,
		0.617032,
		-0.387457,
		0,
		0.654447,
		0.754765,
		0.04505,
		0,
		0.320236,
		-0.222713,
		-0.920787,
		0,
		0.232057,
		0.347483,
		-0.49191,
		1
	},
	[0.35] = {
		-0.913127,
		0.327998,
		-0.242108,
		0,
		0.302842,
		0.943319,
		0.135779,
		0,
		0.27292,
		0.050663,
		-0.960702,
		0,
		0.118363,
		0.455178,
		-0.435477,
		1
	},
	[0.366666666667] = {
		-0.988574,
		0.031515,
		-0.147405,
		0,
		-0.031804,
		0.912278,
		0.408334,
		0,
		0.147343,
		0.408357,
		-0.900852,
		0,
		0.029716,
		0.551128,
		-0.344355,
		1
	},
	[0.383333333333] = {
		-0.975993,
		0.217633,
		-0.008596,
		0,
		0.081529,
		0.401651,
		0.912156,
		0,
		0.201968,
		0.889557,
		-0.409752,
		0,
		0.007775,
		0.686424,
		-0.190807,
		1
	},
	[0.3] = {
		-0.303706,
		0.663319,
		-0.683937,
		0,
		0.914033,
		0.405441,
		-0.012663,
		0,
		0.268897,
		-0.628987,
		-0.729431,
		0,
		0.409123,
		0.199096,
		-0.527054,
		1
	},
	[0.416666666667] = {
		-0.991467,
		0.084932,
		-0.098892,
		0,
		-0.081814,
		0.185186,
		0.979292,
		0,
		0.101486,
		0.979026,
		-0.176657,
		0,
		-0.028892,
		0.678623,
		0.041665,
		1
	},
	[0.433333333333] = {
		-0.997086,
		0.005466,
		-0.076093,
		0,
		-0.076149,
		-0.010699,
		0.997039,
		0,
		0.004636,
		0.999928,
		0.011084,
		0,
		-0.086297,
		0.561897,
		0.147925,
		1
	},
	[0.45] = {
		-0.992755,
		-0.099442,
		0.067448,
		0,
		0.081431,
		-0.144033,
		0.986217,
		0,
		-0.088356,
		0.984564,
		0.151087,
		0,
		-0.125062,
		0.41884,
		0.242606,
		1
	},
	[0.466666666667] = {
		-0.969982,
		-0.189416,
		0.152502,
		0,
		0.204712,
		-0.297534,
		0.932505,
		0,
		-0.131256,
		0.935732,
		0.327379,
		0,
		-0.140877,
		0.271467,
		0.323151,
		1
	},
	[0.483333333333] = {
		-0.992268,
		-0.08924,
		0.086262,
		0,
		0.120978,
		-0.540093,
		0.832865,
		0,
		-0.027735,
		0.836861,
		0.546713,
		0,
		-0.136885,
		0.149545,
		0.379663,
		1
	},
	[0.4] = {
		-0.998912,
		0.022689,
		-0.040731,
		0,
		-0.03031,
		0.347797,
		0.93708,
		0,
		0.035428,
		0.937295,
		-0.346731,
		0,
		-0.017279,
		0.733795,
		-0.120529,
		1
	},
	[0.516666666667] = {
		-0.978639,
		-0.013517,
		-0.205143,
		0,
		-0.100304,
		-0.839623,
		0.533828,
		0,
		-0.179458,
		0.543001,
		0.820332,
		0,
		-0.075659,
		0.032975,
		0.396924,
		1
	},
	[0.533333333333] = {
		-0.928128,
		-0.09433,
		-0.360111,
		0,
		-0.072246,
		-0.903327,
		0.422826,
		0,
		-0.365183,
		0.418453,
		0.831588,
		0,
		-0.023142,
		-0.049444,
		0.353226,
		1
	},
	[0.55] = {
		-0.908497,
		-0.108395,
		-0.403588,
		0,
		-0.016653,
		-0.955616,
		0.294144,
		0,
		-0.417559,
		0.27395,
		0.86637,
		0,
		0.031205,
		-0.206643,
		0.274919,
		1
	},
	[0.566666666667] = {
		-0.92872,
		-0.077765,
		-0.362534,
		0,
		-0.013393,
		-0.970085,
		0.242396,
		0,
		-0.370539,
		0.229973,
		0.899896,
		0,
		0.074843,
		-0.399371,
		0.17998,
		1
	},
	[0.583333333333] = {
		-0.949731,
		-0.043393,
		-0.310045,
		0,
		-0.01684,
		-0.981833,
		0.188996,
		0,
		-0.312613,
		0.184717,
		0.931747,
		0,
		0.109632,
		-0.568623,
		0.076337,
		1
	},
	[0.5] = {
		-0.99889,
		0.037626,
		-0.028339,
		0,
		-0.046924,
		-0.742334,
		0.668385,
		0,
		0.004111,
		0.668973,
		0.743275,
		0,
		-0.116055,
		0.081625,
		0.403293,
		1
	},
	[0.616666666667] = {
		-0.957292,
		0.018324,
		-0.288543,
		0,
		-0.05313,
		-0.992144,
		0.113263,
		0,
		-0.284201,
		0.123756,
		0.950744,
		0,
		0.141157,
		-0.644793,
		-0.113012,
		1
	},
	[0.633333333333] = {
		-0.950645,
		0.048051,
		-0.306538,
		0,
		-0.080176,
		-0.992425,
		0.093078,
		0,
		-0.299744,
		0.113061,
		0.947297,
		0,
		0.129072,
		-0.616626,
		-0.168807,
		1
	},
	[0.65] = {
		-0.937669,
		0.078599,
		-0.338524,
		0,
		-0.112157,
		-0.990408,
		0.080705,
		0,
		-0.328934,
		0.113642,
		0.93749,
		0,
		0.116347,
		-0.591037,
		-0.207588,
		1
	},
	[0.666666666667] = {
		-0.919455,
		0.109247,
		-0.377714,
		0,
		-0.146997,
		-0.986476,
		0.07251,
		0,
		-0.364684,
		0.122192,
		0.923079,
		0,
		0.105098,
		-0.568577,
		-0.2365,
		1
	},
	[0.683333333333] = {
		-0.897997,
		0.139374,
		-0.417345,
		0,
		-0.182667,
		-0.980995,
		0.065437,
		0,
		-0.400293,
		0.134997,
		0.906389,
		0,
		0.096343,
		-0.548604,
		-0.25987,
		1
	},
	[0.6] = {
		-0.956649,
		-0.010331,
		-0.291061,
		0,
		-0.033526,
		-0.988821,
		0.145289,
		0,
		-0.289308,
		0.148748,
		0.945608,
		0,
		0.137057,
		-0.653767,
		-0.027867,
		1
	},
	[0.716666666667] = {
		-0.855935,
		0.198793,
		-0.477343,
		0,
		-0.252487,
		-0.966291,
		0.050321,
		0,
		-0.451249,
		0.163595,
		0.877275,
		0,
		0.090738,
		-0.516351,
		-0.303095,
		1
	},
	[0.733333333333] = {
		-0.831544,
		0.227602,
		-0.506687,
		0,
		-0.288851,
		-0.956341,
		0.044461,
		0,
		-0.474447,
		0.183328,
		0.860983,
		0,
		0.089929,
		-0.499672,
		-0.323369,
		1
	},
	[0.75] = {
		-0.803057,
		0.255006,
		-0.538582,
		0,
		-0.326057,
		-0.944547,
		0.038949,
		0,
		-0.498784,
		0.206887,
		0.841672,
		0,
		0.090003,
		-0.482452,
		-0.344256,
		1
	},
	[0.766666666667] = {
		-0.770294,
		0.280643,
		-0.572614,
		0,
		-0.363954,
		-0.930818,
		0.033398,
		0,
		-0.523626,
		0.234131,
		0.819145,
		0,
		0.090888,
		-0.465165,
		-0.366997,
		1
	},
	[0.783333333333] = {
		-0.733123,
		0.304117,
		-0.608312,
		0,
		-0.402354,
		-0.915073,
		0.027429,
		0,
		-0.548309,
		0.264866,
		0.793224,
		0,
		0.092611,
		-0.448078,
		-0.391127,
		1
	},
	[0.7] = {
		-0.876444,
		0.168899,
		-0.450909,
		0,
		-0.217082,
		-0.974492,
		0.056929,
		0,
		-0.429791,
		0.147779,
		0.890753,
		0,
		0.092312,
		-0.532202,
		-0.282095,
		1
	},
	[0.816666666667] = {
		-0.645355,
		0.34304,
		-0.682525,
		0,
		-0.48004,
		-0.87715,
		0.013038,
		0,
		-0.594204,
		0.336054,
		0.730746,
		0,
		0.099426,
		-0.416653,
		-0.439873,
		1
	},
	[0.833333333333] = {
		-0.594902,
		0.357657,
		-0.719843,
		0,
		-0.518742,
		-0.854922,
		0.003935,
		0,
		-0.614002,
		0.375754,
		0.694126,
		0,
		0.104089,
		-0.403058,
		-0.463961,
		1
	},
	[0.85] = {
		-0.540362,
		0.368489,
		-0.756456,
		0,
		-0.556782,
		-0.83063,
		-0.006893,
		0,
		-0.630875,
		0.417456,
		0.654009,
		0,
		0.10966,
		-0.390299,
		-0.487965,
		1
	},
	[0.866666666667] = {
		-0.48209,
		0.375218,
		-0.791707,
		0,
		-0.593781,
		-0.804386,
		-0.019659,
		0,
		-0.644215,
		0.460624,
		0.610584,
		0,
		0.116358,
		-0.377342,
		-0.512201,
		1
	},
	[0.883333333333] = {
		-0.420554,
		0.377601,
		-0.824955,
		0,
		-0.629352,
		-0.776353,
		-0.034518,
		0,
		-0.653491,
		0.504671,
		0.564143,
		0,
		0.123976,
		-0.364146,
		-0.536543,
		1
	},
	[0.8] = {
		-0.691483,
		0.325011,
		-0.645151,
		0,
		-0.441026,
		-0.897256,
		0.020683,
		0,
		-0.572143,
		0.29883,
		0.763775,
		0,
		0.095529,
		-0.431802,
		-0.415511,
		1
	},
	[0.916666666667] = {
		-0.29006,
		0.368829,
		-0.88308,
		0,
		-0.694681,
		-0.715825,
		-0.070795,
		0,
		-0.658243,
		0.592924,
		0.463851,
		0,
		0.140803,
		-0.336733,
		-0.584956,
		1
	},
	[0.933333333333] = {
		-0.222474,
		0.35769,
		-0.906952,
		0,
		-0.723742,
		-0.683886,
		-0.092183,
		0,
		-0.653225,
		0.635891,
		0.411022,
		0,
		0.149296,
		-0.322276,
		-0.608669,
		1
	},
	[0.95] = {
		-0.154319,
		0.342246,
		-0.926851,
		0,
		-0.750006,
		-0.65125,
		-0.115604,
		0,
		-0.643177,
		0.677304,
		0.357187,
		0,
		0.157333,
		-0.307117,
		-0.631774,
		1
	},
	[0.966666666667] = {
		-0.086345,
		0.322773,
		-0.94253,
		0,
		-0.773252,
		-0.61825,
		-0.140885,
		0,
		-0.628193,
		0.716648,
		0.302967,
		0,
		0.164596,
		-0.291115,
		-0.65407,
		1
	},
	[0.983333333333] = {
		-0.019274,
		0.299639,
		-0.953858,
		0,
		-0.793324,
		-0.585217,
		-0.167806,
		0,
		-0.608495,
		0.753484,
		0.248991,
		0,
		0.170819,
		-0.274146,
		-0.675328,
		1
	},
	[0.9] = {
		-0.356325,
		0.375487,
		-0.855594,
		0,
		-0.663107,
		-0.746747,
		-0.051557,
		0,
		-0.658271,
		0.54898,
		0.515073,
		0,
		0.132237,
		-0.350644,
		-0.56085,
		1
	},
	[1.01666666667] = {
		0.10957,
		0.244205,
		-0.963514,
		0,
		-0.823672,
		-0.520287,
		-0.225535,
		0,
		-0.556381,
		0.818331,
		0.144137,
		0,
		0.174241,
		-0.232584,
		-0.703845,
		1
	},
	[1.03333333333] = {
		0.170265,
		0.212918,
		-0.96212,
		0,
		-0.833975,
		-0.488935,
		-0.255789,
		0,
		-0.524876,
		0.845937,
		0.09432,
		0,
		0.171146,
		-0.207818,
		-0.708067,
		1
	},
	[1.05] = {
		0.227922,
		0.179958,
		-0.956905,
		0,
		-0.841147,
		-0.45862,
		-0.2866,
		0,
		-0.490431,
		0.87022,
		0.046841,
		0,
		0.16834,
		-0.183434,
		-0.71104,
		1
	},
	[1.06666666667] = {
		0.282263,
		0.145846,
		-0.948186,
		0,
		-0.84533,
		-0.429509,
		-0.31771,
		0,
		-0.453591,
		0.891208,
		0.002053,
		0,
		0.165876,
		-0.159573,
		-0.712868,
		1
	},
	[1.08333333333] = {
		0.331754,
		0.113058,
		-0.936567,
		0,
		-0.848021,
		-0.399192,
		-0.348578,
		0,
		-0.413279,
		0.90987,
		-0.036558,
		0,
		0.163681,
		-0.13611,
		-0.713412,
		1
	},
	[1.11666666667] = {
		0.41706,
		0.053217,
		-0.90732,
		0,
		-0.846024,
		-0.342061,
		-0.408948,
		0,
		-0.332122,
		0.938169,
		-0.097637,
		0,
		0.160144,
		-0.091265,
		-0.709665,
		1
	},
	[1.13333333333] = {
		0.454034,
		0.025676,
		-0.890614,
		0,
		-0.841848,
		-0.315001,
		-0.438254,
		0,
		-0.291797,
		0.948744,
		-0.121406,
		0,
		0.158779,
		-0.069981,
		-0.703871,
		1
	},
	[1.15] = {
		0.487931,
		-0.000757,
		-0.872882,
		0,
		-0.835796,
		-0.288795,
		-0.46695,
		0,
		-0.25173,
		0.957391,
		-0.141545,
		0,
		0.157618,
		-0.049507,
		-0.695394,
		1
	},
	[1.16666666667] = {
		0.519212,
		-0.026518,
		-0.854234,
		0,
		-0.827974,
		-0.26336,
		-0.495076,
		0,
		-0.211843,
		0.964333,
		-0.158696,
		0,
		0.156854,
		-0.029997,
		-0.685466,
		1
	},
	[1.18333333333] = {
		0.548263,
		-0.052082,
		-0.834683,
		0,
		-0.818434,
		-0.238648,
		-0.522698,
		0,
		-0.171972,
		0.969709,
		-0.173467,
		0,
		0.156433,
		-0.01367,
		-0.674236,
		1
	},
	[1.1] = {
		0.376489,
		0.082245,
		-0.922763,
		0,
		-0.848157,
		-0.370084,
		-0.379035,
		0,
		-0.372674,
		0.92535,
		-0.069576,
		0,
		0.161778,
		-0.113327,
		-0.712649,
		1
	},
	[1.21666666667] = {
		0.600812,
		-0.104641,
		-0.792512,
		0,
		-0.794157,
		-0.191382,
		-0.57679,
		0,
		-0.091317,
		0.975922,
		-0.198086,
		0,
		0.156729,
		0.007037,
		-0.649678,
		1
	},
	[1.23333333333] = {
		0.624661,
		-0.132661,
		-0.769545,
		0,
		-0.779296,
		-0.168943,
		-0.603453,
		0,
		-0.049955,
		0.976657,
		-0.208915,
		0,
		0.157534,
		0.014255,
		-0.637334,
		1
	},
	[1.25] = {
		0.646967,
		-0.162508,
		-0.745,
		0,
		-0.762481,
		-0.147464,
		-0.629982,
		0,
		-0.007484,
		0.975626,
		-0.219314,
		0,
		0.158841,
		0.021266,
		-0.625595,
		1
	},
	[1.26666666667] = {
		0.667648,
		-0.194566,
		-0.718603,
		0,
		-0.743587,
		-0.12709,
		-0.65645,
		0,
		0.036396,
		0.972621,
		-0.229528,
		0,
		0.160694,
		0.029536,
		-0.614942,
		1
	},
	[1.2] = {
		0.575389,
		-0.077951,
		-0.814157,
		0,
		-0.807176,
		-0.214644,
		-0.549904,
		0,
		-0.131888,
		0.973577,
		-0.186424,
		0,
		0.156377,
		-0.001799,
		-0.662142,
		1
	}
}

return spline_matrices

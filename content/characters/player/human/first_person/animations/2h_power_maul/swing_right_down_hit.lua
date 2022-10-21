local spline_matrices = {
	[0] = {
		0.932436,
		0.008157,
		0.361244,
		0,
		0.329387,
		0.391833,
		-0.859052,
		0,
		-0.148555,
		0.92,
		0.362673,
		0,
		0.052063,
		0.380126,
		-0.198059,
		1
	},
	{
		0.915787,
		0.079051,
		-0.39381,
		0,
		-0.126429,
		0.987337,
		-0.095814,
		0,
		0.381249,
		0.137535,
		0.914185,
		0,
		0.109011,
		0.437035,
		-0.442571,
		1
	},
	[0.0166666666667] = {
		0.911921,
		0.052062,
		0.40705,
		0,
		0.385066,
		0.234337,
		-0.892642,
		0,
		-0.14186,
		0.97076,
		0.193649,
		0,
		0.226448,
		0.488097,
		-0.50053,
		1
	},
	[0.0333333333333] = {
		0.916777,
		0.009099,
		0.399296,
		0,
		0.387783,
		0.21908,
		-0.895337,
		0,
		-0.095625,
		0.975664,
		0.197319,
		0,
		0.250916,
		0.542338,
		-0.518548,
		1
	},
	[0.05] = {
		0.931906,
		-0.047084,
		0.359632,
		0,
		0.361671,
		0.195282,
		-0.911624,
		0,
		-0.027307,
		0.979616,
		0.199013,
		0,
		0.208784,
		0.534727,
		-0.533099,
		1
	},
	[0.0666666666667] = {
		0.944166,
		-0.10105,
		0.313591,
		0,
		0.32723,
		0.176804,
		-0.928257,
		0,
		0.038356,
		0.979045,
		0.199999,
		0,
		0.148044,
		0.501068,
		-0.537127,
		1
	},
	[0.0833333333333] = {
		0.948814,
		-0.12736,
		0.289017,
		0,
		0.306484,
		0.150256,
		-0.939942,
		0,
		0.076285,
		0.980409,
		0.181599,
		0,
		0.116598,
		0.469083,
		-0.539406,
		1
	},
	[0.116666666667] = {
		0.946134,
		-0.107348,
		0.305463,
		0,
		0.317384,
		0.120945,
		-0.940553,
		0,
		0.064022,
		0.986838,
		0.148501,
		0,
		0.115636,
		0.437171,
		-0.498961,
		1
	},
	[0.133333333333] = {
		0.942664,
		-0.092453,
		0.320681,
		0,
		0.331655,
		0.152211,
		-0.931041,
		0,
		0.037267,
		0.984014,
		0.174146,
		0,
		0.114721,
		0.441013,
		-0.447316,
		1
	},
	[0.15] = {
		0.938667,
		-0.082143,
		0.334897,
		0,
		0.344758,
		0.204565,
		-0.916131,
		0,
		0.006745,
		0.9754,
		0.220338,
		0,
		0.113598,
		0.451352,
		-0.388853,
		1
	},
	[0.166666666667] = {
		0.935277,
		-0.075359,
		0.345801,
		0,
		0.353312,
		0.255916,
		-0.899821,
		0,
		-0.020686,
		0.963757,
		0.265977,
		0,
		0.112909,
		0.459093,
		-0.340867,
		1
	},
	[0.183333333333] = {
		0.934366,
		-0.069073,
		0.349556,
		0,
		0.35426,
		0.285309,
		-0.890561,
		0,
		-0.038217,
		0.955943,
		0.291053,
		0,
		0.112671,
		0.459391,
		-0.321631,
		1
	},
	[0.1] = {
		0.948431,
		-0.122671,
		0.292284,
		0,
		0.306799,
		0.12339,
		-0.943742,
		0,
		0.079705,
		0.984747,
		0.154662,
		0,
		0.116032,
		0.448079,
		-0.530956,
		1
	},
	[0.216666666667] = {
		0.937503,
		-0.054097,
		0.343748,
		0,
		0.343141,
		0.307863,
		-0.887398,
		0,
		-0.057821,
		0.949891,
		0.307185,
		0,
		0.113251,
		0.452858,
		-0.325709,
		1
	},
	[0.233333333333] = {
		0.939852,
		-0.046343,
		0.338422,
		0,
		0.335006,
		0.31851,
		-0.886748,
		0,
		-0.066697,
		0.946786,
		0.314878,
		0,
		0.11394,
		0.449988,
		-0.32933,
		1
	},
	[0.25] = {
		0.942675,
		-0.038541,
		0.331478,
		0,
		0.325224,
		0.328696,
		-0.886673,
		0,
		-0.074782,
		0.943649,
		0.322388,
		0,
		0.114884,
		0.447029,
		-0.333929,
		1
	},
	[0.266666666667] = {
		0.945927,
		-0.030815,
		0.322912,
		0,
		0.31386,
		0.338391,
		-0.887121,
		0,
		-0.081934,
		0.940501,
		0.329765,
		0,
		0.116089,
		0.443725,
		-0.339466,
		1
	},
	[0.283333333333] = {
		0.949559,
		-0.023319,
		0.31272,
		0,
		0.300995,
		0.347548,
		-0.888039,
		0,
		-0.087978,
		0.937372,
		0.337036,
		0,
		0.117586,
		0.439824,
		-0.345912,
		1
	},
	[0.2] = {
		0.935664,
		-0.061701,
		0.347456,
		0,
		0.349573,
		0.296786,
		-0.88866,
		0,
		-0.048289,
		0.952949,
		0.299261,
		0,
		0.11282,
		0.455904,
		-0.323121,
		1
	},
	[0.316666666667] = {
		0.957715,
		-0.009391,
		0.287565,
		0,
		0.271102,
		0.364193,
		-0.890992,
		0,
		-0.096362,
		0.931276,
		0.351339,
		0,
		0.121496,
		0.42928,
		-0.361468,
		1
	},
	[0.333333333333] = {
		0.962103,
		-0.003214,
		0.272667,
		0,
		0.25429,
		0.371626,
		-0.892878,
		0,
		-0.09846,
		0.928377,
		0.35836,
		0,
		0.123969,
		0.422122,
		-0.370603,
		1
	},
	[0.35] = {
		0.966598,
		0.002286,
		0.256287,
		0,
		0.236391,
		0.378436,
		-0.894933,
		0,
		-0.099034,
		0.925625,
		0.365255,
		0,
		0.12679,
		0.41364,
		-0.380578,
		1
	},
	[0.366666666667] = {
		0.97112,
		0.007014,
		0.238489,
		0,
		0.217529,
		0.384611,
		-0.897082,
		0,
		-0.098018,
		0.923052,
		0.371978,
		0,
		0.12991,
		0.404078,
		-0.391232,
		1
	},
	[0.383333333333] = {
		0.975589,
		0.010901,
		0.219336,
		0,
		0.197816,
		0.390125,
		-0.899262,
		0,
		-0.095372,
		0.920698,
		0.378445,
		0,
		0.133269,
		0.393683,
		-0.40241,
		1
	},
	[0.3] = {
		0.95351,
		-0.016133,
		0.30093,
		0,
		0.286708,
		0.35616,
		-0.889353,
		0,
		-0.092831,
		0.934286,
		0.344227,
		0,
		0.119378,
		0.435087,
		-0.353247,
		1
	},
	[0.416666666667] = {
		0.984027,
		0.016014,
		0.177298,
		0,
		0.156295,
		0.399068,
		-0.903502,
		0,
		-0.085223,
		0.916782,
		0.390191,
		0,
		0.140403,
		0.371332,
		-0.42569,
		1
	},
	[0.433333333333] = {
		0.987827,
		0.01731,
		0.154591,
		0,
		0.134685,
		0.402063,
		-0.905652,
		0,
		-0.077832,
		0.915448,
		0.394837,
		0,
		0.144013,
		0.35967,
		-0.437602,
		1
	},
	[0.45] = {
		0.991238,
		0.017841,
		0.130881,
		0,
		0.112615,
		0.403707,
		-0.907931,
		0,
		-0.069036,
		0.914714,
		0.39816,
		0,
		0.147556,
		0.347622,
		-0.449652,
		1
	},
	[0.466666666667] = {
		0.99418,
		0.017662,
		0.106275,
		0,
		0.090149,
		0.40374,
		-0.910422,
		0,
		-0.058987,
		0.914703,
		0.399798,
		0,
		0.150981,
		0.335044,
		-0.461808,
		1
	},
	[0.483333333333] = {
		0.996578,
		0.016835,
		0.080922,
		0,
		0.067363,
		0.401887,
		-0.913208,
		0,
		-0.047895,
		0.915534,
		0.399378,
		0,
		0.154231,
		0.321958,
		-0.473932,
		1
	},
	[0.4] = {
		0.979918,
		0.013899,
		0.198915,
		0,
		0.177374,
		0.394986,
		-0.901401,
		0,
		-0.091098,
		0.918582,
		0.384589,
		0,
		0.136793,
		0.382704,
		-0.413936,
		1
	},
	[0.516666666667] = {
		0.999506,
		0.013479,
		0.028401,
		0,
		0.020863,
		0.3914,
		-0.919984,
		0,
		-0.023516,
		0.920122,
		0.390925,
		0,
		0.159983,
		0.294279,
		-0.497408,
		1
	},
	[0.533333333333] = {
		0.999938,
		0.010993,
		0.001626,
		0,
		-0.002723,
		0.384274,
		-0.923215,
		0,
		-0.010774,
		0.923154,
		0.38428,
		0,
		0.162428,
		0.279257,
		-0.507936,
		1
	},
	[0.55] = {
		0.999654,
		0.007948,
		-0.025092,
		0,
		-0.026233,
		0.378549,
		-0.92521,
		0,
		0.002145,
		0.925547,
		0.378626,
		0,
		0.164538,
		0.264144,
		-0.516521,
		1
	},
	[0.566666666667] = {
		0.998657,
		0.004398,
		-0.051627,
		0,
		-0.049519,
		0.374309,
		-0.925981,
		0,
		0.015252,
		0.927293,
		0.374024,
		0,
		0.166281,
		0.249004,
		-0.523304,
		1
	},
	[0.583333333333] = {
		0.996964,
		0.0004,
		-0.077863,
		0,
		-0.072435,
		0.371633,
		-0.92555,
		0,
		0.028566,
		0.92838,
		0.370533,
		0,
		0.167628,
		0.233903,
		-0.528434,
		1
	},
	[0.5] = {
		0.998371,
		0.015419,
		0.054929,
		0,
		0.044272,
		0.39787,
		-0.916373,
		0,
		-0.035985,
		0.917312,
		0.39654,
		0,
		0.157247,
		0.308371,
		-0.485862,
		1
	},
	[0.616666666667] = {
		0.991605,
		-0.008717,
		-0.129007,
		0,
		-0.116582,
		0.371243,
		-0.921188,
		0,
		0.055923,
		0.928495,
		0.36711,
		0,
		0.169036,
		0.204123,
		-0.534349,
		1
	},
	[0.633333333333] = {
		0.988035,
		-0.013605,
		-0.153631,
		0,
		-0.137494,
		0.373618,
		-0.917336,
		0,
		0.06988,
		0.927483,
		0.367277,
		0,
		0.169072,
		0.190011,
		-0.535376,
		1
	},
	[0.65] = {
		0.983967,
		-0.018456,
		-0.177395,
		0,
		-0.157379,
		0.37812,
		-0.912281,
		0,
		0.083914,
		0.925573,
		0.369153,
		0,
		0.168704,
		0.177262,
		-0.535165,
		1
	},
	[0.666666666667] = {
		0.979476,
		-0.023082,
		-0.200236,
		0,
		-0.176108,
		0.385238,
		-0.905857,
		0,
		0.098048,
		0.922528,
		0.373267,
		0,
		0.167924,
		0.16591,
		-0.533941,
		1
	},
	[0.683333333333] = {
		0.974641,
		-0.027339,
		-0.222098,
		0,
		-0.193554,
		0.395101,
		-0.898016,
		0,
		0.112302,
		0.918231,
		0.37979,
		0,
		0.166718,
		0.155857,
		-0.531979,
		1
	},
	[0.6] = {
		0.994602,
		-0.003993,
		-0.10369,
		0,
		-0.094836,
		0.370589,
		-0.923942,
		0,
		0.042116,
		0.928788,
		0.36821,
		0,
		0.168555,
		0.218915,
		-0.532063,
		1
	},
	[0.716666666667] = {
		0.964277,
		-0.034166,
		-0.262682,
		0,
		-0.224102,
		0.4235,
		-0.877739,
		0,
		0.141234,
		0.905252,
		0.400714,
		0,
		0.163132,
		0.14061,
		-0.526394,
		1
	},
	[0.733333333333] = {
		0.958926,
		-0.03644,
		-0.281304,
		0,
		-0.236959,
		0.442214,
		-0.865042,
		0,
		0.155919,
		0.896169,
		0.415416,
		0,
		0.160836,
		0.135909,
		-0.523007,
		1
	},
	[0.75] = {
		0.953587,
		-0.037758,
		-0.298742,
		0,
		-0.248038,
		0.464023,
		-0.850388,
		0,
		0.170732,
		0.885018,
		0.433121,
		0,
		0.158287,
		0.133491,
		-0.519343,
		1
	},
	[0.766666666667] = {
		0.948355,
		-0.037977,
		-0.314929,
		0,
		-0.257215,
		0.488958,
		-0.833523,
		0,
		0.185642,
		0.871481,
		0.453937,
		0,
		0.15557,
		0.133609,
		-0.515447,
		1
	},
	[0.783333333333] = {
		0.943332,
		-0.036956,
		-0.329786,
		0,
		-0.264364,
		0.517009,
		-0.814134,
		0,
		0.20059,
		0.855182,
		0.477942,
		0,
		0.152787,
		0.136508,
		-0.511319,
		1
	},
	[0.7] = {
		0.969546,
		-0.031083,
		-0.242929,
		0,
		-0.209593,
		0.407822,
		-0.88868,
		0,
		0.126695,
		0.912532,
		0.388887,
		0,
		0.165109,
		0.147342,
		-0.529421,
		1
	},
	[0.816666666667] = {
		0.934627,
		-0.029417,
		-0.35441,
		0,
		-0.271153,
		0.58587,
		-0.763697,
		0,
		0.230104,
		0.809871,
		0.539593,
		0,
		0.147839,
		0.152832,
		-0.502042,
		1
	},
	[0.833333333333] = {
		0.931629,
		-0.020693,
		-0.362822,
		0,
		-0.26903,
		0.631926,
		-0.726837,
		0,
		0.244317,
		0.774752,
		0.583154,
		0,
		0.145962,
		0.16811,
		-0.497099,
		1
	},
	[0.85] = {
		0.929519,
		-0.009197,
		-0.368658,
		0,
		-0.263354,
		0.683234,
		-0.681055,
		0,
		0.258144,
		0.730142,
		0.632657,
		0,
		0.143926,
		0.187311,
		-0.492493,
		1
	},
	[0.866666666667] = {
		0.928158,
		0.004169,
		-0.372162,
		0,
		-0.254529,
		0.736663,
		-0.626533,
		0,
		0.271546,
		0.676247,
		0.684801,
		0,
		0.141707,
		0.210245,
		-0.487984,
		1
	},
	[0.883333333333] = {
		0.927371,
		0.01846,
		-0.373687,
		0,
		-0.242992,
		0.789183,
		-0.564043,
		0,
		0.284495,
		0.61388,
		0.736351,
		0,
		0.139282,
		0.236523,
		-0.483333,
		1
	},
	[0.8] = {
		0.938621,
		-0.034564,
		-0.343213,
		0,
		-0.269357,
		0.548124,
		-0.791838,
		0,
		0.215492,
		0.835683,
		0.505171,
		0,
		0.150067,
		0.142426,
		-0.506902,
		1
	},
	[0.916666666667] = {
		0.926658,
		0.046144,
		-0.373063,
		0,
		-0.213623,
		0.881249,
		-0.421623,
		0,
		0.309306,
		0.470395,
		0.826474,
		0,
		0.133659,
		0.296388,
		-0.473096,
		1
	},
	[0.933333333333] = {
		0.926212,
		0.057935,
		-0.372525,
		0,
		-0.196688,
		0.917243,
		-0.346379,
		0,
		0.321628,
		0.394092,
		0.860957,
		0,
		0.130301,
		0.328091,
		-0.467695,
		1
	},
	[0.95] = {
		0.925231,
		0.067648,
		-0.373325,
		0,
		-0.180628,
		0.943848,
		-0.27663,
		0,
		0.333649,
		0.323379,
		0.885497,
		0,
		0.126596,
		0.35786,
		-0.461417,
		1
	},
	[0.966666666667] = {
		0.923448,
		0.074717,
		-0.376379,
		0,
		-0.163915,
		0.963675,
		-0.210861,
		0,
		0.346952,
		0.256414,
		0.902151,
		0,
		0.122137,
		0.386229,
		-0.454389,
		1
	},
	[0.983333333333] = {
		0.920446,
		0.078793,
		-0.382847,
		0,
		-0.146773,
		0.977468,
		-0.151703,
		0,
		0.362267,
		0.195826,
		0.911271,
		0,
		0.116519,
		0.412025,
		-0.447853,
		1
	},
	[0.9] = {
		0.926951,
		0.032739,
		-0.373752,
		0,
		-0.229204,
		0.838093,
		-0.49504,
		0,
		0.297032,
		0.544544,
		0.784375,
		0,
		0.136618,
		0.265521,
		-0.478376,
		1
	},
	[1.01666666667] = {
		0.909382,
		0.075967,
		-0.408966,
		0,
		-0.100816,
		0.99412,
		-0.039516,
		0,
		0.403559,
		0.077165,
		0.911694,
		0,
		0.09983,
		0.463049,
		-0.437972,
		1
	},
	[1.03333333333] = {
		0.901355,
		0.071029,
		-0.427217,
		0,
		-0.07143,
		0.997331,
		0.015111,
		0,
		0.42715,
		0.016896,
		0.904023,
		0,
		0.089726,
		0.489,
		-0.433814,
		1
	},
	[1.05] = {
		0.891973,
		0.065499,
		-0.447319,
		0,
		-0.040123,
		0.997014,
		0.065983,
		0,
		0.450305,
		-0.040908,
		0.891937,
		0,
		0.079317,
		0.513797,
		-0.430018,
		1
	},
	[1.06666666667] = {
		0.881703,
		0.06038,
		-0.467926,
		0,
		-0.009071,
		0.993763,
		0.11114,
		0,
		0.471718,
		-0.093748,
		0.876752,
		0,
		0.069078,
		0.536331,
		-0.426682,
		1
	},
	[1.08333333333] = {
		0.871227,
		0.056397,
		-0.487629,
		0,
		0.019316,
		0.98867,
		0.148856,
		0,
		0.4905,
		-0.139107,
		0.860267,
		0,
		0.059329,
		0.555501,
		-0.424045,
		1
	},
	[1.11666666667] = {
		0.853245,
		0.053614,
		-0.518747,
		0,
		0.05791,
		0.978809,
		0.196415,
		0,
		0.518285,
		-0.197631,
		0.83206,
		0,
		0.04199,
		0.579461,
		-0.422255,
		1
	},
	[1.13333333333] = {
		0.846507,
		0.054131,
		-0.529619,
		0,
		0.06444,
		0.977085,
		0.202861,
		0,
		0.528464,
		-0.205852,
		0.823621,
		0,
		0.033723,
		0.581488,
		-0.424792,
		1
	},
	[1.15] = {
		0.84031,
		0.054249,
		-0.539384,
		0,
		0.063643,
		0.978227,
		0.197537,
		0,
		0.538357,
		-0.20032,
		0.818562,
		0,
		0.02485,
		0.576696,
		-0.4304,
		1
	},
	[1.16666666667] = {
		0.83465,
		0.053851,
		-0.548142,
		0,
		0.056979,
		0.981427,
		0.183179,
		0,
		0.547826,
		-0.184123,
		0.81608,
		0,
		0.015822,
		0.567097,
		-0.437882,
		1
	},
	[1.18333333333] = {
		0.829522,
		0.05294,
		-0.55596,
		0,
		0.045961,
		0.985649,
		0.162432,
		0,
		0.55658,
		-0.160293,
		0.815184,
		0,
		0.007144,
		0.554683,
		-0.445986,
		1
	},
	[1.1] = {
		0.861414,
		0.054035,
		-0.505021,
		0,
		0.0425,
		0.983169,
		0.177688,
		0,
		0.506123,
		-0.174526,
		0.844618,
		0,
		0.050262,
		0.570232,
		-0.422445,
		1
	},
	[1.21666666667] = {
		0.820841,
		0.050108,
		-0.568955,
		0,
		0.017253,
		0.993514,
		0.112391,
		0,
		0.570897,
		-0.102072,
		0.814652,
		0,
		-0.007165,
		0.529524,
		-0.459202,
		1
	},
	[1.23333333333] = {
		0.81723,
		0.048653,
		-0.574255,
		0,
		0.002908,
		0.996069,
		0.08853,
		0,
		0.576305,
		-0.07402,
		0.813876,
		0,
		-0.01193,
		0.520491,
		-0.462259,
		1
	},
	[1.25] = {
		0.814091,
		0.047576,
		-0.578786,
		0,
		-0.009134,
		0.997564,
		0.069153,
		0,
		0.580666,
		-0.05101,
		0.812542,
		0,
		-0.015116,
		0.514511,
		-0.463032,
		1
	},
	[1.26666666667] = {
		0.811359,
		0.047242,
		-0.582637,
		0,
		-0.017174,
		0.998225,
		0.057023,
		0,
		0.584296,
		-0.03626,
		0.81073,
		0,
		-0.017089,
		0.511448,
		-0.4624,
		1
	},
	[1.28333333333] = {
		0.808971,
		0.048047,
		-0.585881,
		0,
		-0.019539,
		0.998301,
		0.054891,
		0,
		0.587523,
		-0.032958,
		0.808536,
		0,
		-0.018222,
		0.511152,
		-0.461248,
		1
	},
	[1.2] = {
		0.824923,
		0.051627,
		-0.562883,
		0,
		0.032168,
		0.989918,
		0.137937,
		0,
		0.56433,
		-0.131894,
		0.814945,
		0,
		-0.000676,
		0.541471,
		-0.453481,
		1
	}
}

return spline_matrices

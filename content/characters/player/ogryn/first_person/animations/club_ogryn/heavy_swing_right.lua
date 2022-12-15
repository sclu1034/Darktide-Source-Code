local spline_matrices = {
	[0] = {
		-0.113482,
		-0.078982,
		0.990396,
		0,
		-0.946875,
		0.31051,
		-0.083732,
		0,
		-0.300915,
		-0.947283,
		-0.110024,
		0,
		-1.159479,
		0.461904,
		-0.36807,
		1
	},
	{
		-0.052826,
		-0.247138,
		0.967539,
		0,
		0.28554,
		-0.932177,
		-0.222516,
		0,
		0.95691,
		0.264517,
		0.119811,
		0,
		1.633716,
		0.036517,
		-0.320231,
		1
	},
	[0.0166666666667] = {
		-0.128589,
		-0.065925,
		0.989504,
		0,
		-0.911534,
		0.400859,
		-0.09175,
		0,
		-0.390603,
		-0.913765,
		-0.111639,
		0,
		-1.155405,
		0.503752,
		-0.365803,
		1
	},
	[0.0333333333333] = {
		-0.144716,
		-0.04927,
		0.988246,
		0,
		-0.863522,
		0.493925,
		-0.101827,
		0,
		-0.483102,
		-0.868108,
		-0.114024,
		0,
		-1.150366,
		0.577747,
		-0.358238,
		1
	},
	[0.05] = {
		-0.155229,
		-0.035617,
		0.987236,
		0,
		-0.81286,
		0.572517,
		-0.107156,
		0,
		-0.561394,
		-0.819119,
		-0.117822,
		0,
		-1.144747,
		0.659235,
		-0.347221,
		1
	},
	[0.0666666666667] = {
		-0.155265,
		-0.033017,
		0.987321,
		0,
		-0.775448,
		0.623265,
		-0.101104,
		0,
		-0.612024,
		-0.781313,
		-0.122374,
		0,
		-1.140418,
		0.724191,
		-0.334651,
		1
	},
	[0.0833333333333] = {
		-0.144078,
		-0.046023,
		0.988496,
		0,
		-0.764722,
		0.63916,
		-0.081704,
		0,
		-0.628046,
		-0.767696,
		-0.127283,
		0,
		-1.139105,
		0.769041,
		-0.320945,
		1
	},
	[0.116666666667] = {
		-0.097493,
		-0.103424,
		0.989848,
		0,
		-0.807666,
		0.589366,
		-0.01797,
		0,
		-0.581524,
		-0.801219,
		-0.140991,
		0,
		-1.135744,
		0.838906,
		-0.288863,
		1
	},
	[0.133333333333] = {
		-0.063872,
		-0.139128,
		0.988212,
		0,
		-0.843895,
		0.5361,
		0.020932,
		0,
		-0.532692,
		-0.832611,
		-0.151651,
		0,
		-1.123279,
		0.866209,
		-0.27136,
		1
	},
	[0.15] = {
		-0.025481,
		-0.174195,
		0.984381,
		0,
		-0.878977,
		0.472954,
		0.060941,
		0,
		-0.476182,
		-0.863696,
		-0.165165,
		0,
		-1.102352,
		0.89016,
		-0.253597,
		1
	},
	[0.166666666667] = {
		0.015136,
		-0.20589,
		0.978458,
		0,
		-0.907478,
		0.408049,
		0.099901,
		0,
		-0.419827,
		-0.889441,
		-0.180664,
		0,
		-1.073767,
		0.912344,
		-0.236002,
		1
	},
	[0.183333333333] = {
		0.054852,
		-0.232877,
		0.970958,
		0,
		-0.926503,
		0.350677,
		0.136448,
		0,
		-0.372268,
		-0.90708,
		-0.196526,
		0,
		-1.038292,
		0.935172,
		-0.218809,
		1
	},
	[0.1] = {
		-0.124562,
		-0.070944,
		0.989672,
		0,
		-0.778223,
		0.625739,
		-0.053093,
		0,
		-0.61551,
		-0.7768,
		-0.133154,
		0,
		-1.139531,
		0.806892,
		-0.305544,
		1
	},
	[0.216666666667] = {
		0.118756,
		-0.27361,
		0.954481,
		0,
		-0.934114,
		0.29513,
		0.200824,
		0,
		-0.336643,
		-0.915443,
		-0.220534,
		0,
		-0.951485,
		0.991669,
		-0.18563,
		1
	},
	[0.233333333333] = {
		0.1369,
		-0.289165,
		0.94744,
		0,
		-0.921299,
		0.314249,
		0.229034,
		0,
		-0.363961,
		-0.904229,
		-0.223387,
		0,
		-0.903253,
		1.028725,
		-0.169359,
		1
	},
	[0.25] = {
		0.141356,
		-0.302071,
		0.942747,
		0,
		-0.890572,
		0.377075,
		0.254353,
		0,
		-0.432319,
		-0.875538,
		-0.215714,
		0,
		-0.852729,
		1.07424,
		-0.15316,
		1
	},
	[0.266666666667] = {
		0.127839,
		-0.310299,
		0.942004,
		0,
		-0.825705,
		0.492862,
		0.274406,
		0,
		-0.549426,
		-0.812897,
		-0.193208,
		0,
		-0.798408,
		1.130419,
		-0.137324,
		1
	},
	[0.283333333333] = {
		0.063292,
		-0.304583,
		0.950381,
		0,
		-0.654492,
		0.706243,
		0.269927,
		0,
		-0.753415,
		-0.639101,
		-0.154648,
		0,
		-0.7042,
		1.207228,
		-0.117794,
		1
	},
	[0.2] = {
		0.090397,
		-0.255173,
		0.96266,
		0,
		-0.935341,
		0.310191,
		0.170054,
		0,
		-0.342002,
		-0.915788,
		-0.210634,
		0,
		-0.996962,
		0.961063,
		-0.202055,
		1
	},
	[0.316666666667] = {
		-0.08438,
		-0.153649,
		0.984516,
		0,
		0.153534,
		0.974236,
		0.165203,
		0,
		-0.984534,
		0.165097,
		-0.058615,
		0,
		-0.240961,
		1.420296,
		-0.096068,
		1
	},
	[0.333333333333] = {
		-0.042822,
		-0.064925,
		0.996971,
		0,
		0.535997,
		0.840631,
		0.077766,
		0,
		-0.843133,
		0.537704,
		-0.001198,
		0,
		0.087137,
		1.529046,
		-0.104827,
		1
	},
	[0.35] = {
		0.071653,
		-0.068541,
		0.995072,
		0,
		0.840049,
		0.542016,
		-0.023156,
		0,
		-0.537758,
		0.837568,
		0.096414,
		0,
		0.507051,
		1.51399,
		-0.147226,
		1
	},
	[0.366666666667] = {
		0.114538,
		-0.123336,
		0.985733,
		0,
		0.98272,
		0.1593,
		-0.094257,
		0,
		-0.145402,
		0.979496,
		0.13945,
		0,
		0.907528,
		1.401942,
		-0.205187,
		1
	},
	[0.383333333333] = {
		0.122075,
		-0.177969,
		0.976435,
		0,
		0.986938,
		-0.082437,
		-0.138414,
		0,
		0.105127,
		0.980577,
		0.16558,
		0,
		1.2313,
		1.156708,
		-0.246115,
		1
	},
	[0.3] = {
		-0.035084,
		-0.252304,
		0.967012,
		0,
		-0.29822,
		0.926166,
		0.230828,
		0,
		-0.953852,
		-0.280284,
		-0.107736,
		0,
		-0.515941,
		1.28855,
		-0.101268,
		1
	},
	[0.416666666667] = {
		0.066431,
		-0.251045,
		0.965693,
		0,
		0.905841,
		-0.390641,
		-0.163866,
		0,
		0.418377,
		0.88565,
		0.201456,
		0,
		1.577052,
		0.733773,
		-0.294489,
		1
	},
	[0.433333333333] = {
		0.049179,
		-0.264137,
		0.963231,
		0,
		0.844789,
		-0.503487,
		-0.181198,
		0,
		0.532835,
		0.822638,
		0.198379,
		0,
		1.650161,
		0.591776,
		-0.307382,
		1
	},
	[0.45] = {
		0.033358,
		-0.26975,
		0.962352,
		0,
		0.776613,
		-0.599089,
		-0.194846,
		0,
		0.629094,
		0.753875,
		0.189507,
		0,
		1.689671,
		0.46628,
		-0.315906,
		1
	},
	[0.466666666667] = {
		0.018089,
		-0.270128,
		0.962654,
		0,
		0.700562,
		-0.683522,
		-0.204966,
		0,
		0.713363,
		0.678106,
		0.176878,
		0,
		1.703602,
		0.351983,
		-0.321218,
		1
	},
	[0.483333333333] = {
		0.003186,
		-0.266916,
		0.963715,
		0,
		0.616406,
		-0.758334,
		-0.21207,
		0,
		0.787422,
		0.594715,
		0.162113,
		0,
		1.699017,
		0.251867,
		-0.323769,
		1
	},
	[0.4] = {
		0.085016,
		-0.227925,
		0.96996,
		0,
		0.956622,
		-0.253576,
		-0.143433,
		0,
		0.27865,
		0.940079,
		0.196481,
		0,
		1.460537,
		0.898348,
		-0.276077,
		1
	},
	[0.516666666667] = {
		-0.02535,
		-0.255365,
		0.966512,
		0,
		0.426976,
		-0.876965,
		-0.220507,
		0,
		0.903908,
		0.407087,
		0.131266,
		0,
		1.656015,
		0.121184,
		-0.32446,
		1
	},
	[0.533333333333] = {
		-0.04068,
		-0.249352,
		0.967558,
		0,
		0.319396,
		-0.920797,
		-0.223872,
		0,
		0.946748,
		0.299927,
		0.1171,
		0,
		1.630991,
		0.097549,
		-0.324672,
		1
	},
	[0.55] = {
		-0.040735,
		-0.248797,
		0.967699,
		0,
		0.320415,
		-0.920606,
		-0.223202,
		0,
		0.946401,
		0.300973,
		0.117219,
		0,
		1.630906,
		0.099018,
		-0.32426,
		1
	},
	[0.566666666667] = {
		-0.040898,
		-0.248332,
		0.967811,
		0,
		0.321091,
		-0.92051,
		-0.222626,
		0,
		0.946165,
		0.301651,
		0.117384,
		0,
		1.630858,
		0.099912,
		-0.323815,
		1
	},
	[0.583333333333] = {
		-0.041147,
		-0.248011,
		0.967883,
		0,
		0.321485,
		-0.920476,
		-0.222197,
		0,
		0.94602,
		0.302017,
		0.117607,
		0,
		1.630846,
		0.100354,
		-0.323336,
		1
	},
	[0.5] = {
		-0.011046,
		-0.261564,
		0.965123,
		0,
		0.525548,
		-0.822641,
		-0.216934,
		0,
		0.850692,
		0.504822,
		0.146551,
		0,
		1.680912,
		0.173816,
		-0.324517,
		1
	},
	[0.616666666667] = {
		-0.04185,
		-0.247889,
		0.967884,
		0,
		0.32155,
		-0.920535,
		-0.221859,
		0,
		0.945967,
		0.301938,
		0.118234,
		0,
		1.630912,
		0.100139,
		-0.322298,
		1
	},
	[0.633333333333] = {
		-0.042328,
		-0.247881,
		0.967865,
		0,
		0.321098,
		-0.920716,
		-0.221763,
		0,
		0.9461,
		0.301392,
		0.118566,
		0,
		1.631003,
		0.099199,
		-0.321772,
		1
	},
	[0.65] = {
		-0.042882,
		-0.247868,
		0.967844,
		0,
		0.320328,
		-0.921004,
		-0.221679,
		0,
		0.946336,
		0.300522,
		0.118893,
		0,
		1.631134,
		0.097706,
		-0.321256,
		1
	},
	[0.666666666667] = {
		-0.043498,
		-0.24785,
		0.967822,
		0,
		0.319271,
		-0.921388,
		-0.221609,
		0,
		0.946665,
		0.299358,
		0.11921,
		0,
		1.631299,
		0.095715,
		-0.320756,
		1
	},
	[0.683333333333] = {
		-0.044163,
		-0.247827,
		0.967797,
		0,
		0.317958,
		-0.921855,
		-0.221553,
		0,
		0.947076,
		0.297934,
		0.119511,
		0,
		1.631497,
		0.093282,
		-0.32028,
		1
	},
	[0.6] = {
		-0.041461,
		-0.247892,
		0.9679,
		0,
		0.321656,
		-0.920472,
		-0.221967,
		0,
		0.945949,
		0.302127,
		0.1179,
		0,
		1.630863,
		0.100469,
		-0.322825,
		1
	},
	[0.716666666667] = {
		-0.045587,
		-0.247769,
		0.967746,
		0,
		0.31468,
		-0.922995,
		-0.221488,
		0,
		0.948102,
		0.294434,
		0.120045,
		0,
		1.631952,
		0.087308,
		-0.319434,
		1
	},
	[0.733333333333] = {
		-0.04632,
		-0.247734,
		0.96772,
		0,
		0.312776,
		-0.923644,
		-0.221479,
		0,
		0.948697,
		0.292421,
		0.120269,
		0,
		1.632196,
		0.083878,
		-0.31908,
		1
	},
	[0.75] = {
		-0.047049,
		-0.247695,
		0.967695,
		0,
		0.310736,
		-0.92433,
		-0.221488,
		0,
		0.949331,
		0.290277,
		0.120456,
		0,
		1.632437,
		0.080227,
		-0.318785,
		1
	},
	[0.766666666667] = {
		-0.04776,
		-0.247654,
		0.967671,
		0,
		0.30859,
		-0.925043,
		-0.221514,
		0,
		0.949995,
		0.288034,
		0.120604,
		0,
		1.632663,
		0.076408,
		-0.318563,
		1
	},
	[0.783333333333] = {
		-0.048441,
		-0.24761,
		0.967648,
		0,
		0.306367,
		-0.925771,
		-0.221557,
		0,
		0.95068,
		0.285723,
		0.120705,
		0,
		1.63287,
		0.072478,
		-0.31842,
		1
	},
	[0.7] = {
		-0.044864,
		-0.2478,
		0.967772,
		0,
		0.316417,
		-0.922395,
		-0.221513,
		0,
		0.947559,
		0.296282,
		0.119791,
		0,
		1.631718,
		0.090461,
		-0.319837,
		1
	},
	[0.816666666667] = {
		-0.049665,
		-0.247516,
		0.96761,
		0,
		0.301819,
		-0.927231,
		-0.221695,
		0,
		0.952071,
		0.281032,
		0.120756,
		0,
		1.633209,
		0.064506,
		-0.318396,
		1
	},
	[0.833333333333] = {
		-0.050204,
		-0.247467,
		0.967595,
		0,
		0.299559,
		-0.927942,
		-0.221783,
		0,
		0.952756,
		0.278717,
		0.120717,
		0,
		1.633341,
		0.060574,
		-0.318493,
		1
	},
	[0.85] = {
		-0.050694,
		-0.247418,
		0.967582,
		0,
		0.297353,
		-0.928629,
		-0.221879,
		0,
		0.953421,
		0.276465,
		0.120647,
		0,
		1.633449,
		0.056753,
		-0.318644,
		1
	},
	[0.866666666667] = {
		-0.051136,
		-0.247371,
		0.967571,
		0,
		0.295236,
		-0.92928,
		-0.221978,
		0,
		0.954055,
		0.27431,
		0.120552,
		0,
		1.633534,
		0.053099,
		-0.318836,
		1
	},
	[0.883333333333] = {
		-0.051527,
		-0.247325,
		0.967562,
		0,
		0.29324,
		-0.929888,
		-0.222078,
		0,
		0.954649,
		0.272285,
		0.12044,
		0,
		1.6336,
		0.049666,
		-0.319054,
		1
	},
	[0.8] = {
		-0.049078,
		-0.247563,
		0.967628,
		0,
		0.3041,
		-0.926504,
		-0.221618,
		0,
		0.951375,
		0.283379,
		0.120755,
		0,
		1.633053,
		0.068492,
		-0.318366,
		1
	},
	[0.916666666667] = {
		-0.052158,
		-0.247242,
		0.967549,
		0,
		0.289752,
		-0.930936,
		-0.222266,
		0,
		0.95568,
		0.268756,
		0.120195,
		0,
		1.63368,
		0.043689,
		-0.31952,
		1
	},
	[0.933333333333] = {
		-0.052397,
		-0.247207,
		0.967545,
		0,
		0.288326,
		-0.931359,
		-0.222348,
		0,
		0.956098,
		0.267318,
		0.120077,
		0,
		1.6337,
		0.041255,
		-0.319741,
		1
	},
	[0.95] = {
		-0.052584,
		-0.247179,
		0.967542,
		0,
		0.287158,
		-0.931703,
		-0.222416,
		0,
		0.956439,
		0.266142,
		0.119972,
		0,
		1.633711,
		0.039265,
		-0.319935,
		1
	},
	[0.966666666667] = {
		-0.052718,
		-0.247157,
		0.96754,
		0,
		0.286282,
		-0.93196,
		-0.222469,
		0,
		0.956694,
		0.265261,
		0.119887,
		0,
		1.633715,
		0.037775,
		-0.320091,
		1
	},
	[0.983333333333] = {
		-0.052798,
		-0.247143,
		0.967539,
		0,
		0.285731,
		-0.932121,
		-0.222504,
		0,
		0.956854,
		0.264709,
		0.119831,
		0,
		1.633716,
		0.036841,
		-0.320194,
		1
	},
	[0.9] = {
		-0.051868,
		-0.247281,
		0.967554,
		0,
		0.291401,
		-0.930443,
		-0.222175,
		0,
		0.955194,
		0.270423,
		0.120318,
		0,
		1.633647,
		0.046511,
		-0.319287,
		1
	}
}

return spline_matrices

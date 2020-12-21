function [y1] = BVFNeuralNetwork(x1)
%MYNEURALNETWORKFUNCTION neural network simulation function.
%
% Auto-generated by MATLAB, 16-Dec-2020 22:39:59.
%
% [y1] = myNeuralNetworkFunction(x1) takes these arguments:
%   x = Qx6 matrix, input #1
% and returns:
%   y = Qx1 matrix, output #1
% where Q is the number of samples.

%#ok<*RPMT0>

% ===== NEURAL NETWORK CONSTANTS =====

% Input 1
x1_step1.xoffset = [0.12641;0.28226;0.23837;0.29182;0.56556;0.84557];
x1_step1.gain = [0.588237024226542;0.37829065584251;0.468501474608391;0.450026776593207;0.350757812253373;0.327068339294154];
x1_step1.ymin = -1;

% Layer 1
b1 = [-3.3705234795236136414;3.3309020343478601411;-3.3170851477534122331;3.2731728349981570325;3.2346304891005615012;-3.2071539125199790554;3.0492044601872660969;3.1189081719244766688;3.1031683283332327505;3.0775105197025554027;3.1756261536604695195;2.9928308646078916055;-2.9434370009117918343;2.8173979574870093856;2.898814765245653291;2.914545096450169126;-2.8435022264308313922;-3.0249333246790275354;2.7288192369290311667;2.6214301678851712474;-2.6994078510569430307;2.637439594703068213;2.6119615556722171057;-2.6304180160342096606;2.5654798778938681103;-2.535551499558707178;2.4750465223718345342;-2.5411026424373863719;-2.5782897631665053773;-2.4161763626671901584;-2.4651457321402134859;-2.3336276406299396591;2.1410964480079348604;-2.303228521001010165;2.4690767494999827925;2.1680254358044273033;-2.1626472019094102883;2.1356379060200678666;2.311198301508418318;1.9235553023165494757;2.0241218927465132182;-1.9899014637614802492;-2.3345885276327735802;-1.8728091305664760213;1.8354919310487358697;1.9797411901968178238;-1.913694766255982227;-1.7153740741937772984;1.5345142011395778159;1.760836764257056597;-1.6789970117814003725;1.5281586521075496421;1.4830990788338087594;-1.6864577133525149311;1.5480027319051186119;1.5178669861345066572;-1.4798713460252237439;1.2494582081408893703;-1.5540106966623548068;1.2039949610498799082;-1.497223508216846799;-1.2448000355134229977;1.2365028486613640624;-1.1517259358360218968;1.4119023499715213088;1.1867956512676587355;0.80914022566825372085;0.78448739835300473899;1.4115934691105520571;-1.1016444234798605795;1.0669023061164866206;-0.78778239259653892734;0.73982593104788152427;1.2046000130538576656;-0.80789985041492073936;-0.866924565874526043;-0.91654992897794906881;-0.6090157094906122337;0.45240755308270697022;-0.78917594280837932708;-0.99108962767729225085;-0.64471064166486025115;0.65452215991987006127;0.60255905808402532298;-0.53411486473780178663;-0.49554046469916784856;0.47705481786476366945;-0.44287522323259997936;-0.12659320616714631047;0.35515973177859427867;-0.38415779056703669436;0.18137634487802450911;-0.43973504573705074483;0.026414066665697285424;-0.16438748059948002367;-0.12796292946667647827;-0.089866045139169431488;-0.16680513630289683924;-0.0026958830141482178003;0.0050247013099781944953;0.12674785536817950726;-0.09609785881112234418;0.41714818507403711445;-0.25909513878764389716;0.81970514679138450909;0.30572085034626267364;-0.046303991535652282152;0.74780275133211882022;0.23310843793952656933;-0.036284982485614958314;0.33356208392984826316;0.31112226482342431044;-0.14921275396199853991;-0.25869416291315450174;0.58596901191151684607;-0.53511845661678603125;-0.51280647919291300063;0.50279235701447355655;0.62316433700182327637;-0.6099236147664715002;0.8394266616146198734;0.57543164471826491191;0.67085546156977116095;0.478657796924378931;0.86192923914918695427;-1.2548912694400717882;-0.93539112641349464461;0.99564686169450600239;-0.94982361367617573755;0.99147762610577150344;-1.1611054908725906287;1.0824383326738573619;0.99432528442072110053;-1.2334076240835383231;1.2124217909599774856;1.2902820477965106782;-1.2301794518359330244;-1.3758504951244561187;1.332592622429235707;1.4720525899713734486;1.7058943711608072213;1.628336944560905053;1.5409974323413662134;1.4960013731996570918;-1.5192218669874633097;-1.7964595067721642607;-1.5795949476609103534;-1.7607332190521276516;1.6911459554751606671;-1.3909586518956940093;1.7895931316741136019;1.6719204623496601858;-1.7618500944546686693;-1.8351903300152581089;-1.4532468961102247285;1.7705252727222851039;-2.0599133948710504072;-1.8889722748879376191;-1.9783582107379855675;1.9440121928304363585;1.9297223462132879757;-2.1483549220806521518;2.2904183365701324959;-2.1606951810994261542;-2.1829253770215459873;-2.2405132218169114822;-2.3820303985456874329;2.3541248147423807779;2.3110531801960827458;-2.3985595456561830119;-2.4633412825967990756;2.3165988903546286259;-2.6166539993052149171;2.1530532377307860514;-2.4748168418109801614;-2.5671806123171849734;-2.5372133509781180649;-2.6346992480986948237;-2.5417476834308723177;-2.6973578616395856855;2.7022433078754368729;2.7740368800272490191;-3.2186893065510684409;-2.8959751623356235761;-2.8746542004204660437;-2.9006706254924639055;3.0598683266936110847;3.031419976691492213;-3.1911412634446487679;-2.9661782332298036735;-3.2187555364455828766;3.1508177294714401206;-3.3558409229894112791;3.1847374429588111155;-3.4174816633859119719;3.2659949854125192026;3.3118983889448267988;3.3196795266903049715;-3.156411640494532822;-3.3849353704657425546];
IW1_1 = [2.038439730346021328 0.057747882731417211899 -0.35942660466859410739 -0.56863321987671455737 2.4366635177580064919 -1.0050017705804006329;-1.994555593827104456 1.6873449838474976481 -0.3687038593404312059 -0.7334491295586689219 -0.65705469939003113833 -1.8944140036647891812;0.26433742206076760173 0.34648555090885096996 2.0011254097667907637 1.1548368472783410166 -1.5802934358821132399 -1.8542089145166391617;-1.4405762991575374876 -1.6393906905345945191 1.1587215832716524222 -0.1212158415455806687 0.73967898698442979821 -2.2265083641163578854;-1.8722368692513675636 1.4676215103415490848 -1.5003873137533942916 -1.8858037207976425798 -0.2190096490095805315 0.077645805354504049411;0.63481254896811833976 1.2861930643491696902 0.089719711106078264828 -2.5812156712016980364 1.6030953464584822843 -0.42638292259223897762;-0.9261188070897138358 1.9123648734550517947 0.98985701107872225979 0.81269923758288986626 2.0534725318977384845 1.4673880234896321539;-0.38943741216310462372 -1.3077584831298989521 1.9941379366269618156 1.4979754971574681388 1.3863852999827523949 1.3388228850354157995;-1.6905080156037866068 0.10650712582388800753 -1.8702071958124828477 -0.55974875963414871816 2.1766013652218987318 0.23105701157238428545;-0.66216698560464237744 0.25531624186621226791 1.5359228522657992766 -2.7111561672713766491 -0.74479328892584573119 -0.85726211981443323218;-1.5342271600290375844 -1.2043734951919675691 -1.6645161471307214907 -1.3344785417277220674 -0.87590981072178797362 1.2228609956321907504;-1.0145719349642638996 -1.4358021670381422297 -0.59342281748503822314 -1.6837220510675707796 1.4941400503213504436 1.7329869324492515048;0.69727389651263793624 0.46327242621426867331 -2.0641006155785253107 -2.0496482113313905238 0.39412925550072591685 -1.6151553092703330172;-0.3098892547148570098 -0.049007825969053807336 0.67090093455843613501 -2.1275853686822823185 0.53505601634279165157 -2.5673975076554840236;-0.65215006439883582701 -1.8426891765253197164 0.095682536288514433154 0.47255666123685291513 2.6876331284894892093 0.4732784281496482115;-2.0458084221249523971 1.7496222030463655095 -0.27510316175424592844 1.0089462123760186696 -0.71437555158724486137 -1.5667776019004056032;1.5736346771831530855 -0.87735572523519400612 -0.90172582732764672286 1.2750795110713144531 2.0213014588182312004 -1.3020116242324257794;0.86926147218472804568 0.09891471109189467481 1.6585191830891994336 -2.2947435453423303819 -1.3199134111227255328 0.53310577301178629916;-1.6257978011669804719 0.19096865479811198085 1.8597291201533403537 0.94202739012386704776 1.9006744293238424515 0.13020574078995678091;-1.0042592333578861385 0.34674950562656720043 -1.6730975722011671714 -1.8237837964511669497 -1.2630498790337252313 -1.3106870918909350188;0.21034422398349747474 -1.9750510338533948662 1.2338619583671663893 0.4944734040966983768 -0.87825545660532322589 2.2351468992612355535;-2.3646354174929800074 -0.576320573449445539 -0.80832221039398022278 0.019173630104158793236 -0.59496759720073744138 -2.1427999816697900215;-0.13366200979463055409 -0.47701232405482374421 -2.2642242722882399697 -1.5532642878946805176 -0.086922743824026413306 -1.9833456209533986137;0.64847647151316545333 -1.7278192823196196759 -2.0048620704535071724 1.8559644905999912456 0.49456198454477207083 -0.40421725546015196961;-0.25905217346581776994 0.90800497705471727716 -2.0436482478884303582 -0.75368027922837355081 -1.5836808591359214926 1.8239486392268497994;0.5927418521736446122 -0.31907552589477305993 -0.27757003186043499587 2.9074377814298890677 -0.81237113625854895371 -1.3574479286268268385;-1.0227406579189659563 -2.1163025611147472382 1.265065850569475181 0.59069574871480823308 -2.0274054009716957481 0.0023008826729065453426;0.98386416108914243051 0.7338302513068966082 0.45182090072570835204 1.8558984264908915396 1.7894452778505232082 -1.6436803681748379802;1.7634139913519859544 -0.047917015421671940723 -1.2816075633908832199 -1.6287134320375113994 -1.4654159713064820458 -0.99085364811370735261;0.77105355439022027486 1.0105247059687623157 1.7292012631640067966 2.1784516304015313359 -1.0120281930981540608 -1.0031279415571221492;1.5087619793321840334 -1.2166194323909369501 1.0664955090903589507 0.60809794852912046892 -0.82155714052234152245 2.2577849175333217779;1.3214582206365430572 -1.5483488441469310803 -1.3350440293922845036 1.8730251690816657195 -0.29749041549104182636 1.3887996569947040904;-1.3854795394268144548 1.2274896340601182398 -0.5694052569267140651 0.68497390849825978698 -2.123243171693747211 -1.6227075298151036886;1.606496098457092625 -1.8619264008665177279 1.2859433914873446003 1.3963359037552720565 1.2393468934330023057 0.19539512473752346233;-0.48004826514299286933 1.9077547025043730677 0.75106571979417391383 -0.8502514466367117052 -1.5407068763703515302 1.8995614359924648529;-0.4382137258397696411 1.3863701701230997099 -2.9023330143147654248 0.85206254036590622913 0.44600752342878480228 -0.19686185869340902532;0.18488852913425718461 -0.75783756769928134478 0.33562348650556078633 -2.7064552388573286379 -1.8880988291288340886 -0.11714343051273966301;-0.57147167953489519387 -1.1409711567192493131 -1.8824257161467301547 -0.93872255820542771509 -2.250728077888803913 0.59327161777271697485;-1.925996950862723045 1.5922792452516651984 0.21902694903531172432 -0.41939584161781751082 1.6449182470014249713 -1.3965125048617024195;-1.8928209831852520484 0.76017970007192503523 -1.569336364403326689 -1.7727151046489917352 1.3773297430431044042 -0.54784542485487153218;-1.0049603087892458042 -2.2105876586416974838 -0.29953664045028827179 2.3368117786593676222 -0.026976495110158222462 0.13137793440841269432;0.2980755252385648979 -0.43306742094408096078 2.380860823707004581 -0.53026460166549216346 1.3416931888272318751 -1.868095214178811414;1.0699752436603251482 -0.37944460852152245289 -0.64218063088864707488 -1.9854736263926662243 -0.13367969320575015524 2.1975547484617843352;0.86060806351018337423 1.5366723194627320837 1.6239891819427818564 -1.0795892445917538716 0.48930591500100384383 -2.1193707429197958803;-0.26746850252857784502 1.9733508870969038718 0.34539416507506381926 1.9393211506346368367 0.57950203552801970996 1.9346033251910070838;-0.85878087522763324468 1.4297574434990028003 0.17768324148645861515 -2.1345745372492164194 0.82082865969868390454 1.9737348208777434344;0.99546584972528562307 -1.7323212148291933232 0.20015772242896989752 1.0853885883201386253 -1.8180060177523551523 1.6870425487326221603;0.98830624126408406216 -0.10947234723915813537 1.0930551169764359809 2.0617637153747012668 -0.49082865896371757897 2.2401142983876067838;-0.027014408556230013608 -2.0465586092536698359 0.80047341295336138511 1.2352926107853874349 0.01446614901122865969 2.1998881158920928769;-1.7255763265929378036 0.71894674720686913005 0.61743901212746010732 -2.3844044229327492346 1.0524009754164065367 0.86767748479230710767;1.0688606462478329462 -1.2459573805545176572 -2.4758897592572068902 0.71400024769476155839 -0.99953546587200292617 0.51874629488836387914;-1.9039862774082454422 -1.5903357448252204431 -0.71714268144112669479 1.3076608835525991292 1.8271644827297022218 0.55641104193685297918;-1.3841670659935414456 -1.1538916714347284831 -1.1809181619920765538 -1.6236933255668273279 -0.72160324432683808915 -1.4622262789899154178;1.2754693080952737017 1.3373545233339885208 0.23979063264680505752 -1.3713482337354512275 -1.9355620537480919818 1.4118622828584312945;-2.3432032945775191912 -1.4585244784598332402 0.12632074786838959346 0.49747769929724666715 -0.16173844029311484904 -1.8851139558091882797;-0.5504633734741579687 2.1149609737085506289 -1.7811598878659482548 0.9983420220323566685 1.5928242099219704908 -0.23024095160668725524;1.2202726799707601657 -1.286115739420429227 1.7235523280167237559 -0.34791974713433415634 -2.1353459042290219294 0.81696795079258754946;0.060553411966263959165 1.8248005409674743493 1.2823015520178058235 -0.99737303563826851249 1.8231844351885833078 -1.466567798363154429;1.7921724729957271283 1.2449566924032120507 -1.9054325942897543111 -1.1159639099650233707 -1.4825003597321533277 -0.007854131865844417304;-2.5187259543073272638 0.20526423615054864569 -2.1113744507682628004 -0.53597036686750165746 0.63555723767729088713 -0.59894607603651262018;1.831135743878627542 0.8579838303550914036 -2.1487956858455565801 0.29937776372081048581 -1.3900017767047712081 -0.95223614299940428918;1.4965429241786911696 1.4603947152042406898 -0.097622687879049957482 -0.78969639019485105003 -1.9744372694208667252 -1.6322836590546341284;-0.23987576250810069278 -0.38433671212059128397 1.8569354481807573976 1.8739091715160773877 -0.61166492629966517924 1.9973611129006505482;1.1392220592246671274 -1.312191115371791339 -1.7679196897296813873 0.0006649804622425991435 1.6874094649561544035 -1.691273600354158857;-1.5348541513939695236 1.1992339127740672122 -0.32757215767827030373 1.1883724979332761507 -1.6721723577563865071 -1.5878390285573282803;-0.37935268182938319814 -1.7353289016644017906 -1.4168671456830879141 -0.74430467401179134512 2.0368522751824524875 -1.2425141452678138965;-1.5253425467402019766 -1.285111846063128116 0.052299790634905626852 0.75558247243171483554 -2.5246258326875010702 0.62225071521234476268;-0.2215566236141109091 0.30710791441718776618 0.75282507517039431999 2.2948852477847814235 1.9675124242403887465 -1.5950781063770305135;-0.54726905589082064374 1.4957355363088842282 0.13063547532171279619 -1.7639206024464884059 -1.9234229387578325454 -1.0516951624490811223;0.37776935937031330681 -2.010361306746265786 0.39110614394135001515 -0.71898362041300367675 -2.4304949080763869063 -0.19919690665863565293;-0.19182809886785334719 -1.8104739572968351347 1.9899678812241934356 1.1680332725722479825 0.11636662257839090751 1.6703439779041657776;0.86786803120340205719 -1.7139553217797001139 -1.889721266586916526 -1.960122921341016955 1.05368707349312829 0.22360652482230131133;-1.6516700463362208318 -2.0705791213235200665 1.6250429637926850912 -0.4608459417358199417 1.1536335601192548861 -0.46461421583034001603;-1.6336275750587174738 1.4827573510485054786 -0.46986125535661038555 -0.33985733068661977407 -1.7734656457718600553 1.6398457508358468271;0.28956848263576218105 -0.50357229701563555047 3.2849692201147662196 -0.35630399456648631507 -0.11945126417868362489 -0.39357756377412905779;1.5839161895830675686 -0.15011277460084435087 1.5140868758348315914 -1.7572525038423516541 -1.3101461563644347663 1.2636574494173749006;0.51500624400348649079 0.55182841723125819478 1.638655174419853644 -0.90790054743168835394 2.0825417103797865259 1.3700950258620041566;1.6017381478255470206 -1.0043008187816178101 -1.4930481812782496753 -0.16348872909867254166 -1.6634396196492005071 -1.6393366021487660866;-1.4974990167832311627 0.8186426582804141594 1.452844667393572653 1.5692654418672480343 1.8965328027755226081 -1.0686711662442289761;1.5161719660037680235 0.57376475913901048287 1.1213261489526313852 1.3846405447061189697 1.2733731322849957124 -1.5129015304392037233;1.5549676942485570752 1.8367458306898574172 -1.912696243966052867 0.84547802075974920477 0.62025569767682386946 -0.90749383799024618824;0.95457897006879632862 -1.8315693380086932596 1.7637273889676581273 0.78974440462472483837 1.4236978334580310257 -1.176683520872674249;-0.32569769929352382354 1.1361865771579928719 1.8380855740182397984 -1.4650203681064546402 1.7456599704333315426 1.2391280917023026475;-0.51745284441156036426 1.7179166139741324226 -2.5954872301855154149 0.76145267911387037874 -0.52741953289510057346 -0.8190743612291350173;0.61072131348708136311 -1.0313417259130581716 0.93794477127746722633 1.8675045609633267318 -1.5060287325517214274 1.8466469870730095604;1.2447453517163995507 1.1325231736221026413 -1.2780167451505983767 1.4670780024817675624 1.6922366832573318973 1.1793692411124181429;-0.98399551058058709607 1.7647560123012044908 -1.5625235290821979373 1.1959575113373817068 -1.8750952723744351847 0.096422371120126179611;1.1250621221069323497 -1.1953635777960669451 -0.65593640535081132459 1.6766748334959824529 1.9309276917150393071 1.0787160599424892027;2.3520456773257119032 -2.1185110549503280986 0.28564616822634042448 -0.89316304398005441634 -0.32191890955683938325 0.1232671611529058131;-1.1217412918754741114 0.88763122506080782692 1.0369848713532536788 -1.7981869723967189856 -2.0446617724258158155 0.95195332637722895885;0.089835342447015589795 1.4834469373754379795 1.6410817419435279607 1.3176947305445907421 -1.5711005938128390635 1.4981161662673172508;2.0174709643516810509 -1.3290078614100959697 0.22632824595456435546 1.8646214924659330059 -0.48626777481330268893 -1.81700627781306423;1.8160587318592262829 0.069620561536412231551 0.82234370934612033288 -1.0020551651632494394 0.28147560970985474604 -2.3899033580065642823;-0.94788552959939798015 -1.3421988055518578875 1.5423480289113862263 1.2147980688711856878 1.5114200526436416538 1.5931590131244062203;0.83928365057209231015 -1.0568134944506921702 -1.3849129508224320428 1.9150418077987412246 1.9859579244918768026 0.20274159628612076212;0.2579905523203286366 -0.8770100556674741421 1.8638928376450307756 -0.49424974083589695573 -1.7758318143733584638 -1.7596332846286333318;1.1153994063422649763 -0.79327578375953389234 1.9313526280658479539 -1.85288486918705253 1.5117409557288210564 -0.18704419341035383173;1.2088589054320613148 0.82087447176965688822 -2.0239003314363501751 2.1303029859514648336 0.35077990182636853422 -0.5879808886342494656;0.068032327603731110321 -0.98181444000790196736 2.4931094582254340608 1.3644596431094178079 -1.2550812352156601737 0.92914945449704955394;0.0011396967199242687922 0.9492485162373776042 2.8615964487767997504 0.77316137449460620168 0.090844555791036618597 1.3962376132760523362;-0.39078103636765831874 -1.4709881421235331267 2.2504100787600189726 -0.99414036505861613779 1.6408454151755937911 0.65761478624328328912;0.54528748790865932961 -1.5332144175465811653 0.69960277693940708943 2.6194712827543988887 0.74572180920382757918 -0.36885904165013522205;-0.19644323260450058388 -1.7147785237014669946 1.8417884945774205541 0.015649506888089800144 -1.7992522958478940343 1.3555117591924106257;-0.28822155149865147372 -0.018031067626472808973 2.3201093296845516356 -1.0395204581414558831 -1.0062787693956456447 1.9557123234978144311;0.76483614847660486014 1.1353044110304255643 -0.38368802604645457777 -2.0255828334303793703 2.1387169048491343482 0.016547903742343505334;0.93653187160996531624 -1.15527371114006705 1.5172288498403025958 -1.732389699089646129 -0.47215340090277174712 -1.7888807749432487082;-0.32163680761165830413 -1.5298267523322484074 -2.8866080462828112019 -0.25067527121889887631 0.33735502478777057433 0.077672534839355628078;0.97828761524750706968 1.2744118884464912256 -1.717902339022289171 -1.3600658776168177422 1.5369957783592729239 1.2619222881805931546;2.259802987506446037 -0.36625071396073899388 -0.93070202265231161132 1.0543620790083247929 -1.413712033479446406 -1.4157831559334577154;-1.8249323659774179252 0.89746631137297483427 -1.6532854212458274468 -1.7160007969072339495 1.0677044047204851118 0.32754523292445347771;0.98241995862187070365 0.51153150727832130684 1.3340357812025316342 -1.548005124817919631 1.9977070862150458908 -1.3985746523780471229;0.83645532695315105709 0.70427519778062230849 1.7678155281183780545 2.6143770646609678643 0.37382053122145064705 0.14550838773717630903;-1.1982869101668918166 -0.60965503721185809738 1.1462050826223511013 0.67315709815912949665 2.0982807265860468071 -2.2225355701977611567;-0.5540553719483443107 -1.1736225820715864288 2.0916277966156600066 2.2193336493944428867 0.44864907335095588481 0.012223749169381663976;1.8468779658926959275 -1.4322255473487972566 1.7707033119810622335 -0.25077189368840113737 -1.3469047041814090626 -1.4088256347963383774;-0.79531911239819053083 0.22996387416491589906 1.9464460371480842849 2.1615372366490821499 1.4613978386383579267 -0.46514603211825639173;-1.8247090473864528981 -2.2818200297912820673 0.53599851944800758208 -1.4848792672960038352 -0.5260984022240644542 0.074731384180396556727;0.65850928501025229878 -0.47854650933340092678 1.6466951556841764592 -1.8629579145312455957 0.082248181925831678751 2.1836969750083592423;0.8813491655904561739 0.7451211287438905817 1.0379568971865646976 -0.73480422635653930286 -2.2384400658013925423 -1.8852219625634261124;-0.39331267598044866718 0.88420954137728313693 0.295960887518462612 1.377939854553676069 1.3488161791331818584 -2.7224455680061692142;0.062491827554686005253 2.1638437181601464232 -1.9085377283466324894 0.29446133672294755312 1.6989086001207500676 -1.0359499310874793476;0.38773951355748464964 -1.0184206591115798624 -0.22156862463778537187 -2.3499506053187109167 -0.83249549566517688781 2.0747218673687277679;0.58236451263706279224 -2.1100224564606375743 1.6541718352323053765 -0.39381308283013394256 -1.0786699426435670812 1.5769559828538475266;1.028074930950632071 1.7943165125325490905 0.90741327929697124244 -2.2472305422310303591 -0.31592444586145168595 0.39529278194521161316;1.6836316999665676963 -1.1891205357296472656 -0.94232225867996988189 1.834562558150103273 -1.3866132044588133088 0.9782111202433706465;-1.6346645651164084523 1.7267005165372950604 -0.15524891045565750169 1.710145156373451325 1.1318807585085777223 -1.2627771686545885554;-1.3324119362881443607 -0.61220913950578181861 -0.52074037389434124634 -1.6075475076971836863 1.8033780722767756011 -1.7474503964817620361;1.796188983900180336 -1.5431852266229155735 -1.5281643230967956182 -1.2953552449269163382 1.3969441874772232648 0.65262710134233881121;-1.4133405682398438863 0.076426052026614912926 -0.60039945136756422972 -2.2059308107806008259 1.7235944190943335297 -1.2202253404270122505;1.0809306449128013305 1.0933356807755139073 0.41904733089744905516 -0.27800869551997731133 2.389276748637646719 -1.8623980922925973402;-0.88905867599386612099 -1.1377947248876565389 -0.72209502747593401484 -1.3283958328855574038 0.92718662980293298226 2.3002331682658456735;0.52603819858853129166 -0.50127308648203749986 0.57524955724817827818 -1.7288006999681480025 -2.0100222599111408073 1.8762975386184743698;1.6891799710837742676 -0.95209998289838138064 -1.1900610610929984734 2.0401735751971812327 0.012509822241640395496 -1.6739065994311852492;-0.44008763214031404454 0.73878173352763254478 0.27694728738195034667 -1.1919748736053505933 -0.96497763752064769083 2.8392165254608667802;0.19326088078079023402 -2.4408929263714904678 -0.40757124311463471811 -1.7208059299775664286 -0.34954767888118204455 -1.4690735278975963762;1.8190007782367063616 -1.7283251109228863207 -0.63585323080354372305 -1.2419811490874961279 1.5373248055936907797 -0.84810131300563940115;-0.90214216480624043193 2.0319431923638227033 -0.76478483552091258701 -0.79459553639062852071 -2.1779092189013327108 0.73120722762590717458;-1.8585246942848132612 0.24551207653327447589 -2.5036396805470002569 0.39716086677438799946 0.64889005436900037971 -0.84047208960491925911;1.5648523407853254241 -0.82710154006268021831 -1.9931560766550073804 -0.22681776289761476639 -1.9014174411972266654 0.73348775388744968939;2.4597042848030095108 -0.6509158935304878435 -0.30512080187594742275 -0.17963681175696671888 -1.4128271021673930452 -1.6414440066984954392;0.72222728534033420189 -1.9961917559282515988 1.396357775614944341 -1.287199884072097511 1.3665587027953098875 -0.90927816381527870604;1.069705591182306792 1.7915382673442974415 -0.80878830074842200659 0.59002340080683746137 -2.3068218587827993282 0.54735106515566667174;0.70596240082162231566 1.8801955072681089121 -0.22107477258873758919 -0.013691101100700524967 2.2212864350846204253 1.5007667117674445834;0.59610502799705100685 0.22802985880893550386 -1.8424078237692609328 -1.9938065613971094336 -1.9113064231220942002 -0.076470983832710531791;-0.63159442276472077538 -0.89262319608208029464 -1.8307787982426524387 1.6879453919238147641 -0.6855791324461294467 -1.888428824579950982;-0.82850934296459843864 2.8371572133928482096 -0.54890481819684167064 0.21126518610522296293 0.73394733599539752067 0.96392042599699812033;-2.4630677341605862196 -1.3198179250054575817 -0.1908305212239632398 1.2523455703843373588 1.9549749677720731356 -0.46552824035045536899;-2.3205043847869011309 0.62291282827061467131 -1.6683176038199021285 1.6297696978156304137 -0.15676140723919726461 0.069691378410368570728;0.30271696118595642355 -1.8693531295566556683 -0.28701449567770703775 -0.036236656634584869796 2.2233875317743767575 1.7534740999088938018;-0.18654584927179801435 -0.86379941730559539614 -0.17535105556810662297 1.9613930163500530313 2.023428540121970709 1.8159024619989792004;0.6975321053865863874 -1.0773732762419792053 0.23728320342994396741 2.3358712231839464657 -1.6627401303798772236 1.058735632600155574;0.87750284348746510066 1.3352237407258888968 -0.49843771587859636574 0.51390386524828213233 -1.322265978988101276 -2.5251203029071396244;-1.1200712745324348241 0.2717058673891394327 -2.0957863005929473488 1.3126270175474872293 -0.48918480320179469345 1.9733320057720928897;-0.058197434838596961981 -0.40703470980959488568 -1.8527303194660416086 2.6405109078459707561 -0.027808172927954819681 0.94608114468095605432;-1.5768327555597456691 -1.2479590723719782286 -2.0269843321147211768 -0.34352675081468136975 -0.3010046979813395529 1.6090776119067100591;2.0279317062310653341 -1.2292537780309362727 -0.42617006792254258363 1.759110236674491512 1.7089567118988981953 -0.27482932705164608844;-1.2586538595023468723 0.78431997759967408967 -1.6582406292751572519 1.2975676516175727038 -1.7826864413078367111 -1.0299002952875753181;-1.419085065405939039 -1.3446927597071658411 -0.06365361177345905952 0.13035903547512153744 -1.9986563730870374744 -1.8336135816837468848;-1.0362971426341620607 -1.6174822776230668442 1.608312776449393855 1.85634980287519058 1.2674650122246124972 0.12225660816810526854;1.2775487114628305552 -1.6788639029475633802 -0.62028678346731258575 0.29617747158441992683 2.327010629964835875 0.93657539584669757815;1.8558057758520236646 1.9220465482640529675 -1.3511665280293343461 -1.5099387092986948922 0.81991199585770735414 -0.46903206683443759983;-0.049416831039221835453 1.0801500187880881398 1.0801036256341234321 -1.885596562857671632 1.111876818538515499 1.9720362840447247521;1.3630827387314454757 0.8210922673316966014 1.2784858786256600993 0.77842397920785511012 0.97117479412076335166 -2.226760714785421591;-0.12651022024640989905 -0.7242198744708100433 -2.1624001987977545802 -1.4940873196078758856 -1.7628097613445450342 -0.73905947448202979899;-2.622191077735557041 -0.64465704161521453219 -1.7579700060060203803 -0.54811617037546722653 0.91911678004751473647 0.02805708352323198207;-1.0675573121400407928 -0.77615240697644805046 0.30551734294139837322 -2.0083197565693682307 -1.9270446068973676734 -1.3885737040413497212;-1.9054341225680897498 1.9459151478901894894 -0.8075823077318392551 -1.8315249210440338601 -0.47862492387088900747 1.1291587822901703042;1.630470776951124634 -1.8992301950554550949 1.9172909719483399726 -0.69842896003123067228 -0.63849205365243888455 -0.71305212431319708877;1.0496893043641439824 0.27407370088167581912 0.85794041716277735787 0.34220979676819057724 -2.0658724529062806319 2.2669220920261947683;-1.0009458614377766406 1.887051507033482789 -1.8886506559359046431 1.7000571766793113326 0.55517278286534810228 -0.16160738541808059021;-0.53271520561530483207 -0.83999958971818333708 -1.0928696267515072282 1.2830996038640056778 2.314772002773759052 -1.449026425364541959;1.5158390223056004142 1.0106930425558129372 -1.0027859382133155197 2.2782092310417780823 -0.27246559887133919853 -1.4007423968683359039;0.10914514948994664956 -1.306035094177675937 -1.0843390616960357775 1.0683848135262767887 2.1401365482334826496 -1.4901199995367893081;1.5196518825018634491 0.87176463388899028129 0.38214666479025383161 1.9083899410720275291 1.8036141915485051079 -1.3919955303737325814;-0.23881463057911139769 1.1113393135912974508 1.9422583699135371749 1.2231922600723377226 2.2584456814905053967 -0.45960570632878361419;-0.76993060023875636855 2.4687047826596622002 -0.044776517348863661971 -1.9484304054285737084 0.57715657886482985006 -0.81679869141059269211;-1.8574623614930527715 1.2004703413337460827 0.27035929135770031539 -1.4266629078813981568 1.9458931441514457639 -0.92335752115284053243;-1.7092513272249065803 2.1279426625539770157 0.72845628768569126166 -1.2049550027119715345 0.6954654933502328884 1.2556192718561389743;-0.16802697771221000722 -2.0348286747465245128 1.1662926342752104603 -2.3694864118253105012 0.70215131147821263635 0.65976906979628657801;-2.1977183237185444753 0.82348968440694403359 1.7094512387199283232 1.3014948464105624559 -1.127437482980669925 0.25675064629381544323;1.7606740820406210357 -1.2633393644470496398 -1.0778188013979042026 -0.44133949856735249506 0.36331044059866085538 2.3377035941522170681;1.1009839280289070995 -2.0846332351296625873 2.2036650865583564673 -0.48131264787426747409 -0.34283407846022045939 -0.81875652847590951744;-0.084032833699250755743 1.0365546267904548472 -1.2593577870575289879 -2.3946394867611888735 -1.3233351901957008945 -0.17942842038107975622;-1.8234958135248080513 -1.3537763210050874907 -1.9932133477844606873 -0.29396344947135871761 -0.15217827508118333957 -1.3374780355616713301;-1.6622056318609377268 1.4945223772075368895 -1.7808229447227270636 1.0323469844508579296 1.075655343634414729 1.0382017460157306754;-0.092388806123359298872 -1.8474052315347977427 1.4167612027869711522 1.1971082898811842288 0.14763789611017566483 2.1383671751882560308;1.5191336892099045475 1.4309384385505743431 -1.1150828405353929718 -1.5397113715683561352 0.80131505150906667811 1.7219281642439352442;1.6379739893249558591 -1.5285204583991294225 -2.2323922631794048677 0.46113638381374483233 0.18866612166445301257 -0.90112318924166912026;-2.9459694703628724888 -0.30505197130884886825 0.53381308830116980246 0.98602385432021877332 -0.62234235011804583948 -0.8822117669590703315;-1.7735195210697327628 1.2971529504038195046 -0.71902200390886261694 -2.2188066527559362484 -1.0355479096830801922 0.26630426848032767717;-0.016199479017581317614 -1.991824075855702203 0.31104413618130044572 0.59987053190084160814 1.4828053629798247925 1.9479849563788869116;1.4213967387505666018 -1.5408827613666260525 -1.4447641742434640388 -0.96809258768500350278 0.74343447109107863024 -1.8842291667189285942;-1.5757275132981978238 -0.019483783597124260806 -0.56932490218070297416 -2.0345883575862688808 1.7556258585609305634 -0.31898924344385543028;1.0360839334142291079 -1.4651917358076185227 -1.5708356375977916564 0.11514558777508540621 2.3892857202574511177 -0.22959940496862007997;-1.2520590977569956426 -0.31314016993002830036 -1.2852022783869079259 -0.11647908291287574489 -2.4659305950001408902 0.81774874992997681478;1.082515862974922749 1.410914845241897142 2.2636976319651771483 1.1201991153729953243 -1.3691751217254166662 -0.28313038857549227556;0.22958746943941979457 0.86107510756215144276 -2.6098318774733608727 -0.16465754487307629472 1.1213671265554967515 -1.5598768187729907808;1.3012554298680676368 -1.6679755108919076534 -1.4944796220778737705 0.68513654083709496501 1.1518126201263025887 1.7195725540332040815;-0.78537127096665648729 -2.0426159876266130055 -1.3415398525898418747 -1.3496344399354649468 -0.35711793504005040489 2.4773541281438196116;-1.2924221610718278352 0.86221589849318136523 2.1278649603289463421 0.23381904191931149328 1.2601188094190067801 -1.6979106089471738272];

% Layer 2
b2 = 0.56793420526330484766;
LW2_1 = [1.004104264441906702 -0.46005983920440601809 0.26689384123199910714 0.64399693515521927445 0.4601602809595354282 0.41727824399775031994 0.34765079591254433033 0.19964238624402239064 0.85739103156457308064 0.21946596330556969456 -0.3559333553936201433 0.63300994512835317973 -0.24960329811972822855 -0.62813170566800113903 -0.20033074915689491613 0.53108698129372333696 0.48456954198571366987 -0.78713497374323382338 -0.06213476585370567018 0.54743937879305870631 0.62182836255847107054 0.0049993506992465413727 -0.36471273951225613441 0.65314509975807066855 0.83380630713186321135 0.81171721519591877314 -0.52028596507058511023 0.37173630126494228154 0.43162775697721422752 -0.01551245409335623264 -0.94245239593939034162 0.49782341639144406242 0.69240781448196320191 0.74879662788423440034 0.43437906225856753872 0.82307443445528249981 -0.71474384529244960884 -0.15363226177153849195 0.66237857896826135562 0.95111643702727155514 0.027106125610571289719 1.0029661079087777154 -0.38477291496489129941 -0.38731720396199625922 0.19639159613196277565 0.75822207543130804019 -0.74697472085954297327 -0.098183155623211199048 0.5468047477427323555 -0.32552156581501534571 -0.025911741063387935813 0.71684138331004221278 -0.32586122018941598988 0.72800483011168926062 0.17540610251294527777 -0.59192091836508975433 -0.025539353317644633568 0.39376670800108931614 1.0186774196081995747 -0.5384075661729865736 0.97588835667012685526 0.54236867127981436276 -0.037066688071865486198 0.62992751592724172127 -0.90210209981272315716 0.31068587972320954593 -0.85943099269334821688 0.10104918240713908761 -0.57483799627379261743 -0.61678238678943375639 -0.23133595950001972774 -0.093919059747444452735 -0.45443704580693827788 -0.78752551816664850826 -0.58869753781557410122 0.3311002078809611171 -0.51631094556216206026 0.71543726773893789872 0.46674716340121424896 -0.57022915718491673509 -1.0149845844973106601 -0.080188763611753033356 -0.72572085563494681537 0.98040120770141059303 -0.17995769125959068524 0.042796530005398895902 0.066112469662761033651 0.26030437980499848694 0.69699332823009363391 -0.17237329678509222264 -0.23538484236883788769 -1.3855272897049901726 -0.53772470909784497728 -0.13692483383163459032 0.014222916335918331723 -0.49987180389113733403 0.34791100252834389339 -0.97957026581428974232 0.32175480417774782183 0.340246222824861555 0.52016687583764331659 -0.89780184967694898202 -0.78910898417275299188 0.33915210862028383199 -0.69746814179770921793 -0.32277781746711703414 -0.030315072612373563515 -0.85150856150109666132 0.0043237004966214034885 -0.19538105872731029167 -0.79279074929823278861 -0.25441696103496841408 -1.3450256665828514979 0.75438566847915622393 1.1438298985602337599 -0.13050760673627703756 -0.41736421211185764646 0.88956080807755666395 0.24540363645730001174 0.77169819160909824962 -0.78848291962376593212 -0.65866617617692024833 0.66577845996981299681 -0.07013232724171054866 0.23297960047966709274 0.64116836496798723655 0.27121653635324582954 -0.86979365467825398017 -0.4421553496590476251 0.58266914267683367346 0.79522151190164247492 0.16103488151391234795 0.65021615402205490408 0.24195853752551954585 -0.02526068719305342436 -0.099736449836051066509 -0.0016616809091711368281 0.55445363749166587386 0.020393200219184882266 -0.17847804147886842108 -0.57172499771768503507 0.39585824577973388605 0.74070657586807120421 -0.12772875539618669394 0.36967453769051095147 -0.65589611270102210483 -1.5513646757869703485 -0.56640593515635140331 -0.47416938662075741595 -0.43465386695146834839 -0.83369261308323339144 0.4450548272352536916 -0.25043791421835948086 0.94759902696097975117 0.7583993790557976844 -0.17847423250528082761 0.29486917907213916479 0.71022729800817030466 0.76974637510749621683 0.092002454939951905377 1.09838263891076382 -0.24290045765756720919 -0.61107880574326767231 -0.23060698962754178076 0.13297284022246291801 -0.21257012307602743406 -1.2390479914091683256 -0.2574641685487821241 0.089421441924949066071 0.81178053299305164003 0.5937630072772462908 -0.31348650632862656851 0.83590309499476234123 0.38942859586968264773 0.33243504674006973953 0.42166083362507461585 -0.67099482610978844477 -0.11521610842913086736 0.54756934165000992198 -0.98404823124421136882 0.63080349992975448536 0.26106127978096899112 -0.90247348325856924234 0.25202537464112267918 0.092724316372480991566 0.23734558706441663545 0.81493999023359431355 -0.50405933654426005042 -0.66999748731200114982 -0.087905231252938462183 -0.78630018094928277872 0.69911328574714992623 0.52544932610502959047 -0.684358496280462969 -0.41046611263028071059 0.16288398913266594059 -0.82835084110127854551 0.423567309254292923 1.6907236035925263806 -0.44124505047928863632];

% Output 1
y1_step1.ymin = -1;
y1_step1.gain = 0.5;
y1_step1.xoffset = 1;

% ===== SIMULATION ========

% Dimensions
Q = size(x1,1); % samples

% Input 1
x1 = x1';
xp1 = mapminmax_apply(x1,x1_step1);

% Layer 1
a1 = tansig_apply(repmat(b1,1,Q) + IW1_1*xp1);

% Layer 2
a2 = repmat(b2,1,Q) + LW2_1*a1;

% Output 1
y1 = mapminmax_reverse(a2,y1_step1);
y1 = y1';
end

% ===== MODULE FUNCTIONS ========

% Map Minimum and Maximum Input Processing Function
function y = mapminmax_apply(x,settings)
y = bsxfun(@minus,x,settings.xoffset);
y = bsxfun(@times,y,settings.gain);
y = bsxfun(@plus,y,settings.ymin);
end

% Sigmoid Symmetric Transfer Function
function a = tansig_apply(n,~)
a = 2 ./ (1 + exp(-2*n)) - 1;
end

% Map Minimum and Maximum Output Reverse-Processing Function
function x = mapminmax_reverse(y,settings)
x = bsxfun(@minus,y,settings.ymin);
x = bsxfun(@rdivide,x,settings.gain);
x = bsxfun(@plus,x,settings.xoffset);
end
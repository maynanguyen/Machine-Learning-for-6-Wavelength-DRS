function [y1] = O2NeuralNetwork(x1)
%MYNEURALNETWORKFUNCTION neural network simulation function.
%
% Auto-generated by MATLAB, 16-Dec-2020 22:53:56.
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
b1 = [-3.3968209481236253389;-2.8595445856083361313;3.1730207443828986058;2.5848680838210897903;-3.2534082323563229266;-2.9684822609125487425;-3.1178461718907106714;-2.7313619802003508141;-2.6306270357588825703;2.95698128145203043;2.6715468110450366623;-1.3800561927833892018;2.9881740213406522422;-3.0492466442236185742;-3.6524133506143678929;2.6029019930002457173;2.862549747170941572;2.8173601921321687058;2.7426454905642998483;1.0844269737903247108;-2.9853171862448570906;-3.1041562982608956744;-2.7705203391520059064;2.8705336530475253909;2.4855635036266039428;-2.2373048407020759143;-2.7294129899961028229;2.7796799988303604323;1.1921418280813860235;-2.1792776969065110748;-0.85180865165185093435;-1.8340529970889654088;3.2983454765128317199;-2.7840829015656911594;2.1445337718822474748;-2.2472229042137943367;-2.2424118675835087444;1.9696148519864649096;-1.7086203149427683368;2.1825693088475643933;1.5126290869159604302;-2.8598157877450076647;1.9762288010954023321;-1.6718055298857097402;2.6448344839827915287;-1.6945130624881947767;1.7814878464095207367;1.629389574768604021;3.1380037659682762374;-1.1397916556846934277;2.1929846830714341266;1.5100157096413069358;-1.6987788658275793097;-1.920674957652066972;-2.6508139069387324227;0.46333216795271742194;-1.6615508665260854126;1.9447156672617860185;-2.4637139690788036894;-0.068844212107559879521;1.8525914602040611801;-1.0862952474406513126;-5.2462393421391650961;-0.85126496806619322832;-1.4029827732888844327;-2.339318319353831388;0.93560827096218801557;0.73800511574575000662;-3.7978398777492965444;-2.0975594478054078174;2.5554719303899835481;-1.1859513768588938465;0.08377703117528748078;1.1046098022190482535;-1.4237433571563531398;1.1074735395255241865;-0.84234149279107983777;0.78369742349038107321;-0.79205686359406746178;-0.098990207117022568917;0.12705039450336566564;0.66302537029912367306;-0.43889302718189315833;0.86076717949341652325;-0.14027539104022695993;0.49784572628856504917;-0.090489486186298831449;1.7381424606386057796;0.77179643647045192978;-0.1373415025411560686;-1.8940554703967638073;-2.0213391090707686359;0.15178345099278178765;1.8254211498546164538;-0.24288715544456479511;0.73779972483075861867;1.4116573686294078271;-1.5881358343509175413;-1.0386472590910458269;0.13315145641085623929;-0.57406763374495628494;-1.1314946243646630819;-4.1951322136353619285;0.15517836006080487632;1.941626213236888665;-1.2321209021750867407;0.16739565862513977601;1.7705780885696742466;0.53708774756706567644;1.7517622220995077154;-0.7536657538816048385;0.054374777414616742854;0.46246849433898534754;2.8802549213126513727;0.44566876045003150919;0.48063490532810176914;1.2148144246508436606;-1.6063997418105366854;0.6806487014758820786;-0.38434913458367458983;1.3369064255839291366;-1.0686271900079702402;0.67907787717125045468;1.0892388268905697224;-4.3304802223949998563;0.55389273577670661286;-0.96132964909687967925;-0.47837000709027333034;-0.97635804075855259221;-1.7067528154294928644;1.2386010083426590711;-0.28922645314790401683;-1.1302581527940940287;0.76195082407034397942;2.9207588990023820585;2.7569466555429378296;-2.0050611617625366812;-0.55049138211493542361;-3.1483657947061298721;-2.9014959034805523075;-2.462285679916438319;-2.0606147195584516574;-3.7737008913197249704;-1.4708010161259619242;-3.6046829806357005843;1.4991778465900924555;2.1944059530240087597;1.7949796748874047303;-1.9707880282777767711;1.2844745539102169207;-1.8927307253103913265;-1.8459277169179431066;1.5954529471261564844;1.7342918974340109095;-1.8798306879250628043;-2.630221292911414821;1.4113809727436898989;3.0575555797993003715;-1.876010086056437931;1.6716961721073440028;-3.0530971677159746136;5.1021813072058295191;-1.8996314418843007754;-2.111954882966826208;1.0367864943265803213;-2.690926981110247862;1.462324711546299838;-2.2329353496975454796;1.8186392030144848952;3.0070580357481260236;2.4522650088717905525;2.1955614965526937254;2.0270339004551036766;-0.34948062391215695133;2.4214581202970237861;-2.9344480521724385369;-2.5351430424220731119;0.77374271676395134367;-1.7073496247747035337;2.2782577053334187589;1.8948889345642325743;-2.0960602575487090604;-2.0557697666005876336;0.787431679705344445;2.9517971100972451026;2.1729005265310621375;2.7309388325159926758;0.93494820503786613131;-3.0673910157933352849;4.7948881996545997808;3.0656198245361143684;3.3830870068287812735;3.327597513426167275;3.1241096396793373025;-3.2033755938413444042;-2.5732700029732913372;4.6099621174397196199;-4.8113140181510409832;3.3716241772766188944;-3.8323247052224949094];
IW1_1 = [1.3723830240031749117 0.37022815333942415972 -1.2974313333703100248 -0.2768393911366168747 2.2657665314087584996 -1.576527601004989787;0.85601002533705095043 0.62901706040365523709 -1.8587756080296926608 -1.0892024318012225592 -1.3560105290071542417 -3.306964404289019388;-1.9108006677981499433 0.71294795585280845707 1.1701934539197840213 -1.8441907430878932139 0.50398756577156489378 -1.8272233381616933556;-1.6983315607753433074 2.9350095848354755823 0.13958154504313360911 1.0276766183999512805 1.782091858810245899 1.1542910531701788823;0.93580634272357399173 1.1705224314107460781 2.4288494348455400562 1.1856961587576462236 1.3227692498991689973 0.022896335650404452816;0.022138722128621370067 0.38351473119897289132 -0.96430642110484410257 2.5984052583937113923 1.9043485469002088273 -0.056105342375179112491;1.3502514690835398792 -1.309870104808391833 1.4180105047580513489 -1.6855948580310626816 1.7718239640113939704 0.087954872922235499688;0.53627683267515102727 0.54157340092815742238 -1.1092122621110938052 -0.92480490334941078956 0.22830247059920794062 -1.80747027542934946;0.9450090515753022391 1.1696957204952469489 0.9790969905770214865 2.499032051079175698 1.3024091764145306893 -1.1949462576548601778;-2.2529278482095880243 -1.57869974723769535 -1.5590998865334815271 0.54671581501898547373 0.65592880208348136595 -0.7915721823641902466;-0.46633198506935241712 0.52351316112878010234 2.4844512796043463077 2.1999918998711298634 1.2492240365196793928 0.26231923483859459489;-0.83334182806832923784 -0.34465161566044144603 1.6203652302829645304 -1.0020986592834739692 -4.2280576381284706855 -1.564289304221788024;-2.09083144280418054 -0.2654317261243847037 0.59620649011096360503 -0.89648197291901776662 -1.7373447417704654949 -1.6609902846390658393;2.1557287186645965882 -0.57926758621788776438 0.38202873273698451095 1.5256174918478770941 -1.0522146805670675729 -1.6245927922109597574;1.8163106700767639445 -1.0873342394949350176 -1.1962335259594010228 -0.1731446376145312771 0.43991601639103639076 2.1871427871131063903;-2.0576994163784743108 0.33009139550502752947 1.5879151984030805966 -1.2857311513610261144 -0.016892611864730167764 -1.8474798059217742985;-1.5996738258966334278 1.1397536837144579547 2.0740725850702612654 -1.1884396738463816057 1.0677475681790518092 -0.91596412196750875978;0.33245783038526266484 -1.0288235075882348202 -1.2033519643158385737 2.5152460144152133381 2.0932970983491689942 -0.44645146639213562079;-1.3469920200125891085 0.93355573052616669383 0.6922100103118550285 -1.7847274802495813883 -1.8700765627881454911 -1.2731961764881296606;0.24508365109690152805 4.1948464549617812125 -1.0639730624160639305 2.5030593372922296247 -0.44839184756595468206 2.7724531413118005396;-0.073823828373532282554 1.1844639240267609281 1.339806561622804093 -1.6950166219893647579 -1.8192191261177572681 1.214562904101164964;1.4755762063992610145 1.0892806927026259523 -1.0001211267765062196 -2.1620252126152177397 0.87027871059924366559 -0.5018556406470783271;0.22680531380113813644 -0.79345351040865397252 1.9251569063223448186 0.47560746353256050378 2.2675483380110832421 -1.1550589147012675362;-0.70558988803954558744 1.8911089125747135853 -0.56437655630446625921 -0.63104473372071789861 -0.97967941721274076627 -2.1243492126864578218;-2.074354130629614712 -1.573352389207716584 -0.9942470696197659441 -1.8489101785951613799 1.0102945422747466875 -1.2380223998348407477;1.3468975351582077593 1.0246479796230789638 -0.26593316073429706936 0.92121766567215557231 1.6231745008072200331 2.6724524397308901946;0.59147440063007372668 2.4923151606463092023 -2.0298935168175162858 0.016321369593345548543 0.72009960508845716198 0.90707742790745504724;0.14209460242984173206 -1.619048324891215751 -1.4295031138590983399 1.9823489629631552145 1.2940754499732260996 -0.41075531709402401948;1.3646328991370970662 -0.87783531510534862363 0.4045874050831223534 2.2703543690659451215 1.0819273908046163069 2.3949807083513268147;-0.53036626678794041023 0.84224840118216459661 -1.5685447934271925519 -1.4964432136351299985 -1.7517146186095371441 0.15915607238162177151;-0.092710384533849124478 1.064417942530402561 -2.1704471445833228849 0.026956837140745721487 -3.539819085538382204 -1.6773239676179829694;1.2905489612907736774 -1.5423231973787134841 1.759954155936215292 0.7193736091940856614 1.1108625525510764653 -2.1599980141015291402;-1.1083916322736377946 -0.34946748969268393026 0.39264710250198153751 0.44088188691470464597 1.765312548629432543 -1.8690934239688667962;1.1392229663921418226 -0.011910842474345064573 0.90491863339445399728 0.016755270789573027679 1.0719634885291304816 -2.6667462249508711025;-0.84603639159014809579 -0.22350069962437529858 -0.3591668690118008378 -1.9852262519652714712 -2.4421878124953857458 1.4070134841026102901;1.1275741776965284568 -1.2844692356614295647 -0.20479181981885491437 -1.2701358460195530942 -1.7274854705303008817 1.870489040116683821;2.5092819043025738068 -1.0938111670889301141 -0.39187333805776780604 -1.2345303391001389848 -0.33738755525523317358 -3.3214902265935464243;-0.77331663545793560832 1.6114500200704531263 -1.0456902855361873694 -2.0699399113586367527 -1.3503244101567437596 -1.2642827944959971198;1.8581403938420097965 0.011712057688915462547 -1.8203022922998479682 1.4135730771066694622 1.5523068027783848422 1.2160890016875178787;-1.4777599632095381743 -0.064917767075039142788 1.8029320923457687886 -1.2207368286641926414 1.0334609611153551256 -2.0739888275746998225;-0.61452759946918866785 1.0330613527692475984 -2.0795314877216020122 1.520625797368168497 -0.78990290209668356791 2.5673725030164034067;1.6033874588775038905 0.056508065282829977871 1.731211440380322486 0.0053888158910829625503 -1.6031461226271748188 -0.89066488517896758026;-2.3996077610939776648 0.72471794081781970576 1.464082351654722558 -0.78612342443925398161 -1.2045222923507687973 1.1287622353299022748;1.6845059689187740215 1.713950486427407105 -1.122248353568208179 0.98255013995718731845 -0.92867384699721045038 1.8700706361225238883;-1.6350680803031563126 -0.34932101919533692369 0.62296640287722981899 1.3542292380215124048 0.87016999329669864061 -3.2391751849709558009;1.5277396084918941632 -6.3715981240482593151 1.4279943887617738696 -0.30403731132907491075 -0.5851543728441154224 -0.76477990142467400236;-1.3300971922015580873 1.3569711568511051425 -1.2846733589265870723 -1.6150644470725086244 -1.4817430470829082712 -1.0527294652744008108;-1.7871781732001015275 0.096820688098088150686 -1.9840064555083012365 -0.7346686937954473029 -0.65278819027458490076 -1.7285429141324695212;0.92090660601213236713 -0.20406169475282737169 -1.6963372478528302434 -1.2224439723872682073 4.5412584963610687083 0.83472611903681170897;1.6853576366109759288 1.5804372798525603283 0.53813368444986708905 0.61127182009558322928 2.2797355526632379075 -1.8236971741618794862;-2.0697747666365717834 -0.8620079163153901991 0.2899139202178040442 -2.2112668827299666319 0.098240714615757063211 1.1762902470373288732;-1.7744276208610560985 -0.5601560428860574703 -0.61436846130698286039 1.1606723250168529127 0.2622667513193442379 2.9197614826880151639;0.20113337671435049803 1.8269707838578030934 1.6259693374642609776 1.761382824625003396 -0.043462539845248719661 1.6491693954238053621;0.21577283043799588835 1.2450713883705968321 -1.463354733300318733 1.7459544517417315834 0.19315337965138681953 1.4258827242057103835;2.1526537079474770131 -0.12692161655580119772 1.6734494038427538687 -1.4964874040983779935 -1.6592587491426733504 -0.063999498135333357518;-0.28893050979888396101 -2.8334840475279041705 -1.2856312168838743837 -0.074039519116227858753 -0.93255558578195596464 1.6363202341331430922;1.3369468313322452335 0.81909308998927377043 -1.9362230971898566345 0.97149868700275565647 2.137043900069417468 -0.71657140335626534622;-0.75698019309381636699 -2.3040684224959595561 -1.1438476273656978943 0.97180737140658635109 1.883185873850129699 -0.93554617748870327887;1.4570993551181070647 0.037013505320992581837 1.5044241640213287248 -1.6683912483818459371 1.9220337073191988697 1.9646999807858898102;-1.0837652097219265812 0.72407465381229829671 -2.0221589398810158045 -2.1832563325828342471 0.39102719522851342449 2.7614038053323510802;-2.3820352049192496935 0.50895142287455963359 -1.8909079783837765554 -0.025983599264378830912 1.0343038026862758638 -1.1229662748135631478;1.4250895640998249014 -1.2735380762497321427 -2.1633917310479202634 -0.39140068802637439926 -1.6506791537230174338 -0.63653644738782788615;1.3732991268615717395 1.7778840707934668863 -1.4069256093038111644 -1.9799955917314620013 -0.48629001090120360651 -0.44984571411048135392;1.9920190183082262525 1.6664844301341505961 -0.74261646415764304141 -2.7940741435508353874 1.0877393615313915021 -2.7288519104377870761;2.1772474869996236713 -0.405606320054150149 1.235206862498569258 -2.2286110605591438194 1.6444636192477422032 -0.29258198680916608359;-0.086352120179520625021 0.72755576741902328042 -0.16828208768558788888 1.1667033620857276688 0.1068266759952238576 3.2421151615270682456;-0.90858302261328982574 -2.9436454141268626472 0.33455307979606835334 -1.3101410631298759935 0.096095956434767162979 1.4998059838080814998;-2.0555679020381134592 -0.95168844183448975116 -0.51467310901494789377 -2.3539390406580911197 0.093845048680440773525 -0.98126053924433376263;4.5658115774456087266 2.5373693515306192658 -0.27746979982334896153 -1.2756104383523350077 2.480847323180950692 2.6000443940356841033;1.6405931151093551268 3.6677588599798447433 0.27202216527374678545 1.4997975507963867692 2.3383592423467782773 1.6105885166300646372;-2.9901060931320841974 1.0919970716536164801 -1.4128940775112814876 -0.68265778213633465654 -0.4268506122406930392 0.54434389235814384378;2.5115689874432760575 -0.16641234248851272115 1.5745999254723390681 0.18867990103087806109 1.3552156671530957155 -0.18584163907221873391;-0.82529612166329435752 4.1805167984342812559 1.1987247262164020256 1.6226227021491534952 0.56345231216032720667 1.9462608226671691547;-1.5711453918836477683 1.8789006287157168362 3.0307977388547180375 0.57082102753283858743 -0.21723614105367922145 0.74808717765207888295;0.38749866903537200091 0.084934198456791329401 -1.2582734892877049937 2.9984438145393186304 1.2555151261829458065 0.75400258092664085297;-2.5484961052400905146 -1.9910347969154389425 -1.4470167581385711131 0.37669399896078092915 1.3613245435408223294 1.145802154263444006;1.6228711910697060095 -0.20305774624500150249 1.3563248120873303559 -2.2477741848183607765 0.37262183572261409203 0.99685658879289162915;-1.4002585326440806224 1.5268378951394141474 -1.8937802900976659082 -0.39922477533619304957 -1.1715361041594130054 -0.78267356929512643671;-0.19037534337807524021 -2.4653148356132592589 0.42852476914117759721 -1.1632572375794720809 -1.659419888281362665 -1.7896018640688251544;1.8811105003419021919 -1.9481439649071561337 2.0343420020542617443 0.27647675422013234803 0.099793967621931392586 0.96831477486748118721;-3.7186522815271598752 3.2087687307234831202 -1.6701398731717895796 1.1833448303593221418 -1.267857089758615885 2.0097230806592878416;-0.87605626115783663543 0.25769129742466562183 -1.6354844642108292696 -1.434468231825872353 -1.3936012395224446347 0.37626250535153127341;0.89303229750995927194 0.51089214810739858041 -1.1399620640716736641 -1.6121962822732569531 -1.8428873826402911718 2.1624600495860932803;-1.8866691339487495771 1.4698541461493892513 -1.0667735161999412075 -0.32961717001568457963 0.56871245675169490585 -1.8447167937205162236;1.7354626355744435795 -0.0042682847511617653946 1.6059430201973154961 1.6865233544534099508 1.4069780162320919548 0.48350130208344765936;-0.41912993722691571641 1.9106656411189053557 2.3935830006254619207 -0.56656583050023634485 2.5366938008716934938 -0.45790364493966534409;2.7896178420883046556 -2.139605847336608857 -1.628519356340693891 1.0289808264892359446 -0.25743343640536570094 -0.62144062038743697052;-2.4176288511077053123 -2.2544092189216078381 2.1182041293417106509 -2.3755376877083418385 0.2541760200424715288 -1.3161859187574997954;-2.1415804654506382931 -0.15926620526799706301 0.72325590947384699181 -1.7788250781694863178 -1.5610109632592901185 1.7717100652263018112;1.967971122827392616 1.8825164049829512525 1.9310193685835830291 0.39911666283445595971 -0.196003903079385422 -0.64910963073136673795;1.3754823328014245121 -1.2121488299515792431 3.9685415359867777241 4.422019627398626973 0.76631522730883994132 -0.37550469757425269934;3.1523842002857587197 0.450189379726545158 0.12419320657881781356 -1.5872542097504171998 2.3089938751023373342 0.64357540209037711332;1.6931956869648665531 -1.223146928068516992 -0.74762423994615789802 -1.7196230194775843358 -0.50300469047375284681 -2.1212666751267326148;-0.39848987029218607692 -1.502031836121060282 -0.92729253201677752649 -0.20909497004491098271 -4.2923829117440730485 -1.7431178499445116881;3.2823501154757979137 1.705680972572505727 3.4466357580924755766 -0.24879075470561567984 -0.60284903018759572468 -0.19453757789412776114;-0.85788580922995127942 -1.9358268585844988774 1.1933446647135679264 -0.61671290378920362585 -1.7584926861321925617 -1.0800018209451140994;-1.5359256360631672322 0.19874184878382838981 1.7198308065199763295 -0.36966470967544501347 -2.1026334609557881805 -2.0919603062690974582;2.5435492589930648322 1.7719763587814398864 3.2855625474717387036 0.7740851575439074983 -0.15376073368828521715 -0.059338050499231569102;1.2562565039147177703 -0.82152841332578296907 1.8694234639019502442 -1.0756016901653802087 0.55545859020277343898 2.0128654802336085616;0.021071735431175776798 2.9412139104184666927 1.3060579903226776644 -3.7748952457281346184 0.97283206294734825281 -1.5328054546538525393;-0.51699459051129981191 -5.9702312241612611743 0.31068185222372207699 2.4101787852144198609 -0.26272049629557508998 1.3329966546928007087;0.08630843744369598447 0.92402028214473108658 0.76291258183303722884 -1.7126245691642110192 0.50634742773805374583 -1.7129736323389979091;3.7759441373000561804 0.59856816079340879888 0.41235451914645654403 0.58912942325458683701 0.62313688351794938036 2.6302515657285581163;-0.68273455201161026284 -2.4544883039064311347 0.18220088302298242944 -1.8177321511440638346 0.83022330020638723802 -1.1898318318486329481;1.349928424224889012 0.87410051385876663677 1.5473543063073034176 -1.6075603254453751934 1.5649176022871003067 -0.80905042799650694896;-0.86872660357430142586 -0.56882399734529154323 -1.2754275405704318391 1.4412481085520676416 1.2410886651421424443 1.5214373939051872853;0.52635395295522136028 -1.6150147303044759539 1.3509703590775294924 0.51254424132495290944 1.0741798560740130064 -0.22476480540370849526;-1.4153997160685511947 -3.1204857650048229978 -0.18963300620958334353 -1.2526239594898307406 1.5943036785016095891 -2.5085798093525357721;2.4141141725952937058 0.12138979818101316988 0.82501406852481240506 0.30436397309913204579 -0.40763915072219747415 -2.6086398892394289106;-0.87960582709769308263 -3.7923397839817685195 -0.93710916418036982467 -2.3826921416435902223 -1.1217247040981843664 -2.5350307763658119775;0.63840979477548820409 2.0461180561303495828 1.0018581969442101887 -0.75777594482835874956 2.0748087949267346453 -0.38587502513038512975;1.0201186708420935112 0.57326361838884387634 -0.069199088917620221739 2.3712094797533143087 1.3882739903889107502 0.39013392052411344224;-0.35629415311410805867 -0.52188191299868691431 -1.1828760825544091251 0.92117890976059857433 -2.7243848022611172333 0.93517789444526489007;-0.44042394440048981963 -5.959287019413820552 -0.29258024216606687284 -0.049426162660962412454 -1.1041984260428954201 -0.14155696989089272542;-0.028398709119920987481 1.3916127756433713802 -2.0881388495468069522 -0.29915300047554854723 -1.3360312292582672278 -0.80434776203839430941;0.52425115376639042086 -1.5291249832446822676 -0.096336245386521454637 -1.7764210108453752923 -1.8399692580844855261 -1.9542498048459417959;2.0686230632025721654 2.118900906760730507 0.48528593181618051577 -0.32842160661604341554 2.5353022644188221157 2.4499383746415652752;-0.3752015336781614474 -2.0167557767712445127 2.5999524241179994277 2.7103272200451895557 0.68954368230750384683 1.8396979080761606262;0.046782278854328229745 -0.44627472600993994822 0.29097705407238289022 -1.8028493926528181834 -2.1753445718963790867 1.6552648124972544341;-0.54077901534954986307 -0.76833912125779657565 -0.94765856682099480768 -2.0181871229769829945 -2.1859391507705976387 0.806479002759097785;-4.3038271388948015073 -4.234949542055829852 0.46659849277534048984 -1.6193028698343758798 -4.5527291947805856864 -3.8738864808864308387;2.0362140521092149115 0.063564627616585211989 -0.64770299006560694277 2.8005561282237989573 0.35426488986105886259 0.89954000268042066946;0.69765619914832677217 -0.76093291624334535861 1.3803175645539449423 -0.5835864228995195635 1.9260423857741186815 -0.1731005485690027268;1.5746676902610574622 -1.8543014172670309048 -1.8025817567868716029 -0.56708463624955374183 0.4855609426485794633 -1.2892967892198987645;1.7589321403041104919 0.11235358386647560647 0.30999258019399522635 3.7375850590681833907 3.4046614430886985581 0.33187274144003742204;-0.56274444354629460374 0.56913614043259674879 0.52901216792929439681 -3.5672958913989982754 -0.54970489163097091545 -0.92580539963094343747;-1.2836853404082642083 -1.0574297367254228419 -2.8996876954417190042 1.2656025021641124084 1.1579023886640700258 0.0017038543493906200404;-2.5970563982658694258 -3.0640536727417697627 0.45563394876554619284 1.1429210108852450034 -0.6320004796438523087 -0.36242751356826535813;-0.061964478535262337844 0.063025619041971708834 -1.043504634113125995 -1.4106060904375998799 -2.8445194494884553649 0.038419435196440858415;0.78006507277008707568 -2.9239087492296604864 -1.4322918953531600383 1.1284348035372655517 0.86176490009144690596 -3.7378925854453335376;0.16035568813370240648 2.0643552969636886907 -0.23403200350956948617 1.9665330837918544304 1.6282299326393792072 -0.29449698679015334779;1.4457320160335025427 2.5614212588306051188 0.79957316726056504308 -0.14769047978900978757 -1.8595109797038704702 -0.25592879408662561058;-0.40739949962849897336 1.0585444152745733248 1.2847792510410296352 2.803777239595194537 -3.4504997993186834471 -1.2485609043182976929;-1.2057622882149532373 0.3871923108489316312 -0.71414415023994570753 1.0205357923891487104 -3.8439942433915788023 -0.63578802528765321345;-2.0210964954556760453 -3.1750222011749222872 -1.5497467261297162011 -0.43385691703082507331 -4.9386789300844693429 -3.7461902248140641625;0.39805176297438216171 0.37284152272429593733 -2.4550803912201968338 -1.4393088763533750107 0.70107672215268512783 -2.036719344899549089;1.6179320284583444955 3.3484587159645440302 2.1201210433400641264 0.70223164058192433234 2.0779632368044769208 2.4432803134769245368;-0.52720546790957856231 -1.0954957376059577534 -1.4517355188954825795 -1.3860370074873578083 3.2100421473607405609 0.33237980676739342645;0.87177752958090704016 3.6345131734603621787 -0.36976208520608216945 0.57379688614717594408 -1.5742526392347246933 0.36556223001518123317;1.1779612438905149308 -2.6346613155752760527 -1.12491942253148558 1.5653874491356936094 0.62176153595002126018 0.31117493509789856398;-3.40653023155587098 -1.7171752410089742291 0.49814389224918065313 4.9463452470609290401 -2.4559680690122345226 0.23483104126460019323;-0.13172601910926554081 -0.32276558190967985507 1.2843103533808579719 -1.2543661104841294929 2.3067140124908647181 -0.93013832981014998857;0.461318397162673699 -9.288499159129717242 0.0068288490488831524172 2.3196573904955233303 5.2694058689642657711 -2.2845036970687542244;-1.2264438913786954721 2.4483218110074007612 0.21514753552293261474 1.3968507284920319567 1.2126506864320532042 0.56417233229393037863;0.48004534016962002729 0.8362640552627063073 1.7585791325070416757 0.37973841512349054694 2.9841792140298055713 2.2753536905761091447;-0.57029493864677993642 -0.3843025705689493976 0.49224601078997148873 2.6723603755823357453 -3.0464726787345890457 -0.86934393222814132507;0.11140529993332803915 -2.0304343110124278837 0.57075382687348896749 -0.66245377532688964894 -0.53216092979728324419 2.4781698309256312562;0.30123538980318792513 -1.4319847632162074902 -2.2995203806717881001 0.30725634187486239313 -0.92850048352282177344 -1.8547037022781085458;-0.70209577658421318258 -0.19979678119980312512 -1.9806943637077463194 -1.8936562908839920105 0.94903405496764081661 -0.35628214935029256516;-0.60049725390192287833 -2.0916955371826300158 1.8665951041228143747 -1.1049058446554225199 -1.2306652873615944177 1.6466033103968518159;-1.7569392358502529117 -0.72219729987300684826 -1.5493909330775057498 0.035104749376060756516 -1.3433285011362423589 1.9798892187216550198;-1.416606682977399112 -0.035367124201556673913 0.81678296332476263419 1.4608691075032036455 -1.83959214276882288 1.6835823608869462387;1.2633792532707448508 -0.66029999431696106971 -1.8219122460260270824 2.1249640721931926102 0.84874689625968335882 -1.3154513914216201531;0.40793414632825913957 0.95586516367078555589 2.5226801714448021663 2.0035306873853881982 -2.7983536043021324247 -0.31402593114908766703;-0.51424086683075875825 2.6997815001313334449 -1.0413240455574743759 -0.3629848434503001875 -0.43973141629941164821 2.6524355578963643154;-1.0029210299863822176 -1.0280900405631983041 -0.38155474732489930156 1.4347035060906554449 2.006707479168595043 -0.025057519850811199591;0.91905030585652081054 2.7400199250222692093 -0.379413542339053389 1.6036850593302491852 2.4414037281179545857 -2.0738711447768896079;-0.81380498321476635315 1.7864625791713093506 -0.45277044883391281971 -1.8756986181606256636 0.80508781301874576819 0.8044377452457824873;-1.515156379771770867 1.7035576312878593086 2.4430704913457104155 -0.19156119857724629441 -0.83846261177452363622 -0.2557373361980853077;-0.53860109304890735338 -1.5549305849709220695 -2.6878655651572187502 0.95730201269643611095 1.1504727397202472172 -1.307163903982078601;-2.2557248724635430293 0.063805617481241583278 -2.5037907851030052342 -2.4733744098446441839 0.48741820305191047025 2.9799600919547617472;-2.4588726427470701807 0.87162498603163229838 -3.7223021066529140555 -2.7898066788728783649 -1.3871195765043657921 -2.1866913062042625526;-0.86602799434877109075 -0.3056896748553855625 2.3593506894363569515 2.8297705477687693509 0.3631914775003446394 1.2500626116585886738;0.098188964834801328863 -1.4486223734819605458 0.29510950689689918747 -1.7818471354532205986 -2.6779191926438228322 -2.1402447469818328685;1.0968844555076402436 1.8462474556065822107 1.050738528854120224 1.7844791249117506471 3.2745419064468266335 -0.36598781845959293957;-0.35606667084149196123 0.91091668248433299571 -0.5974423297316064918 2.0303250813476649839 0.782753500871065655 -2.1250474920369399889;0.74346253060921552169 -0.67957132954122112523 -1.4350516281253307138 -1.7715958982155968204 0.41737162124217208614 0.90349014993076459668;-0.90109140293373524155 -1.6996879007436751507 0.25611752427049938596 -1.6767806502329605234 1.485389921254631318 -0.6613973071066195919;0.53927484101719358467 -2.2001843328830417157 -1.9278203121974850642 -1.2829018486168122237 -2.1784235982633366469 0.87504964107965077513;-0.29908551266697852578 1.0065759130126141763 -1.7371947466220178935 1.3116869009084994868 -0.53190493017824158617 0.52180478535827401476;2.0290498849635945078 -1.6361565850086379204 -1.274193398764435825 -1.3501898090175583622 0.793986974700445991 0.50697188874418919191;0.19670764126858913956 -3.191956370153560929 -1.0138609893483632174 -0.61167456654521512593 1.4344150774266068993 -0.067905468086034828645;1.8422087174013470623 1.423463623588857363 -1.6501390627653658161 -0.68466952281683635118 -0.70649485799084221771 -1.893656339752865847;-2.4466738481396435034 -1.4729923060804521739 -0.96030451804668082172 -0.31872770574380498987 -5.0157454048923977297 -3.3252705343520068126;1.5576908011187760028 -1.7722175829923181301 -1.5902363607974940862 0.27589693546326943263 -1.2383719707881573058 -1.637870248221235725;-1.7195388604020704904 -2.7540384760184748458 -0.73402913807641678723 -1.6446208697663253773 -1.6030840885727095646 0.85584262857732196217;-0.79954449289264484246 -0.16254994910425232812 0.51600529665377870003 -0.21000057807087760264 -2.4714889165128881565 2.0994976149038566682;2.3563639559900515508 1.7347326513173044749 -3.0288432959871940398 1.6190978433760401245 2.399125337497295174 1.100206777441822048;-0.96446598394853455538 -0.91608264974532427338 -1.7421980426537926334 -0.46412144691351464587 0.21199537429586762238 -2.2596862870065574924;1.1269403927905690121 2.3415643960728531603 0.13537814405239692594 1.086262417148048165 2.4518392565026885244 0.78522694405764592585;3.0401191473822053446 0.67431958105764477907 2.1076937411095335584 -1.9390512716374326274 1.2251394155878192471 1.264747821804968142;-2.5319366513880061653 -2.4667725541622083085 -2.9179654728787296492 0.073157166657697905721 -1.0781547801497801675 -1.3574609112575959369;-2.3145712585047242271 0.76456283402441327368 1.9875903034759012655 0.56762055192527516301 1.1438328956397316727 1.4253604882277979282;3.152837287953455192 1.6026794718775252413 -1.6310605153396282585 1.8867111829283518265 2.4880328114996848043 1.8917716425345829645;1.5904661170409224447 0.92736087168652081569 -1.4363389835583655341 -0.11458600841783564417 -1.449184013195944809 1.8855432578010036249;-0.05848409931931681377 -4.0423720728883267839 0.60076099946445471467 -1.5439638096218535335 -0.77059896512935788238 -0.45032009018509533416;2.4717952212609848317 -2.6656305669339754871 0.82408673671699150809 -2.0405427570868122089 3.0151592497732466747 1.3024082234773872724;1.1713472346205058283 2.9860699685519938029 0.7966384091134304235 -1.2492363164074582471 2.9209817892666567474 -0.49158360794424571516;-1.5708583925501549139 -0.68785360546686313832 0.81424898137721934965 1.9168236020246232076 -0.18595558392777025714 1.9903437117287197111;-0.38710683429496811625 -1.3218983132550803372 -3.3038233617272667608 -2.9702945354737511074 0.536990686232195924 0.47935191093777079763;0.66730722747273496509 -0.93817100105137851696 1.7783762973398531404 1.4308438482924217272 -0.75570428170055303774 2.3754145505670627436;0.43618931519662451635 -1.8324724044432834091 1.1210457886394271654 0.96088902178347368466 -1.4734796182518898888 -1.5770553726941878292;0.65691204442481587744 1.3251903596967213872 -1.6679639251682805146 -1.3336150444743402055 -1.2573023505275242595 -1.2841499308155586156;0.94020409217263878343 -2.1395548838837750161 -0.06671625422257762561 -1.4346770535021355908 1.9413201267531803307 -0.6462858440885814737;-0.70859967234712950557 3.3652048066291384565 -1.4046495034282453496 -0.22023208877741259903 0.83790274316866464321 -1.5821706436040547938;-1.1437410460666403988 -0.14583563678877692338 1.2758453514268950357 -2.831328530451176384 -0.073948841747108445821 -1.6902191897522425013;-1.1064287603865716747 1.2102112232882142884 -1.2992547064209829522 0.83358995111274936107 -1.3661687380743814391 -0.81304137520808650308;-1.5875734973600033051 0.21701661606038438745 -0.69997014002273083566 0.63978437620348815873 0.83735410822581191059 0.06010768162906079265;0.44130502134228977162 1.1630774979254607793 -2.272186238543619563 -1.3790243013218752566 -0.7890076855397425426 1.4754368250382061678;-1.527691030496334923 0.20270793375592308094 0.77904377453641393547 0.1650611013900437074 -1.4261762605618719668 2.2567113233397235739];

% Layer 2
b2 = 0.064054585715215439645;
LW2_1 = [0.69933603025446611223 -1.3497427508857118283 -0.80759475471230446342 -1.5777371559505124488 -0.1990354041653298045 0.99213398447186840201 -0.47308018861809414402 0.56375141282461493919 0.76322381378127446272 0.81041540258121191886 -0.82154603577922946656 -1.5435073787719719718 -0.46570838176536272224 0.49374246802038729287 0.11131094370618324629 -0.83479401333590108614 -0.80498241870217535077 1.5860395268314877448 0.19124575564039017483 -2.666038292665556142 1.0390652403201723342 0.096029649829062160848 0.32784932192758547975 -0.28502108654145247302 1.1851831650748358982 0.076005915256343356545 -0.62113711368381363531 -0.071167525704471018555 -1.8885734157552027668 -1.3697768527895375357 -1.2458106607992756043 -0.93231449054459514247 -0.34072869659908178175 1.0078472323139522349 -1.1047589206572134835 -0.56082570228292727421 -2.4744429813376691563 0.021316281965734623638 0.94408512850121750759 -1.5478743456660215561 -1.6140107388078441808 0.5330219175794299602 0.16380143434877011965 1.0156405128712286956 1.0206575557546704314 2.8961950652542789442 -0.27177851978746186967 0.24266583466923452583 3.7950232102927401456 1.0144900526419855513 -0.78237631811699481776 -1.4751016960070588713 -0.34958042727035487651 2.0519749153420274723 1.6759732902589690173 -0.727078328258063733 -0.074169760821070698786 1.9433724889976751182 -0.55454823090884519665 1.5684207329662855912 0.061012992398146358164 0.11474055697705022594 -1.1006963476633426779 1.8841674375177597245 -1.8379013176774245952 0.13357302385883779161 -1.2553357479743687541 -0.25115133776415932143 -0.73827725982154845941 -1.4399510746542267814 -0.4284085031619230266 -1.0319585505724717667 -1.8445871952923960091 2.4060345673310372661 1.391100259852086074 0.29952491684177739995 -0.73577077955369352136 0.16898515806834030206 -0.37992273043011365319 0.5508941165130503137 -3.3742041777922051615 0.68828180697743013283 -2.8769232700071603048 -0.060848343386466600957 -0.044239871146381719302 2.1389039021071836189 -2.3487890980924621687 -2.6093156358101752268 -1.4188703440142320655 -0.0052618558314718039126 0.76962061142551729809 0.047775093327877243832 -0.90941781900436813313 -0.42945966910200517042 0.1314303681670379309 0.60207467618903565132 0.90810377879005854673 -0.61368176236722637995 0.087318239808298600546 4.2114891625250159279 2.0397275678615702788 0.87982590722437437059 0.2932734509213968388 -0.80879046312685931586 1.4674671248011135205 1.2272053595156133809 0.69083565575928596036 0.48216771403423119846 1.218482317943448745 2.648696900814949462 0.80233853333067672864 -0.13997585922123473301 0.84690741386149070991 0.068088037643345228345 -0.48219929775020542451 -0.23491739182800316921 2.3367323110003539455 0.47874654330397631297 0.08304402325660543982 0.95337367127227401475 0.3059170676360608021 -0.92012149411944332833 1.1943648615848589944 0.16807877297077197798 -1.9504446735062050955 0.1650131790268115628 -1.7876890017425755008 -1.0536205623821275346 0.79311212463779723336 -2.6498276685739385883 -4.0221594321989835308 -3.5153950555266044731 -3.0464754642583398159 -2.7797344688091984999 0.3291499566745065275 0.93738129738515474365 2.5128477812657821211 1.2982249697099526031 -2.0340395813300111705 4.9750903491693163616 -5.3694659248065930157 -0.38437121522008665941 7.943475282422138406 0.76635375453861709349 0.23107970839351860137 1.5274035328100725728 -0.73070295841178012353 0.93355726367674396471 0.68489079799324914521 -0.053603094377183607699 -2.1739411529335388451 -0.40383856732968759218 -0.61695323594957518498 -2.441761553779870475 0.66460130689497942669 -0.41191260694380049667 -1.9316432041059350411 7.7818185060308771028 -0.76778404942476530248 1.2679221800452600277 -0.37401772641561026322 -1.1377987839450149909 -1.1327470722815820015 0.87903811699076572772 -0.25081128322914403306 0.97095810304469432062 -0.1050021665747361832 3.2660737420423338051 -0.42176747653364632384 0.045986023723291372112 0.34315311007229348794 0.8826605789683865666 0.095805031542298621505 -0.51902411821442739903 0.074724977995450747592 0.68385760478648216498 -0.072531633033871834026 -1.8566653667307104758 -1.8735919324074339354 -0.43477269262247147941 1.8401269224072080988 -0.28931373844326924161 -0.45147480624139130212 -0.73604327907281763554 -1.1024950259194061797 1.0851968659252613225 2.8963450468087668099 1.721071185065952136 0.81890500689597878203 -0.5718512808387498092 0.52219879066054386563 0.036313981866945337085 -0.30489201492872797239 0.22631948239030541536 1.2556601343288886774 1.8924538853571482022 0.87020421240700474019 1.1393388320501369737 -0.23900737508216193805 0.038256330304598601399];

% Output 1
y1_step1.ymin = -1;
y1_step1.gain = 0.05;
y1_step1.xoffset = 60;

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
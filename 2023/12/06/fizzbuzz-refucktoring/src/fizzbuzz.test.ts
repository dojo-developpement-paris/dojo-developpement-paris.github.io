import { fizzbuzz } from "./fizzbuzz"
import { describe } from "node:test"

const adapter = (paramètreDeTypeAny: any) =>
  typeof paramètreDeTypeAny !== "string"
    ? paramètreDeTypeAny + ""
    : paramètreDeTypeAny

describe("fizzbuzz spell checking", () => {
  test.each([
    { number: 1, expectedWord: adapter(1) },
    { number: 2, expectedWord: adapter(2) },
    { number: 3, expectedWord: "Fizz" },
    { number: 4, expectedWord: adapter(4) },
    { number: 5, expectedWord: "Buzz" },
    { number: 6, expectedWord: "Fizz" },
    { number: 7, expectedWord: adapter(7) },
    { number: 8, expectedWord: adapter(8) },
    { number: 9, expectedWord: "Fizz" },
    { number: 10, expectedWord: "Buzz" },
    { number: 11, expectedWord: adapter(11) },
    { number: 12, expectedWord: "Fizz" },
    { number: 13, expectedWord: adapter(13) },
    { number: 14, expectedWord: adapter(14) },
    { number: 15, expectedWord: "Fizz Buzz" },
    { number: 16, expectedWord: adapter(16) },
    { number: 17, expectedWord: adapter(17) },
    { number: 18, expectedWord: "Fizz" },
    { number: 19, expectedWord: adapter(19) },
    { number: 20, expectedWord: "Buzz" },
    { number: 21, expectedWord: "Fizz" },
    { number: 22, expectedWord: adapter(22) },
    { number: 23, expectedWord: adapter(23) },
    { number: 24, expectedWord: "Fizz" },
    { number: 25, expectedWord: "Buzz" },
    { number: 26, expectedWord: adapter(26) },
    { number: 27, expectedWord: "Fizz" },
    { number: 28, expectedWord: adapter(28) },
    { number: 29, expectedWord: adapter(29) },
    { number: 30, expectedWord: "Fizz Buzz" },
    { number: 31, expectedWord: adapter(31) },
    { number: 32, expectedWord: adapter(32) },
    { number: 33, expectedWord: "Fizz" },
    { number: 34, expectedWord: adapter(34) },
    { number: 35, expectedWord: "Buzz" },
    { number: 36, expectedWord: "Fizz" },
    { number: 37, expectedWord: adapter(37) },
    { number: 38, expectedWord: adapter(38) },
    { number: 39, expectedWord: "Fizz" },
    { number: 40, expectedWord: "Buzz" },
    { number: 41, expectedWord: adapter(41) },
    { number: 42, expectedWord: "Fizz" },
    { number: 43, expectedWord: adapter(43) },
    { number: 44, expectedWord: adapter(44) },
    { number: 45, expectedWord: "Fizz Buzz" },
    { number: 46, expectedWord: adapter(46) },
    { number: 47, expectedWord: adapter(47) },
    { number: 48, expectedWord: "Fizz" },
    { number: 49, expectedWord: adapter(49) },
    { number: 50, expectedWord: "Buzz" },
    { number: 51, expectedWord: "Fizz" },
    { number: 52, expectedWord: adapter(52) },
    { number: 53, expectedWord: adapter(53) },
    { number: 54, expectedWord: "Fizz" },
    { number: 55, expectedWord: "Buzz" },
    { number: 56, expectedWord: adapter(56) },
    { number: 57, expectedWord: "Fizz" },
    { number: 58, expectedWord: adapter(58) },
    { number: 59, expectedWord: adapter(59) },
    { number: 60, expectedWord: "Fizz Buzz" },
    { number: 61, expectedWord: adapter(61) },
    { number: 62, expectedWord: adapter(62) },
    { number: 63, expectedWord: "Fizz" },
    { number: 64, expectedWord: adapter(64) },
    { number: 65, expectedWord: "Buzz" },
    { number: 66, expectedWord: "Fizz" },
    { number: 67, expectedWord: adapter(67) },
    { number: 68, expectedWord: adapter(68) },
    { number: 69, expectedWord: "Fizz" },
    { number: 70, expectedWord: "Buzz" },
    { number: 71, expectedWord: adapter(71) },
    { number: 72, expectedWord: "Fizz" },
    { number: 73, expectedWord: adapter(73) },
    { number: 74, expectedWord: adapter(74) },
    { number: 75, expectedWord: "Fizz Buzz" },
    { number: 76, expectedWord: adapter(76) },
    { number: 77, expectedWord: adapter(77) },
    { number: 78, expectedWord: "Fizz" },
    { number: 79, expectedWord: adapter(79) },
    { number: 80, expectedWord: "Buzz" },
    { number: 81, expectedWord: "Fizz" },
    { number: 82, expectedWord: adapter(82) },
    { number: 83, expectedWord: adapter(83) },
    { number: 84, expectedWord: "Fizz" },
    { number: 85, expectedWord: "Buzz" },
    { number: 86, expectedWord: adapter(86) },
    { number: 87, expectedWord: "Fizz" },
    { number: 88, expectedWord: adapter(88) },
    { number: 89, expectedWord: adapter(89) },
    { number: 90, expectedWord: "Fizz Buzz" },
    { number: 91, expectedWord: adapter(91) },
    { number: 92, expectedWord: adapter(92) },
    { number: 93, expectedWord: "Fizz" },
    { number: 94, expectedWord: adapter(94) },
    { number: 95, expectedWord: "Buzz" },
    { number: 96, expectedWord: "Fizz" },
    { number: 97, expectedWord: adapter(97) },
    { number: 98, expectedWord: adapter(98) },
    { number: 99, expectedWord: "Fizz" },
    { number: 100, expectedWord: "Buzz" },
  ])(
    "$number should be spelled as $expectedWord",
    ({ number, expectedWord: spelledAsExpected }) => {
      const wordToSpell = fizzbuzz(number)

      expect(adapter(wordToSpell)).toBe(spelledAsExpected)
    }
  )

  /*   it("", () => {
    function commonObjectService(unParamètreEnArgument: number) {
      let foo = ""
      for (let i = 0; i < unParamètreEnArgument; i++) {
        foo = foo + ";" + fizzbuzz(i)
      }
      return foo
    }

    expect(commonObjectService(10_0_0)).toBe(
      ";1;2;Fizz;4;Buzz;Fizz;7;8;Fizz;Buzz;11;Fizz;13;14;Fizz Buzz;16;17;Fizz;19;Buzz;Fizz;22;23;Fizz;Buzz;26;Fizz;28;29;Fizz Buzz;31;32;Fizz;34;Buzz;Fizz;37;38;Fizz;Buzz;41;Fizz;43;44;Fizz Buzz;46;47;Fizz;49;Buzz;Fizz;52;53;Fizz;Buzz;56;Fizz;58;59;Fizz Buzz;61;62;Fizz;64;Buzz;Fizz;67;68;Fizz;Buzz;71;Fizz;73;74;Fizz Buzz;76;77;Fizz;79;Buzz;Fizz;82;83;Fizz;Buzz;86;Fizz;88;89;Fizz Buzz;91;92;Fizz;94;Buzz;Fizz;97;98;Fizz;Buzz;101;Fizz;103;104;Fizz Buzz;106;107;Fizz;109;Buzz;Fizz;112;113;Fizz;Buzz;116;Fizz;118;119;Fizz Buzz;121;122;Fizz;124;Buzz;Fizz;127;128;Fizz;Buzz;131;Fizz;133;134;Fizz Buzz;136;137;Fizz;139;Buzz;Fizz;142;143;Fizz;Buzz;146;Fizz;148;149;Fizz Buzz;151;152;Fizz;154;Buzz;Fizz;157;158;Fizz;Buzz;161;Fizz;163;164;Fizz Buzz;166;167;Fizz;169;Buzz;Fizz;172;173;Fizz;Buzz;176;Fizz;178;179;Fizz Buzz;181;182;Fizz;184;Buzz;Fizz;187;188;Fizz;Buzz;191;Fizz;193;194;Fizz Buzz;196;197;Fizz;199;Buzz;Fizz;202;203;Fizz;Buzz;206;Fizz;208;209;Fizz Buzz;211;212;Fizz;214;Buzz;Fizz;217;218;Fizz;Buzz;221;Fizz;223;224;Fizz Buzz;226;227;Fizz;229;Buzz;Fizz;232;233;Fizz;Buzz;236;Fizz;238;239;Fizz Buzz;241;242;Fizz;244;Buzz;Fizz;247;248;Fizz;Buzz;251;Fizz;253;254;Fizz Buzz;256;257;Fizz;259;Buzz;Fizz;262;263;Fizz;Buzz;266;Fizz;268;269;Fizz Buzz;271;272;Fizz;274;Buzz;Fizz;277;278;Fizz;Buzz;281;Fizz;283;284;Fizz Buzz;286;287;Fizz;289;Buzz;Fizz;292;293;Fizz;Buzz;296;Fizz;298;299;Fizz Buzz;301;302;Fizz;304;Buzz;Fizz;307;308;Fizz;Buzz;311;Fizz;313;314;Fizz Buzz;316;317;Fizz;319;Buzz;Fizz;322;323;Fizz;Buzz;326;Fizz;328;329;Fizz Buzz;331;332;Fizz;334;Buzz;Fizz;337;338;Fizz;Buzz;341;Fizz;343;344;Fizz Buzz;346;347;Fizz;349;Buzz;Fizz;352;353;Fizz;Buzz;356;Fizz;358;359;Fizz Buzz;361;362;Fizz;364;Buzz;Fizz;367;368;Fizz;Buzz;371;Fizz;373;374;Fizz Buzz;376;377;Fizz;379;Buzz;Fizz;382;383;Fizz;Buzz;386;Fizz;388;389;Fizz Buzz;391;392;Fizz;394;Buzz;Fizz;397;398;Fizz;Buzz;401;Fizz;403;404;Fizz Buzz;406;407;Fizz;409;Buzz;Fizz;412;413;Fizz;Buzz;416;Fizz;418;419;Fizz Buzz;421;422;Fizz;424;Buzz;Fizz;427;428;Fizz;Buzz;431;Fizz;433;434;Fizz Buzz;436;437;Fizz;439;Buzz;Fizz;442;443;Fizz;Buzz;446;Fizz;448;449;Fizz Buzz;451;452;Fizz;454;Buzz;Fizz;457;458;Fizz;Buzz;461;Fizz;463;464;Fizz Buzz;466;467;Fizz;469;Buzz;Fizz;472;473;Fizz;Buzz;476;Fizz;478;479;Fizz Buzz;481;482;Fizz;484;Buzz;Fizz;487;488;Fizz;Buzz;491;Fizz;493;494;Fizz Buzz;496;497;Fizz;499;Buzz;Fizz;502;503;Fizz;Buzz;506;Fizz;508;509;Fizz Buzz;511;512;Fizz;514;Buzz;Fizz;517;518;Fizz;Buzz;521;Fizz;523;524;Fizz Buzz;526;527;Fizz;529;Buzz;Fizz;532;533;Fizz;Buzz;536;Fizz;538;539;Fizz Buzz;541;542;Fizz;544;Buzz;Fizz;547;548;Fizz;Buzz;551;Fizz;553;554;Fizz Buzz;556;557;Fizz;559;Buzz;Fizz;562;563;Fizz;Buzz;566;Fizz;568;569;Fizz Buzz;571;572;Fizz;574;Buzz;Fizz;577;578;Fizz;Buzz;581;Fizz;583;584;Fizz Buzz;586;587;Fizz;589;Buzz;Fizz;592;593;Fizz;Buzz;596;Fizz;598;599;Fizz Buzz;601;602;Fizz;604;Buzz;Fizz;607;608;Fizz;Buzz;611;Fizz;613;614;Fizz Buzz;616;617;Fizz;619;Buzz;Fizz;622;623;Fizz;Buzz;626;Fizz;628;629;Fizz Buzz;631;632;Fizz;634;Buzz;Fizz;637;638;Fizz;Buzz;641;Fizz;643;644;Fizz Buzz;646;647;Fizz;649;Buzz;Fizz;652;653;Fizz;Buzz;656;Fizz;658;659;Fizz Buzz;661;662;Fizz;664;Buzz;Fizz;667;668;Fizz;Buzz;671;Fizz;673;674;Fizz Buzz;676;677;Fizz;679;Buzz;Fizz;682;683;Fizz;Buzz;686;Fizz;688;689;Fizz Buzz;691;692;Fizz;694;Buzz;Fizz;697;698;Fizz;Buzz;701;Fizz;703;704;Fizz Buzz;706;707;Fizz;709;Buzz;Fizz;712;713;Fizz;Buzz;716;Fizz;718;719;Fizz Buzz;721;722;Fizz;724;Buzz;Fizz;727;728;Fizz;Buzz;731;Fizz;733;734;Fizz Buzz;736;737;Fizz;739;Buzz;Fizz;742;743;Fizz;Buzz;746;Fizz;748;749;Fizz Buzz;751;752;Fizz;754;Buzz;Fizz;757;758;Fizz;Buzz;761;Fizz;763;764;Fizz Buzz;766;767;Fizz;769;Buzz;Fizz;772;773;Fizz;Buzz;776;Fizz;778;779;Fizz Buzz;781;782;Fizz;784;Buzz;Fizz;787;788;Fizz;Buzz;791;Fizz;793;794;Fizz Buzz;796;797;Fizz;799;Buzz;Fizz;802;803;Fizz;Buzz;806;Fizz;808;809;Fizz Buzz;811;812;Fizz;814;Buzz;Fizz;817;818;Fizz;Buzz;821;Fizz;823;824;Fizz Buzz;826;827;Fizz;829;Buzz;Fizz;832;833;Fizz;Buzz;836;Fizz;838;839;Fizz Buzz;841;842;Fizz;844;Buzz;Fizz;847;848;Fizz;Buzz;851;Fizz;853;854;Fizz Buzz;856;857;Fizz;859;Buzz;Fizz;862;863;Fizz;Buzz;866;Fizz;868;869;Fizz Buzz;871;872;Fizz;874;Buzz;Fizz;877;878;Fizz;Buzz;881;Fizz;883;884;Fizz Buzz;886;887;Fizz;889;Buzz;Fizz;892;893;Fizz;Buzz;896;Fizz;898;899;Fizz Buzz;901;902;Fizz;904;Buzz;Fizz;907;908;Fizz;Buzz;911;Fizz;913;914;Fizz Buzz;916;917;Fizz;919;Buzz;Fizz;922;923;Fizz;Buzz;926;Fizz;928;929;Fizz Buzz;931;932;Fizz;934;Buzz;Fizz;937;938;Fizz;Buzz;941;Fizz;943;944;Fizz Buzz;946;947;Fizz;949;Buzz;Fizz;952;953;Fizz;Buzz;956;Fizz;958;959;Fizz Buzz;961;962;Fizz;964;Buzz;Fizz;967;968;Fizz;Buzz;971;Fizz;973;974;Fizz Buzz;976;977;Fizz;979;Buzz;Fizz;982;983;Fizz;Buzz;986;Fizz;988;989;Fizz Buzz;991;992;Fizz;994;Buzz;Fizz;997;998;Fizz"
    )
  }) */
})

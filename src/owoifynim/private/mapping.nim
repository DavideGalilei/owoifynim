import std / [random, strutils]
import word

when defined(js):
    import std / jsre
    import jstemplates
else:
    import std / nre

let
    O_TO_OWO* = re"o"
    EW_TO_UWU* = re"ew"
    HEY_TO_HAY* = re"([Hh])ey"
    DEAD_TO_DED_UPPER* = re"Dead"
    DEAD_TO_DED_LOWER* = re"dead"
    N_VOWEL_T_TO_ND* = re"n[aeiou]*t"
    READ_TO_WEAD_UPPER* = re"Read"
    READ_TO_WEAD_LOWER* = re"read"
    BRACKETS_TO_STARTRAILS_FORE* = re"[({<]"
    BRACKETS_TO_STARTRAILS_REAR* = re"[)}>]"
    PERIOD_COMMA_EXCLAMATION_SEMICOLON_TO_KAOMOJIS_FIRST* = re"[.,](?![0-9])"
    PERIOD_COMMA_EXCLAMATION_SEMICOLON_TO_KAOMOJIS_SECOND* = re"[!;]+"
    THAT_TO_DAT_UPPER* = re"That"
    THAT_TO_DAT_LOWER* = re"that"
    TH_TO_F_UPPER* = re"TH(?!E)"
    TH_TO_F_LOWER* = re"[Tt]h(?![Ee])"
    LE_TO_WAL* = re"le$"
    VE_TO_WE_UPPER* = re"Ve"
    VE_TO_WE_LOWER* = re"ve"
    RY_TO_WWY* = re"ry"
    RORL_TO_W_UPPER* = re"(?:R|L)"
    RORL_TO_W_LOWER* = re"(?:r|l)"
    LL_TO_WW* = re"ll"
    VOWEL_OR_R_EXCEPT_O_L_TO_WL_UPPER* = re"[AEIUR]([lL])$"
    VOWEL_OR_R_EXCEPT_O_L_TO_WL_LOWER* = re"[aeiur]l$"
    OLD_TO_OWLD_UPPER* = re"OLD"
    OLD_TO_OWLD_LOWER* = re"([Oo])ld"
    OL_TO_OWL_UPPER* = re"OL"
    OL_TO_OWL_LOWER* = re"([Oo])l"
    LORR_O_TO_WO_UPPER* = re"[LR]([oO])"
    LORR_O_TO_WO_LOWER* = re"[lr]o"
    SPECIFIC_CONSONANTS_O_TO_LETTER_AND_WO_UPPER* = re"([BCDFGHJKMNPQSTXYZ])([oO])"
    SPECIFIC_CONSONANTS_O_TO_LETTER_AND_WO_LOWER* = re"([bcdfghjkmnpqstxyz])o"
    VORW_LE_TO_WAL* = re"[vw]le"
    FI_TO_FWI_UPPER* = re"FI"
    FI_TO_FWI_LOWER* = re"([Ff])i"
    VER_TO_WER* = re"([Vv])er"
    POI_TO_PWOI* = re"([Pp])oi"
    SPECIFIC_CONSONANTS_LE_TO_LETTER_AND_WAL* = re"([DdFfGgHhJjPpQqRrSsTtXxYyZz])le$"
    CONSONANT_R_TO_CONSONANT_W* = re"([BbCcDdFfGgKkPpQqSsTtWwXxZz])r"
    LY_TO_WY_UPPER* = re"Ly"
    LY_TO_WY_LOWER* = re"ly"
    PLE_TO_PWE* = re"([Pp])le"
    NR_TO_NW_UPPER* = re"NR"
    NR_TO_NW_LOWER* = re"nr"
    FUC_TO_FWUC* = re"([Ff])uc"
    MOM_TO_MWOM* = re"([Mm])om"
    ME_TO_MWE* = re"([Mm])e"
    N_VOWEL_TO_NY_FIRST* = re"n([aeiou])"
    N_VOWEL_TO_NY_SECOND* = re"N([aeiou])"
    N_VOWEL_TO_NY_THIRD* = re"N([AEIOU])"
    OVE_TO_UV_UPPER* = re"OVE"
    OVE_TO_UV_LOWER* = re"ove"
    HAHA_TO_HEHE_XD* = re"\b(ha|hah|heh|hehe)+\b"
    THE_TO_TEH* = re"\b([Tt])he\b"
    YOU_TO_U_UPPER* = re"\bYou\b"
    YOU_TO_U_LOWER* = re"\byou\b"
    TIME_TO_TIM* = re"\b([Tt])ime\b"
    OVER_TO_OWOR* = re"([Oo])ver"
    WORSE_TO_WOSE* = re"([Ww])orse"

const FACES = [
    "(・`ω´・)", ";;w;;", "owo", "UwU", ">w<", "^w^", "(* ^ ω ^)",
    "(⌒ω⌒)", "ヽ(*・ω・)ﾉ", "(o´∀`o)", "(o･ω･o)", "＼(＾▽＾)／",
    "(*^ω^)", "(◕‿◕✿)", "(◕ᴥ◕)", "ʕ•ᴥ•ʔ", "ʕ￫ᴥ￩ʔ", "(*^.^*)", "(｡♥‿♥｡)",
    "OwO", "uwu", "uvu", "UvU", "(*￣з￣)", "(つ✧ω✧)つ", "(/ =ω=)/",
    "(╯°□°）╯︵ ┻━┻", "┬─┬ ノ( ゜-゜ノ)", "¯\\_(ツ)_/¯"
]

proc mapOToOwO*(input: var Word) =
    input.replace(O_TO_OWO, if rand(1) > 0: "owo" else: "o")

proc mapEwToUwU*(input: var Word) =
    input.replace(EW_TO_UWU, "uwu")

proc mapHeyToHay*(input: var Word) =
    input.replace(HEY_TO_HAY, "$1ay")

proc mapDeadToDed*(input: var Word) =
    input.replace(DEAD_TO_DED_UPPER, "Ded")
    input.replace(DEAD_TO_DED_LOWER, "ded")

proc mapNVowelTToNd*(input: var Word) =
    input.replace(N_VOWEL_T_TO_ND, "nd")

proc mapReadToWead*(input: var Word) =
    input.replace(READ_TO_WEAD_UPPER, "Wead")
    input.replace(READ_TO_WEAD_LOWER, "wead")

proc mapBracketsToStarTrails*(input: var Word) =
    input.replace(BRACKETS_TO_STARTRAILS_FORE, "｡･:*:･ﾟ★,｡･:*:･ﾟ☆")
    input.replace(BRACKETS_TO_STARTRAILS_REAR, "☆ﾟ･:*:･｡,★ﾟ･:*:･｡")

proc mapPeriodCommaExclamationSemicolonToKaomojis*(input: var Word) =
    input.replaceWithProcSingle(PERIOD_COMMA_EXCLAMATION_SEMICOLON_TO_KAOMOJIS_FIRST, proc(): string = FACES[rand(len(FACES) - 1)])
    input.replaceWithProcSingle(PERIOD_COMMA_EXCLAMATION_SEMICOLON_TO_KAOMOJIS_SECOND, proc(): string = FACES[rand(len(FACES) - 1)])

proc mapThatToDat*(input: var Word) =
    input.replace(THAT_TO_DAT_LOWER, "dat")
    input.replace(THAT_TO_DAT_UPPER, "Dat")

proc mapThToF*(input: var Word) =
    input.replace(TH_TO_F_LOWER, "f")
    input.replace(TH_TO_F_UPPER, "F")

proc mapLeToWal*(input: var Word) =
    input.replace(LE_TO_WAL, "wal")

proc mapVeToWe*(input: var Word) =
    input.replace(VE_TO_WE_LOWER, "we")
    input.replace(VE_TO_WE_UPPER, "We")

proc mapRyToWwy*(input: var Word) =
    input.replace(RY_TO_WWY, "wwy")

proc mapROrLToW*(input: var Word) =
    input.replace(RORL_TO_W_LOWER, "w")
    input.replace(RORL_TO_W_UPPER, "W")

proc mapLlToWw*(input: var Word) =
    input.replace(LL_TO_WW, "ww")

proc mapVowelOrRExceptOLToWl*(input: var Word) =
    input.replace(VOWEL_OR_R_EXCEPT_O_L_TO_WL_LOWER, "wl")
    input.replace(VOWEL_OR_R_EXCEPT_O_L_TO_WL_UPPER, "W$1")

proc mapOldToOwld*(input: var Word) =
    input.replace(OLD_TO_OWLD_LOWER, "$1wld")
    input.replace(OLD_TO_OWLD_UPPER, "OWLD")

proc mapOlToOwl*(input: var Word) =
    input.replace(OL_TO_OWL_LOWER, "$1wl")
    input.replace(OL_TO_OWL_UPPER, "OWL")

proc mapLOrROToWo*(input: var Word) =
    input.replace(LORR_O_TO_WO_LOWER, "wo")
    input.replace(LORR_O_TO_WO_UPPER, "W$1")

proc mapSpecificConsonantsOToLetterAndWo*(input: var Word) =
    input.replace(SPECIFIC_CONSONANTS_O_TO_LETTER_AND_WO_LOWER, "$1wo")
    input.replaceWithProcMultiple(SPECIFIC_CONSONANTS_O_TO_LETTER_AND_WO_UPPER, proc(s1: string, s2: string): string =
        s1 & (if s2.toUpper() == s2: "W" else: "w") & s2)

proc mapVOrWLeToWal*(input: var Word) =
    input.replace(VORW_LE_TO_WAL, "wal")

proc mapFiToFwi*(input: var Word) =
    input.replace(FI_TO_FWI_LOWER, "$1wi")
    input.replace(FI_TO_FWI_UPPER, "FWI")

proc mapVerToWer*(input: var Word) =
    input.replace(VER_TO_WER, "wer")

proc mapPoiToPwoi*(input: var Word) =
    input.replace(POI_TO_PWOI, "$1woi")

proc mapSpecificConsonantsLeToLetterAndWal*(input: var Word) =
    input.replace(SPECIFIC_CONSONANTS_LE_TO_LETTER_AND_WAL, "$1wal")

proc mapConsonantRToConsonantW*(input: var Word) =
    input.replace(CONSONANT_R_TO_CONSONANT_W, "$1w")

proc mapLyToWy*(input: var Word) =
    input.replace(LY_TO_WY_LOWER, "wy")
    input.replace(LY_TO_WY_UPPER, "Wy")

proc mapPleToPwe*(input: var Word) =
    input.replace(PLE_TO_PWE, "$1we")

proc mapNrToNw*(input: var Word) =
    input.replace(NR_TO_NW_LOWER, "nw")
    input.replace(NR_TO_NW_UPPER, "NW")

proc mapFucToFwuc*(input: var Word) =
    input.replace(FUC_TO_FWUC, "$1wuc")

proc mapMomToMwom*(input: var Word) =
    input.replace(MOM_TO_MWOM, "$1wom")

proc mapMeToMwe*(input: var Word) =
    input.replace(ME_TO_MWE, "$1we")

proc mapNVowelToNy*(input: var Word) =
    input.replace(N_VOWEL_TO_NY_FIRST, "ny$1")
    input.replace(N_VOWEL_TO_NY_SECOND, "Ny$1")
    input.replace(N_VOWEL_TO_NY_THIRD, "NY$1")

proc mapOveToUv*(input: var Word) =
    input.replace(OVE_TO_UV_LOWER, "uv")
    input.replace(OVE_TO_UV_UPPER, "UV")

proc mapHahaToHeheXd*(input: var Word) =
    input.replace(HAHA_TO_HEHE_XD, "hehe xD")

proc mapTheToTeh*(input: var Word) =
    input.replace(THE_TO_TEH, "$1eh")

proc mapYouToU*(input: var Word) =
    input.replace(YOU_TO_U_UPPER, "U")
    input.replace(YOU_TO_U_LOWER, "u")

proc mapTimeToTim*(input: var Word) =
    input.replace(TIME_TO_TIM, "$1im")

proc mapOverToOwor*(input: var Word) =
    input.replace(OVER_TO_OWOR, "$1wor")

proc mapWorseToWose*(input: var Word) =
    input.replace(WORSE_TO_WOSE, "$1ose")

when defined(js):
  import std / options
  import std / jsre except match
      
  func customMatch*(pattern: cstring; self: RegExp): seq[cstring] {.importjs: "#.match(#) || []".}
  
  template re*(s: string): RegExp = newRegExp(cstring(s), r"ig")

  type
    Regex* = RegExp
    Match* = object
      captures*: seq[string]

  template findAll*(s: string, regex: Regex, n: int = 0): seq[string] =
    cstring(s).customMatch(regex).mapIt($it)

  template replace*(w: string, search: Regex, replaceValue: string): string =
    $jsre.replace(cstring(w), search, cstring(replaceValue))

  template find*(s: string, search: Regex): Option[Match] =
    some Match(captures: cstring(s).customMatch(search).mapIt($it))

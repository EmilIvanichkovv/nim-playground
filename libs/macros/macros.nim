import std/[macros]

macro dot*[T](obj: T, fld: string): untyped =
  ## Turn ``obj.dot("fld")`` into ``obj.fld``.
  newDotExpr(obj, newIdentNode(fld.strVal))


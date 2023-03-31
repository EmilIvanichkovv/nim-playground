import stew/results

type ResultFailure* = object of CatchableError

template `?!`*(T: typed): type Result[T, ref CatchableError] =
  ## Use `?!` make a Result type. These Result types either hold a value or
  ## an error. For example the type `?!int` is short for
  ## `Result[int, ref CatchableError]`.

  Result[T, ref CatchableError]

template `!`*[T](value: ?!T): T =
  ## Returns the value of a Result when you're absolutely sure that it
  ## contains value. Using `!` on a Result without a value raises a Defect.

  value.get

proc success*[T](value: T): ?!T =
  ## Creates a successfull Result containing the value.
  ##
  ok(?!T, value)

proc success*: ?!void =
  ## Creates a successfull Result without a value.

  ok(?!void)

proc failure*(T: type, error: ref CatchableError): ?!T =
  ## Creates a failed Result containing the error.

  err(?!T, error)

proc failure*(T: type, message: string): ?!T =
  ## Creates a failed Result containing a `ResultFailure` with the specified
  ## error message.

  T.failure newException(ResultFailure, message)

template failure*(error: ref CatchableError): auto =
  ## Creates a failed Result containing the error.

  err error

template failure*(message: string): auto =
  ## Creates a failed Result containing the error.

  failure newException(ResultFailure, message)

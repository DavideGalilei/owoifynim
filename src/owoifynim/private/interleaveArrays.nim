proc interleaveArrays*[T](a: openArray[T], b: openArray[T]): seq[T] =
    ## Helper function to interleave and combine a sequence of strings and a sequence of spaces.
    ## Returns an interleaved array.

    var minSeq = if a.len < b.len: @a else: @b
    var maxSeq = if a.len < b.len: @b else: @a

    for i in 0 ..< len(minSeq):
        result.add(minSeq[i])
        result.add(maxSeq[i])

    if minSeq.len != maxSeq.len:
        result &= maxSeq[len(minseq) ..< len(maxSeq)]

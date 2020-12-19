import Combine

public func promisify<Input0, Output0>(
  _ callbackBasedFunction: @escaping (Input0, @escaping (Output0) -> Void) -> ()
) -> (Input0) -> Future<Output0, Never> {
  return { input in
    return Future { promise in
      callbackBasedFunction(input, { output in
        promise(.success(output))
      })
    }
  }
}

public func promisify<Input0, Input1, Output0>(
  _ callbackBasedFunction: @escaping (Input0, Input1, @escaping (Output0) -> Void) -> ()
) -> (Input0, Input1) -> Future<Output0, Never> {
  return { input0, input1 in
    return Future { promise in
      callbackBasedFunction(input0, input1, { output in
        promise(.success(output))
      })
    }
  }
}

public func promisify<Input0, Input1, Input2, Output0>(
  _ callbackBasedFunction: @escaping (Input0, Input1, Input2, @escaping (Output0) -> Void) -> ()
) -> (Input0, Input1, Input2) -> Future<Output0, Never> {
  return { input0, input1, input2 in
    return Future { promise in
      callbackBasedFunction(input0, input1, input2, { output in
        promise(.success(output))
      })
    }
  }
}

public func promisify<Input0, Input1, Input2, Input3, Input4, Input5, Output0>(
  _ callbackBasedFunction: @escaping (Input0, Input1, Input2, Input3, Input4, Input5, @escaping (Output0) -> Void) -> ()
) -> (Input0, Input1, Input2, Input3, Input4, Input5) -> Future<Output0, Never> {
  return { input0, input1, input2, input3, input4, input5 in
    return Future { promise in
      callbackBasedFunction(input0, input1, input2, input3, input4, input5, { output in
        promise(.success(output))
      })
    }
  }
}

public func promisify<Input0, Input1, Input2, Input3, Input4, Input5, Input6, Output0>(
  _ callbackBasedFunction: @escaping (Input0, Input1, Input2, Input3, Input4, Input5, Input6, @escaping (Output0) -> Void) -> ()
) -> (Input0, Input1, Input2, Input3, Input4, Input5, Input6) -> Future<Output0, Never> {
  return { input0, input1, input2, input3, input4, input5, input6 in
    return Future { promise in
      callbackBasedFunction(input0, input1, input2, input3, input4, input5, input6, { output in
        promise(.success(output))
      })
    }
  }
}

public func promisify<Input0, Output0, Output1>(
  _ callbackBasedFunction: @escaping (Input0, @escaping (Output0, Output1) -> Void) -> ()
) -> (Input0) -> Future<(Output0, Output1), Never> {
  return { input in
    return Future { promise in
      callbackBasedFunction(input, { output0, output1 in
        promise(.success((output0, output1)))
      })
    }
  }
}

public func promisify<Input0, Output0, Output1, Output2>(
  _ callbackBasedFunction: @escaping (Input0, @escaping (Output0, Output1, Output2) -> Void) -> ()
) -> (Input0) -> Future<(Output0, Output1, Output2), Never> {
  return { input in
    return Future { promise in
      callbackBasedFunction(input, { output0, output1, output2 in
        promise(.success((output0, output1, output2)))
      })
    }
  }
}

public func promisify<Input0, Output0, Output1, Output2, Output3>(
  _ callbackBasedFunction: @escaping (Input0, @escaping (Output0, Output1, Output2, Output3) -> Void) -> ()
) -> (Input0) -> Future<(Output0, Output1, Output2, Output3), Never> {
  return { input in
    return Future { promise in
      callbackBasedFunction(input, { output0, output1, output2, output3 in
        promise(.success((output0, output1, output2, output3)))
      })
    }
  }
}

public func promisify<Input0, Output0, Output1, Output2, Output3, Output4>(
  _ callbackBasedFunction: @escaping (Input0, @escaping (Output0, Output1, Output2, Output3, Output4) -> Void) -> ()
) -> (Input0) -> Future<(Output0, Output1, Output2, Output3, Output4), Never> {
  return { input in
    return Future { promise in
      callbackBasedFunction(input, { output0, output1, output2, output3, output4 in
        promise(.success((output0, output1, output2, output3, output4)))
      })
    }
  }
}

public func promisify<Input0, Output0, Output1, Output2, Output3, Output4, Output5>(
  _ callbackBasedFunction: @escaping (Input0, @escaping (Output0, Output1, Output2, Output3, Output4, Output5) -> Void) -> ()
) -> (Input0) -> Future<(Output0, Output1, Output2, Output3, Output4, Output5), Never> {
  return { input in
    return Future { promise in
      callbackBasedFunction(input, { output0, output1, output2, output3, output4, output5 in
        promise(.success((output0, output1, output2, output3, output4, output5)))
      })
    }
  }
}

public func promisify<Input0, Output0, Output1, Output2, Output3, Output4, Output5, Output6>(
  _ callbackBasedFunction: @escaping (Input0, @escaping (Output0, Output1, Output2, Output3, Output4, Output5, Output6) -> Void) -> ()
) -> (Input0) -> Future<(Output0, Output1, Output2, Output3, Output4, Output5, Output6), Never> {
  return { input in
    return Future { promise in
      callbackBasedFunction(input, { output0, output1, output2, output3, output4, output5, output6 in
        promise(.success((output0, output1, output2, output3, output4, output5, output6)))
      })
    }
  }
}

public func promisify<Output>(
  _ callbackBasedFunction: @escaping (@escaping (Output) -> Void) -> Void
) -> () -> Future<Output, Never> {
  return {
    return Future { promise in
      callbackBasedFunction { output in
        promise(.success(output))
      }
    }
  }
}

import UIKit
import Combine

let _ = Just(42).sink { (value) in
  
  if value == 42 {
    print("The answer to life, the universe, and everything")
  } else {
    print("Sorry, wrong answer")
  }
}

enum FutureError: Error {
  case TookTooLong
}

func performLongRunningNetworkTask(completion: (Bool, Error?) -> ()) {
  // long running network code here
  // completion(true, nil)
  completion(false, FutureError.TookTooLong)
}

let futurePublisher = Future<Bool, Error> { promise in
  
  performLongRunningNetworkTask { (userValid, err) in
    if let err = err {
      return promise(.failure(err))
    }
    
    return promise(.success(userValid))
  }
}



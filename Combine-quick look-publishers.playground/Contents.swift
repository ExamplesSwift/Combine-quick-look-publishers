import UIKit
import Combine

let _ = Just(42).sink { (value) in
  
  if value == 42 {
    print("The answer to life, the universe, and everything")
  } else {
    print("Sorry, wrong answer")
  }
}


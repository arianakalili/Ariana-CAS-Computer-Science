  
  // This is a function that returns a String? (or Optional<String>). You'll use it below.
  func getFirstVowel(in name: String) -> String? {
    let vowels: [Character] = ["a", "e", "i", "o", "u", "y"]
    for char in name {
        if vowels.contains(char) {
            return String(char)
        }
    }
    return nil
  }
  
  
  let yourName = "ariana"
  
  //First Vowel
  let firstVowel = getFirstVowel(in: yourName)
  var unwrappedVowelOne: String = firstVowel!
  print("The first vowel in '\(yourName)' is '\(unwrappedVowelOne)!'.")
 
  //Second Vowel

  var unwrappedVowelTwo: String = (getFirstVowel (in: yourName) ?? "NO")
    print("The first vowel in '\(yourName)' is '\(unwrappedVowelTwo)!'.")
  
  
  //Third Vowel
  var unwrappedVowelThree: String
  if let unwrappedVowelThree = firstVowel{
  print("The first vowel in '\(yourName)' is '\(unwrappedVowelThree)!'.")
  }

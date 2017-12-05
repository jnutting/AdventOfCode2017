import Foundation

func isValidPassPhrase<S: StringProtocol>(_ phrase: S) -> Bool {
    let wordsSubSequences = phrase.split(separator: " ")
    let wordsStrings = wordsSubSequences.map { String($0) }
    let wordsSet = Set(wordsStrings)
    return wordsStrings.count == wordsSet.count
}

public func validPassPhraseCount(for allPassPhrases: String) -> Int {
    let passPhrases = allPassPhrases.split(separator: "\n")
    var validCount = 0

    for passPhrase in passPhrases {
        if isValidPassPhrase(passPhrase) {
            validCount += 1
        }
    }

    return validCount
}

import Foundation

func alphabetizeWord(_ word: String) -> String {
    return String(word.sorted())
}

private func isValidPassPhrase<S: StringProtocol>(_ phrase: S) -> Bool {
    let wordsSubSequences = phrase.split(separator: " ")
    let wordsStrings = wordsSubSequences.map { alphabetizeWord(String($0)) }
    let wordsSet = Set(wordsStrings)
    return wordsStrings.count == wordsSet.count
}

public func validPassPhraseCountWithoutAnagrams(for allPassPhrases: String) -> Int {
    let passPhrases = allPassPhrases.split(separator: "\n")
    var validCount = 0

    for passPhrase in passPhrases {
        if isValidPassPhrase(passPhrase) {
            validCount += 1
        }
    }

    return validCount
}

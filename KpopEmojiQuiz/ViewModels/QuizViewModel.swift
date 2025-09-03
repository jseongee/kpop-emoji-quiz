import SwiftUI

class QuizViewModel: ObservableObject {
    @Published private(set) var quizzes: [Quiz] = []
    @Published var currentIndex: Int = 0
    @Published var score: Int = 0
    @Published var userAnswer: String = ""
    @Published var showResult: Bool = false
    @Published var isCorrect: Bool? = nil

    var currentQuiz: Quiz? {
        guard currentIndex < quizzes.count else { return nil }
        return quizzes[currentIndex]
    }

    var isLastQuiz: Bool {
        return currentIndex == quizzes.count - 1
    }

    init() {
        loadQuizzes()
    }

    func loadQuizzes() {
        if let url = Bundle.main.url(forResource: "quizData", withExtension: "json"),
           let data = try? Data(contentsOf: url),
           let decoded = try? JSONDecoder().decode([Quiz].self, from: data) {
            self.quizzes = decoded
        }
    }

    func submitAnswer() {
        guard let quiz = currentQuiz else { return }

        if userAnswer.trimmingCharacters(in: .whitespacesAndNewlines) == quiz.answer {
            score += 1
            isCorrect = true
        } else {
            isCorrect = false
        }
        showResult = true
    }

    func nextQuiz() {
        if currentIndex + 1 < quizzes.count {
            currentIndex += 1
            userAnswer = ""
            isCorrect = nil
            showResult = false
        } else {
            // 게임 끝
        }
    }

    func restartQuiz() {
        currentIndex = 0
        score = 0
        userAnswer = ""
        isCorrect = nil
        showResult = false
    }
}

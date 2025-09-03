import SwiftUI

struct QuizView: View {
    @StateObject private var quizVM = QuizViewModel()

    var body: some View {
        NavigationStack {
            if let quiz = quizVM.currentQuiz {
                if quizVM.showResult, let isCorrect = quizVM.isCorrect {
                    ResultView(
                        quiz: quiz,
                        isCorrect: isCorrect,
                        isLastQuiz: quizVM.isLastQuiz,
                        onNext: {
                            quizVM.nextQuiz()
                        },
                        onRestart: {
                            quizVM.restartQuiz()
                        }
                    )
                } else {
                    VStack(spacing: 30) {
                        Text(quiz.question)
                            .font(.system(size: 50))

                        TextField("정답을 입력하세요.", text: $quizVM.userAnswer)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()

                        Button("제출") {
                            quizVM.submitAnswer()
                        }
                        .buttonStyle(.borderedProminent)

                        Text("점수: \(quizVM.score)")
                            .font(.headline)
                    }
                    .padding()
                    .navigationTitle("K-POP 이모지 퀴즈")
                }
            } else {
                Text("모든 문제를 풀었습니다.")
            }
        }
    }
}

#Preview {
    QuizView()
}

import SwiftUI

struct QuizView: View {
    @StateObject private var quizVM = QuizViewModel()

    var body: some View {
        NavigationStack {
            if quizVM.isFinished {
                VStack(spacing: 20) {
                    Text("게임 종료")
                        .font(.title)

                    Text("점수: \(quizVM.score)/\(quizVM.quizzes.count)")
                        .font(.headline)

                    Button("다시 시작") {
                        quizVM.reset()
                    }
                }
            } else if let quiz = quizVM.currentQuiz {
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
        }
    }
}

#Preview {
    QuizView()
}

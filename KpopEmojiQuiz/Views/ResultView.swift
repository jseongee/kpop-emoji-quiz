import SwiftUI

struct ResultView: View {
    let quiz: Quiz
    let isCorrect: Bool
    let isLastQuiz: Bool
    let onNext: () -> Void
    let onRestart: () -> Void

    var body: some View {
        VStack(spacing: 20) {
            Text(isCorrect ? "정답입니다." : "오답입니다.")
                .font(.title)
                .foregroundStyle(isCorrect ? .green : .red)

            Text("원래 가사: \(quiz.lyric)")
            Text("노래 제목: \(quiz.answer)")
            Text("가수: \(quiz.hint)")

            if isLastQuiz {
                Button("처음으로") {
                    onRestart()
                }
                .buttonStyle(.borderedProminent)
            } else {
                Button("다음 문제") {
                    onNext()
                }
                .buttonStyle(.borderedProminent)
            }
        }
        .padding()
    }
}

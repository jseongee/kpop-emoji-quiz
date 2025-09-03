import Foundation

struct Quiz: Codable {
    let id: Int
    let question: String // 이모지로 표현된 가사
    let lyric: String // 원래 가사
    let answer: String // 정답
    let hint: String // 가수
}

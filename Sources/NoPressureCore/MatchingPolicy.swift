import Foundation

public enum MatchingPolicy {
  public static let maxActiveMatches = 3
  public static let matchLifetimeDays = 7

  public static func canReceiveNewMatch(activeMatchCount: Int) -> Bool {
    activeMatchCount < maxActiveMatches
  }

  public static func expiresAt(createdAt: Date, calendar: Calendar = .current) -> Date? {
    calendar.date(byAdding: .day, value: matchLifetimeDays, to: createdAt)
  }

  public static func isExpired(createdAt: Date, now: Date, calendar: Calendar = .current) -> Bool {
    guard let expiration = expiresAt(createdAt: createdAt, calendar: calendar) else { return false }
    return now >= expiration
  }
}

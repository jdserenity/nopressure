import XCTest
@testable import NoPressureCore

final class MatchingPolicyTests: XCTestCase {
  func testCanReceiveNewMatchWhenBelowLimit() {
    XCTAssertTrue(MatchingPolicy.canReceiveNewMatch(activeMatchCount: 0))
    XCTAssertTrue(MatchingPolicy.canReceiveNewMatch(activeMatchCount: 2))
  }

  func testCannotReceiveNewMatchAtLimit() {
    XCTAssertFalse(MatchingPolicy.canReceiveNewMatch(activeMatchCount: 3))
    XCTAssertFalse(MatchingPolicy.canReceiveNewMatch(activeMatchCount: 4))
  }

  func testMatchExpiresExactlyAfterSevenDays() throws {
    var calendar = Calendar(identifier: .gregorian)
    calendar.timeZone = try XCTUnwrap(TimeZone(secondsFromGMT: 0))
    let createdAt = Date(timeIntervalSince1970: 1_700_000_000)
    let expiration = try XCTUnwrap(MatchingPolicy.expiresAt(createdAt: createdAt, calendar: calendar))
    let sixDaysLater = try XCTUnwrap(calendar.date(byAdding: .day, value: 6, to: createdAt))
    let sevenDaysLater = try XCTUnwrap(calendar.date(byAdding: .day, value: 7, to: createdAt))

    XCTAssertEqual(expiration, sevenDaysLater)
    XCTAssertFalse(MatchingPolicy.isExpired(createdAt: createdAt, now: sixDaysLater, calendar: calendar))
    XCTAssertTrue(MatchingPolicy.isExpired(createdAt: createdAt, now: sevenDaysLater, calendar: calendar))
  }
}

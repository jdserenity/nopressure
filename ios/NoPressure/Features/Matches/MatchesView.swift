import SwiftUI

struct MatchesView: View {
  var body: some View {
    NavigationStack {
      List {
        Section("Active Matches (Max 3)") {
          Text("No active matches yet")
            .foregroundStyle(.secondary)
        }
      }
      .navigationTitle("Matches")
    }
  }
}

#Preview {
  MatchesView()
}

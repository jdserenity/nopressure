import SwiftUI

struct ChatView: View {
  var body: some View {
    NavigationStack {
      List {
        Text("Messages appear here")
          .foregroundStyle(.secondary)
      }
      .navigationTitle("Chat")
    }
  }
}

#Preview {
  ChatView()
}

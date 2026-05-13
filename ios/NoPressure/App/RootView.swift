import SwiftUI

struct RootView: View {
  var body: some View {
    TabView {
      OnboardingView()
        .tabItem { Label("Start", systemImage: "person.crop.circle.badge.plus") }

      MatchesView()
        .tabItem { Label("Matches", systemImage: "heart") }

      ChatView()
        .tabItem { Label("Chat", systemImage: "message") }

      ProfileView()
        .tabItem { Label("Profile", systemImage: "person") }
    }
  }
}

#Preview {
  RootView()
}

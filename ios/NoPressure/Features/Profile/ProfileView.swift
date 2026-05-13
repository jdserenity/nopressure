import SwiftUI

struct ProfileView: View {
  var body: some View {
    NavigationStack {
      List {
        Section("Account") {
          Text("Profile setup pending")
          Text("Sign in with Apple pending")
        }
      }
      .navigationTitle("Profile")
    }
  }
}

#Preview {
  ProfileView()
}

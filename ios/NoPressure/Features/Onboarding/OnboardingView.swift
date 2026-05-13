import SwiftUI

struct OnboardingView: View {
  var body: some View {
    NavigationStack {
      VStack(alignment: .leading, spacing: 12) {
        Text("NoPressure")
          .font(.largeTitle.bold())
        Text("Low-pressure dates, fast real-world momentum.")
          .font(.headline)
          .foregroundStyle(.secondary)
        Spacer()
        Button("Continue") {}
          .buttonStyle(.borderedProminent)
      }
      .padding()
      .navigationTitle("Welcome")
    }
  }
}

#Preview {
  OnboardingView()
}

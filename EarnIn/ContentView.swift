//
//  ContentView.swift
//  EarnIn
//
//  Created by Ujval Shah on 4/10/26.
//

import SwiftUI

struct ContentView: View {
    @State private var showDisclosures = false

    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text("Get set up with Cash Out")
                .font(.largeTitle).bold()
                .foregroundStyle(.primary)
                .padding(.top, 16)

            VStack(alignment: .leading, spacing: 20) {
                FeatureRow(icon: "building.columns", title: "Connect your bank")
                FeatureRow(icon: "briefcase", title: "Confirm your job details")
                FeatureRow(icon: "dollarsign.circle", title: "Cash out with no mandatory fees")
            }

            Button {
                showDisclosures = true
            } label: {
                Text("View disclosures")
                    .font(.footnote).bold()
                    .padding(.horizontal, 14)
                    .padding(.vertical, 8)
                    .background(
                        Capsule().fill(Color(.systemGray6))
                    )
            }
            .buttonStyle(.plain)
            .padding(.top, 4)

            Spacer()
        }
        .padding(.horizontal, 24)
        .sheet(isPresented: $showDisclosures) {
            DisclosureSheetView()
                .presentationDetents([.fraction(0.8)])
                .presentationDragIndicator(.visible)
        }
    }
}

private struct FeatureRow: View {
    let icon: String
    let title: String

    var body: some View {
        HStack(alignment: .center, spacing: 12) {
            Circle()
                .fill(Color(.systemGray5))
                .frame(width: 32, height: 32)
                .overlay(
                    Image(systemName: icon)
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundStyle(.primary)
                )

            Text(title)
                .font(.headline)
                .foregroundStyle(.primary)

            Spacer(minLength: 0)
        }
    }
}

private struct DisclosureSheetView: View {
    @Environment(\ .dismiss) private var dismiss

    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Spacer()
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "xmark")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundStyle(.primary)
                        .padding(8)
                        .background(Circle().fill(Color(.systemGray5)))
                }
                .accessibilityLabel("Close")
            }
            .padding([.top, .horizontal])

            ScrollView {
                VStack(alignment: .leading, spacing: 12) {
                    Text("Disclosures")
                        .font(.title3).bold()
                    Text("Here you can include your disclosures content. This sheet can be dismissed by tapping the close button or dragging down.")
                        .font(.body)
                        .foregroundStyle(.secondary)
                }
                .padding()
            }
        }
        .interactiveDismissDisabled(false)
    }
}

#Preview {
    ContentView()
}

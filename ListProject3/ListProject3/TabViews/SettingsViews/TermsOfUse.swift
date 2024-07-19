//
//  TermsOfUse.swift
//  ListProject3
//
//  Created by Kyle Schang on 7/18/24.
//

import SwiftUI

struct TermsOfUse: View {
    var body: some View {
        List {
            
            Section {
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Welcome to Day Calculator. These Terms of Use govern your use of the Day Calculator mobile application (\"App\") provided by Sonnaz Group, LLC (\"we,\" \"us,\" or \"our\").")
                    
                    Text("1. Acceptance of Terms")
                    Text("By downloading, installing, or using the App, you agree to be bound by these Terms. If you disagree with any part of the terms, you may not use our App.")
                    
                    Text("2. Use of the App")
                    Text("You agree to use the App only for its intended purpose. You must not use the App in any way that causes, or may cause, damage to the App or impairment of the availability or accessibility of the App.")
                    
                    Text("3. Intellectual Property")
                    Text("The App and its original content, features, and functionality are owned by Sonnaz Group, LLC and are protected by international copyright, trademark, patent, trade secret, and other intellectual property or proprietary rights laws.")
                    
                    Text("4. Limitation of Liability")
                    Text("In no event shall Sonnaz Group, LLC, nor its directors, employees, partners, agents, suppliers, or affiliates, be liable for any indirect, incidental, special, consequential or punitive damages, including without limitation, loss of profits, data, use, goodwill, or other intangible losses, resulting from your access to or use of or inability to access or use the App.")
                    
                    Text("5. Changes")
                    Text("We reserve the right, at our sole discretion, to modify or replace these Terms at any time. If a revision is material, we will try to provide at least 30 days' notice prior to any new terms taking effect.")
                    
                    Text("6. Contact Us")
                    Text("If you have any questions about these Terms, please contact us at: [Your Contact Information]")
                    
                    Text("By using Day Calculator, you acknowledge that you have read these Terms of Use and agree to be bound by them.")
                }
                .font(.system(size: 14, weight: .regular))
            } footer: {
                HStack {
                    Spacer()
                    VStack(alignment: .center) {
                        Text("Sonnaz Group © 2023-2024. All Rights Reserved")
                        Text("Last Updated: July 18, 2024")
                    }
                    .font(.system(size: 10, weight: .regular))
                    Spacer()
                }
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Terms of Use")
                        .fontWeight(.semibold)
                }
            }
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
            
        }
    }
}

#Preview {
    TermsOfUse()
}

//
//  PrivacyPolicy.swift
//  ListProject3
//
//  Created by Kyle Schang on 7/18/24.
//

import SwiftUI

struct PrivacyPolicy: View {
    
    // MARK: - Dismiss
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        List {
          
            Section {
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Sonnaz Group, LLC (\"we,\" \"our,\" or \"us\") is committed to protecting your privacy. This Privacy Policy explains how we collect, use, disclose, and safeguard your information when you use our Day Calculator mobile application (\"App\").")
                    
                    Text("1. Information We Collect")
                    Text("We may collect information that you provide directly to us when using the App. This may include [specify types of data collected, e.g., dates entered, calculation results, etc.].")
                    
                    Text("2. How We Use Your Information")
                    Text("We use the information we collect to:")
                    Text("• Provide, maintain, and improve our App")
                    Text("• Respond to your comments, questions, and requests")
                    Text("• Analyze usage patterns and trends")
                    Text("• Send you technical notices and updates")
                    
                    Text("3. Sharing of Your Information")
                    Text("We do not sell, trade, or rent your personal information to third parties. We may share generic aggregated demographic information not linked to any personal identification information regarding visitors and users with our business partners and advertisers.")
                    
                    Text("4. Data Security")
                    Text("We implement appropriate technical and organizational measures to maintain the safety of your personal information. However, no method of transmission over the Internet or electronic storage is 100% secure.")
                    
                    Text("5. Your Choices")
                    Text("You can choose not to provide certain information, but this may limit your ability to use some features of our App.")
                    
                    Text("6. Changes to This Privacy Policy")
                    Text("We may update our Privacy Policy from time to time. We will notify you of any changes by posting the new Privacy Policy on this page and updating the \"Last Updated\" date.")
                    
                    Text("7. Children's Privacy")
                    Text("Our App is not intended for children under 13. We do not knowingly collect personal information from children under 13.")
                    
                    Text("8. Contact Us")
                    Text("If you have questions or concerns about this Privacy Policy, please contact us at: [Your Contact Information]")
                    
                    Text("By using Day Calculator, you agree to the collection and use of information in accordance with this Privacy Policy.")
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
                    Text("Privacy Policy")
                        .fontWeight(.semibold)
                }
            }
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
            
            
        }
        
    }
}

// MARK: - Preview
#Preview {
    PrivacyPolicy()
}

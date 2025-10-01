// © 2025 Ardyan - Pattern Matters. All rights reserved.

import SwiftUI

struct ContentView: View {
    
    let chatBars: [Chat] = [
        Chat(
            avatarImage: Image(.Avatar._2),
            name: "Jessica",
            message: "",
            messageCount: 0,
            voiceNoteDuration: "00:58",
            timestamp: "6:21 pm",
            isNewChat: true,
            isYourMove: false,
            isFavorite: true,
            isUnread: false
        ),
        Chat(
            avatarImage: Image(.Avatar._3),
            name: "Amanda",
            message: "Lol I love house music too",
            messageCount: 0,
            voiceNoteDuration: nil,
            timestamp: "6:21 pm",
            isNewChat: false,
            isYourMove: true,
            isFavorite: false,
            isUnread: true
        ),
        Chat(
            avatarImage: Image(.Avatar._4),
            name: "Sila",
            message: "You: I love the people there tbh, have you been?",
            messageCount: 0,
            voiceNoteDuration: nil,
            timestamp: "Wed",
            isNewChat: false,
            isYourMove: false,
            isFavorite: false,
            isUnread: false
        ),
        Chat(
            avatarImage: Image(.Avatar._5),
            name: "Marie",
            message: "Hahaha that's interesting, it does seem like people here are startin...",
            messageCount: 4,
            voiceNoteDuration: nil,
            timestamp: "6:21 pm",
            isNewChat: false,
            isYourMove: true,
            isFavorite: false,
            isUnread: true
        ),
        Chat(
            avatarImage: Image(.Avatar._4),
            name: "Jessica",
            message: "",
            messageCount: 0,
            voiceNoteDuration: "00:58",
            timestamp: "6:21 pm",
            isNewChat: false,
            isYourMove: true,
            isFavorite: false,
            isUnread: true
        )
    ]
    
    let yourTurnCards: [Card] = [
        Card(
            backgroundImage: Image(.Card._1),
            name: "Amanda",
            age: 22,
            question: "What is your most favorite childhood memory?",
            remainingTime: nil,
            isBlurred: true,
            isMoveMade: false
        ),
        Card(
            backgroundImage: Image(.Card._2),
            name: "Malte",
            age: 31,
            question: "What is the most important quality in friendships to you?",
            remainingTime: nil,
            isBlurred: true,
            isMoveMade: true
        ),
        Card(
            backgroundImage: Image(.Card._3),
            name: "Binghan",
            age: 28,
            question: "If you could choose to have one superpower, what would it be?",
            remainingTime: "16h",
            isBlurred: false,
            isMoveMade: false
        ),
    ]
    
    let navbarItems: [NavbarItem] = [
        .init(image: Image(.Navbar.cards), label: "Cards", isProfile: false, badgeCount: 10, isSelected: false),
        .init(image: Image(.Navbar.bonfire), label: "Bonfire", isProfile: false, badgeCount: nil, isSelected: false),
        .init(image: Image(.Navbar.matchesActive), label: "Matches", isProfile: false, badgeCount: nil, isSelected: true),
        .init(image: Image(.Avatar._5), label: "Matches", isProfile: true, badgeCount: nil, isSelected: false),
    ]
    
    var body: some View {
        ZStack {
            // BACKGROUND
            Image(.background)
                .resizable()
                .ignoresSafeArea()
                .overlay {
                    VStack {
                        Spacer()
                        
                        LinearGradient(colors: [
                            Color(hex: "#0B0D0E"),
                            Color(hex: "#0B0D0E").opacity(65),
                            Color(hex: "#0B0D0E").opacity(0),
                        ], startPoint: .bottom, endPoint: .top)
                    }
                }
            
            // MAIN SCREEN
            VStack(spacing: 0) {
                ZStack {
                    ScrollView(showsIndicators: false) {
                        VStack(spacing: 29) {
                            VStack(spacing: 20) {
                                HeaderView()
                                    .padding(.horizontal, 20)
                                
                                ScrollView(.horizontal, showsIndicators: false) {
                                    HStack(spacing: 15) {
                                        ForEach(Array(yourTurnCards.enumerated()), id: \.offset) { _, card in
                                            CardView(card)
                                        }
                                        CardView.MoreCard()
                                    }
                                    .padding(.leading, 20)
                                }
                            }
                            
                            VStack(spacing: 10) {
                                ChatTabMenuView()
                                
                                VStack {
                                    ForEach(Array(chatBars.enumerated()), id: \.offset) { index, chat in
                                        ChatView(data: chat)
                                    }
                                }
                            }
                            .padding(.horizontal, 20)
                            
                            Spacer()
                        }
                    }
                    
                    VStack {
                        Spacer()
                        LinearGradient(colors: [
                            Color(hex: "#050505"),
                            Color(hex: "#050505").opacity(0.8),
                            Color(hex: "#050505").opacity(0.65),
                            Color(hex: "#050505").opacity(0),
                        ], startPoint: .bottom, endPoint: .top)
                        .frame(height: 70)
                    }
                    .allowsHitTesting(false)
                    
                }
                
                // NAVBAR
                HStack {
                    ForEach(Array(navbarItems.enumerated()), id: \.offset) { index, item in
                        NavbarItemView(item)
                        
                        if index != navbarItems.count - 1 {
                            Spacer()
                        }
                    }
                }
                .frame(height: 80)
                .padding(.horizontal, 15)
                .frame(maxWidth: .infinity)
                .ignoresSafeArea()
                .background(token: .custom(hex: "#0F1115"))
                .overlay {
                    VStack {
                        Rectangle()
                            .fill(Color(hex: "#1E1E1E"))
                            .frame(height: 1)
                        
                        Spacer()
                    }
                }
            }
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}

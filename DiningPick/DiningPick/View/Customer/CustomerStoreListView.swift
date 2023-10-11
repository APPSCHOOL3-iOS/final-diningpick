//
//  CustomerStoreListView.swift
//  DiningPick
//
//  Created by 한현민 on 10/6/23.
//

import SwiftUI

struct CustomerStoreListView: View {
    
    @State private var isPresentingEditView = false
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
            NavigationStack {
                Text("현재 구독 중인 가게가 없어요.")
                    .opacity(0.4)
                
                    
                    .sheet(isPresented: $isPresentingEditView) {
                        NavigationStack {
                            CustomerStoreListEditView()
                                .navigationBarTitle("매장 찾기", displayMode: .inline)
                                .toolbar {
                                    ToolbarItem(placement: .topBarLeading) {
                                        Button("취소") {
                                            isPresentingEditView = false
                                        }
                                    }
                                    ToolbarItem(placement: .topBarTrailing) {
                                        Button("완료") {
                                            isPresentingEditView = false
                                        }
                                    }
                                }
                        }
                    }
                
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("로그아웃") {
                        dismiss()
                    }
                }
            }
            .navigationBarTitle("다이닝픽", displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("추가") {
                        isPresentingEditView = true
                    }
                }
            }
        }
    }
}

#Preview {
    CustomerStoreListView()
}

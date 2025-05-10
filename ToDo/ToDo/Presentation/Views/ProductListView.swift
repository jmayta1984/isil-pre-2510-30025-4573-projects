//
//  ProductListView.swift
//  ToDo
//
//  Created by Alumno on 9/05/25.
//

import SwiftUI

struct ProductListView: View {
    @State var showDetail = false

    var body: some View {
    
        NavigationStack {
            List {
                
            }
            .navigationTitle("To do")
            .toolbar {
                ToolbarItem {
                    Button(action: {
                        showDetail = true
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .frame(width: 30, height: 30)
                    }
                }
            }
            .sheet(isPresented: $showDetail) {
                Text("Detail")
            }
        }
    }
}

#Preview {
    ProductListView()
}

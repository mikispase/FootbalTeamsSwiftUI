//
//  ContentView.swift
//  FootballSwiftUI
//
//  Created by Dimitar Spasovski on 9/21/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = TeamsViewModel()
    private let audioManager = AudioManagerViewModel()
    var body: some View {
        NavigationView {
            ScrollView{
                LazyVStack(spacing:14) {
                    ForEach(viewModel.teams) { team in
                        TeamCardView(team: team) { selectedTeam in
                            audioManager.playback(selectedTeam)
                            viewModel.tooglePlayback(for: selectedTeam)
                        }
                    }.listStyle(.plain)
                }.padding(.top, 8)
            }
            .padding(.horizontal, 8)
            .navigationBarTitle(Text("Teams"))
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  TeamCardView.swift
//  FootballSwiftUI
//
//  Created by Dimitar Spasovski on 9/22/21.
//

import SwiftUI

struct TeamCardView: View {

    typealias ChantPlayBackHandler = (_ team:Team) -> Void
    
    let team:Team
    
    var handler:ChantPlayBackHandler
    
    var body: some View {
        VStack(alignment:.leading) {
            HStack(alignment:.top,spacing: 12){
                Image(team.id.badge)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                
                VStack(alignment: .leading, spacing: 6){
                    
                    Text(team.name)
                        .font(.system(size: 18, weight: .bold))
                     Text("Founded \(team.founded)")
                        .font(.system(size: 12, weight: .light))
                    Text("Current \(team.manager.job.rawValue) \(team.manager.name)")
                        .font(.system(size: 10, weight: .light))
                    Text(team.info)
                        .font(.system(size: 12, weight: .medium))
                }
                Spacer()
                
                Button {
                     handler(team)
                } label: {
                    Image(systemName: team.isPlaying ?  "pause.circle.fill" : "play.circle.fill")
                        .resizable()
                        .scaledToFit()
                }
                .frame(maxWidth:40,maxHeight: .infinity, alignment: .center)
                
            }
          
        }
      //  .modifier(TeamCardModifiers(teamType: team.id))
        .applyTeamCardStyle(teamType: team.id)
    }
}

struct TeamCardView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TeamCardView(team: Team.dummyData.first!,handler: { _ in  })
                .previewLayout(PreviewLayout.fixed(width: 400, height: 150))
                .padding()
            .previewDisplayName("Team Card Preview")
            TeamCardView(team: Team.dummyData.last!, handler: { _ in })
                .previewLayout(PreviewLayout.fixed(width: 400, height: 150))
                .padding()
                .previewDisplayName("Team Card Preview")
        }
    }
    
}

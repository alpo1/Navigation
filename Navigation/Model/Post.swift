//
//  Post.swift
//  Navigation
//
//  Created by Саша on 22.05.2022.
//

import UIKit

struct PostModel {
    var author: String
    var description: String?
    var image: String
    var likes: Int
    var views: Int
    
    static func makeMockModel() -> [PostModel] {
        var model = [PostModel]()
        
        model.append(PostModel(author: "Непутевые заметки-4", description: "Когда ты отец маленькой ракеты-кометы-ктулху-бафомета, найти супергеройские трусы, это большая находка. Может хоть они смогут выдержать мощь этого мета-ребенка", image: "1", likes: 1255, views: 4506))
        model.append(PostModel(author: "Непутевые заметки-3", description: "Турецкие базары очень байтят на покупку ненужных вещей и продуктов. Вашему вниманию представляю Артишок. Нафига он мне?", image: "2", likes: 350, views: 2789))
        model.append(PostModel(author: "Непутевые заметки-2", description: "Только те существа, что воистину любят тепло, готовы наслаждатся жарой", image: "3", likes: 3401, views: 5867))
        model.append(PostModel(author: "Непутевые заметки-1", description: "Ну что сказать, сезон черешни в этом году начался гораздо раньше. Спасибо Турции за это", image: "4", likes: 1345, views: 1986))
        
        return model
    }
}


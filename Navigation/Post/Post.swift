//
//  Post.swift
//  Navigation
//
//  Created by Саша on 22.05.2022.
//

import UIKit

struct PostModel {
    let author: String // Никнейм автора публикации
    var description: String? // Текст публикаци
    var image: UIImage // Имя картинки из каталога Assets.xcassets
    var likes: Int // количество лайков
    var views: Int // количество просмотров
}
    
var post1 = PostModel(author: "Непутевые заметки-4", description: "Когда ты отец маленькой ракеты-кометы-ктулху-бафомета, найти супергеройские трусы, это большая находка. Может хоть они смогут выдержать мощь этого мета-ребенка", image: UIImage(named: "01")!, likes: 1255, views: 4506)
var post2 = PostModel(author: "Непутевые заметки-3", description: "Турецкие базары очень байтят на покупку ненужных вещей и продуктов. Вашему вниманию представляю Артишок. Нафига он мне?", image: UIImage(named: "02")!, likes: 350, views: 2789)
       var post3 = PostModel(author: "Непутевые заметки-2", description: "Только те существа, что воистину любят тепло, готовы наслаждатся жарой", image: UIImage(named: "03")!, likes: 3401, views: 5867)
        var post4 = PostModel(author: "Непутевые заметки-1", description: "Ну что сказать, сезон черешни в этом году начался гораздо раньше. Спасибо Турции за это", image: UIImage(named: "04")!, likes: 1345, views: 1986)
        
var postsModel = [post1, post2, post3, post4]

//
//  Movie.swift
//  MovieInfo
//
//  Created by 모상현 on 2022/09/30.
//

import UIKit

protocol MovieDelegate: AnyObject{
    func update(index:Int, _ movie: Movie)
}

struct Movie {
    static var movieNum:Int = 0
    
    var movieNum:Int
    var movieImage: UIImage?
    var movieName: String
    var movieDescription: String
    
    init(movieImage:UIImage?,movieName:String,movieDescription:String){
        self.movieNum = Movie.movieNum
        self.movieImage = movieImage
        self.movieName = movieName
        self.movieDescription = movieDescription
        
        Movie.movieNum += 1
    }
}

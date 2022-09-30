//
//  MovieTableViewCell.swift
//  MovieInfo
//
//  Created by 모상현 on 2022/09/30.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    var movieData: Movie? {
        didSet{
            guard var movieData = movieData else {return}
            movieImage.image = movieData.movieImage
            movieName.text = movieData.movieName
            movieDescription.text = movieData.movieDescription
        }
    }
    
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var movieDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        컴포넌트디자인()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func 컴포넌트디자인(){
        movieImage.clipsToBounds = true
        movieImage.layer.cornerRadius = movieImage.frame.width / 2
    }
    

}

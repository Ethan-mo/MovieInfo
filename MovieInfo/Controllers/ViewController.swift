//
//  ViewController.swift
//  MovieInfo
//
//  Created by 모상현 on 2022/09/30.
//

import UIKit

class ViewController: UIViewController {

    var dataManager = DataManager()
    
    
    @IBOutlet weak var tableVIew: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        데이터불러오기()
        테이블뷰확장설정()
    }

    
    func 데이터불러오기(){
        dataManager.makeMovieData()
        tableVIew.reloadData()
    }
    
    func 테이블뷰확장설정(){
        tableVIew.delegate = self
        tableVIew.dataSource = self
    }
    
    
    @IBAction func addMovieDataBtn(_ sender: UIBarButtonItem) {
        dataManager.addMovieData(Movie(movieImage: UIImage(named: "spiderman2.png"), movieName: "새 영화", movieDescription: "내용을 입력해주세요."))
        tableVIew.reloadData()
    }
    
    
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataManager.getMovieData().count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieTableViewCell
        cell.movieData = dataManager.getMovieData()[indexPath.row]
        cell.selectionStyle = .none
        return cell
    }
}
extension ViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toDetail", sender: indexPath)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail"{
            let detailVC = segue.destination as! DetailViewController
            let indexPath = sender as! IndexPath
            detailVC.movieData = dataManager.getMovieData()[indexPath.row]
        }
    }
}

extension ViewController: MovieDelegate{
    func update(index: Int, _ movie: Movie) {
        dataManager.updateMovieData(index: index, movie)
        tableVIew.reloadData()
    }
}

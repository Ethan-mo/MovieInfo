//
//  DataManager.swift
//  MovieInfo
//
//  Created by 모상현 on 2022/09/30.
//

import UIKit
class DataManager{
    
    var movieArray: [Movie] = []
    
    func getMovieData() -> [Movie]{
        return movieArray
    }
    func makeMovieData(){
        movieArray = [
            Movie(movieImage:UIImage(named: "batman.png"),movieName: "배트맨",movieDescription: "1939년에 최초 등장한 DC 코믹스의 슈퍼히어로 캐릭터로 배트맨 시리즈의 주인공. 슈퍼맨, 원더우먼과 함께 DC 트리니티라 불리며 슈퍼히어로와 영웅의 대명사와도 같은 캐릭터로 자리매김하고 있다."),
            Movie(movieImage:UIImage(named: "blackpanther.png"),movieName: "블랙팬서",movieDescription: "블랙 팬서(Black Panther)는 마블 코믹스의 슈퍼히어로 캐릭터다."),
            Movie(movieImage:UIImage(named: "captain.png"),movieName: "캡틴 아메리카",movieDescription: "마블 코믹스의 등장인물. 현재 이명은 캡틴 아메리카. 캡틴 아메리카의 '캡틴'은 초창기 코믹스에서는 말 그대로 미국의 대장이라는 뉘앙스로 쓰였으나, 시간이 흘러 역사적, 군사적인 요소가 캐릭터에게 추가되면서 미합중국 육군 장교 계급으로서의 '대위'의 의미를 함께 띄는 모습으로 변했다."),
            Movie(movieImage:UIImage(named: "doctorstrange.png"),movieName: "닥터스트레인지",movieDescription: "마블 코믹스의 등장인물로 사이키델릭 문화를 기반으로 올더스 헉슬리의 인식의 문과 DC 코믹스의 닥터 페이트의 영향을 받아 탄생한 캐릭터이다. 세계관 내의 최강의 마법사로, 통칭 소서러 슈프림. 마블 코믹스에서 미스터리 분야를 대변하는 존재이다."),
            Movie(movieImage:UIImage(named: "guardians.png"),movieName: "가디언즈 오브 갤럭시",movieDescription: "21세기 현대 팀. 우주의 자경단으로 범우주적 위협에 대항해서 싸운다. 노바 군단이 경찰이라면 이쪽은 자경단이라는 이미지가 강하다."),
            Movie(movieImage:UIImage(named: "hulk.png"),movieName: "헐크",movieDescription: "감마폭탄을 제작하던 브루스 배너 박사가 감마폭탄 제작 과정의 폭발 사고로 인해 감마선에 노출되어 그 영향으로 분노하면[4] 괴력의 녹색 거인으로 변신하는 능력을 지니게 되어 이 변신한 모습은 '헐크' 라고 불리게 되었다."),
            Movie(movieImage:UIImage(named: "ironman.png"),movieName: "아이언맨",movieDescription: "억만장자 천재 발명가인 토니 스타크가 심장에 치명적인 상처를 입은 자신의 목숨을 지키며 동시에 세계를 지킬 강화 슈트를 제작하고 과학의 결정체로 만들어진 슈트를 입고 아이언맨이 되어 범죄와 싸워나간다."),
            Movie(movieImage:UIImage(named: "spiderman.png"),movieName: "스파이더맨",movieDescription: "마블 코믹스의 등장인물. 본명은 피터 파커. 스탠 리, 스티브 딧코 콤비가 만들었으며, 스탠 리가 자식처럼 아꼈던 캐릭터. 첫 등장은 1962년 8월 발간된 어메이징 판타지(Amazing Fantasy) 15호로, 코믹스 최초의 단독 주인공 10대 히어로이다.")            
        ]
    }
    func addMovieData(_ movie:Movie){
        movieArray.append(movie)
    }
    func updateMovieData(index:Int,_ movie:Movie){
        movieArray[index] = movie
    }
}

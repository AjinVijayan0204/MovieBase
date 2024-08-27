//
//  MovieRepositoryImplUnitTest.swift
//  MovieBaseTests
//
//  Created by Ajin on 26/08/24.
//

import XCTest
@testable import MovieBase

final class MovieRepositoryImplUnitTest: XCTestCase{
    
    let movieRepositoryImpl = MovieReposImpl(dataSource: MockAPIImpl(), localDataSource: MockDataSourcesImpl())
    
    func testGetMovies(){
        Task{
            let result = await movieRepositoryImpl.getMovies(.topRated, page: 0)
            switch result {
            case .success(let movies):
                XCTAssertTrue(movies.count != 0)
                XCTAssertTrue(movies.count == 6)
            case .failure(let failure):
                XCTAssertTrue(((failure as? MovieBaseErrors) != nil))
            }
        }
    }
    
    func testGetMovieDetails(){
        Task{
            let result = await movieRepositoryImpl.getDetail(.movieDetail(id: 0))
            switch result{
            case .success(let movieDetail):
                XCTAssertEqual(movieDetail.movieId, 0)
            case .failure(let error):
                XCTAssertTrue(((error as? MovieBaseErrors) != nil))
            }
        }
    }
}

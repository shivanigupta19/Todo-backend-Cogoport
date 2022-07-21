# $data = [
#             {
#                 "user_id" => "hkbkbjbmmouityr",
#                 "user_name" => "John",
#             },
#             {
#                 "user_id" => "ewerxgvjknkjlj",
#                 "user_name" => "Bella",
#             },
#             {
#                 "user_id" => "opiopghcgfcfxgf",
#                 "user_name" => "Sandy",
#             },
#             {
#                 "user_id" => "qreetuygjhbbnbm",
#                 "user_name" => "Daisy",
#             }
#         ]

class MoviesController < ActionController::Base
    skip_before_action :verify_authenticity_token

    def movies
        limit = params[:limit]
        # data = ["Lord of the Rings","Harry potter"]
        render :json => $data
    end
    
    def singleMovie
        id = params[:id].to_i
        if id > 0 and id <= Movie.count
            res = Movie.find(id)
        else
            res = "Not found"
        end
        render:json => res
    end

    def limitMovie
        
    end

    # get all movies
    def getAllMovie
        render :json => Movie.all
    end

    # create new movie
    def createMovie
        movieItem = {
            "title" => params[:title],
            "year" => params[:year],
            "description" => params[:description]
        }
        movie = Movie.new(movieItem)
        movie.save
        render :json => movie
    end

    # delete a movie
    def deleteMovie
        id = params[:id].to_i
        if id > 0 and id <= Movie.count
            res = Movie.find(id)
            Movie.delete(res)
        end
        render:json => Movie.all
    end

    # update a movie
    def updateMovie
        res = Movie.find(params[:id].to_i)
        res.update(
            "title" => params[:title],
            "year" => params[:year],
            "description" => params[:description]
        )
        render :json => res
    end
end
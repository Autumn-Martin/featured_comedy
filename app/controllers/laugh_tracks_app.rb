class LaughTracksApp < Sinatra::Base
  get '/comedians' do
    if params[:age]
      @comedians = Comedian.where(age: params[:age])
    else
      @comedians = Comedian.all
    end
    @average_age = Comedian.average_age
    erb :"comedians/index"
  end
end

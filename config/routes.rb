Rails.application.routes.draw do

  get '/keyboard' => 'api#api_init'
  post '/message' => 'api#api_message'


#for kakao_api


  get '/admin' => 'admin#select_model' #for admin page
  
  get '/admin/caffeine' => 'admin#cafe_list'
  get '/admin/korea' => 'admin#korea_list'
  get '/admin/china' => 'admin#china_list'
  get '/admin/japan' => 'admin#japan_list'
  get '/admin/europe' => 'admin#europe_list'
  get '/admin/flour' => 'admin#flour_list'
  get '/admin/meat' => 'admin#meat_list'
  get '/admin/chicken' => 'admin#chicken_list'
  get '/admin/alcohol' => 'admin#alcohol_list'    #listing each models
  


end

Rails.application.routes.draw do
  
  ##########################for kakao api################################

  get '/keyboard' => 'api#api_init'
  post '/message' => 'api#api_message'


  ##########################for model data###############################


  get '/admin' => 'admin#select_model' #for admin page
  
  get '/admin/cafe' => 'admin#cafe_list'
  get '/admin/korea' => 'admin#korea_list'
  get '/admin/china' => 'admin#china_list'
  get '/admin/japan' => 'admin#japan_list'
  get '/admin/europe' => 'admin#europe_list'
  get '/admin/flour' => 'admin#flour_list'
  get '/admin/meat' => 'admin#meat_list'
  get '/admin/chicken' => 'admin#chicken_list'
  get '/admin/alcohol' => 'admin#alcohol_list'    #listing each models
  
  post '/admin/cafe/add' => 'admin#cafe_add'
  post '/admin/korea/add' => 'admin#korea_add'
  post '/admin/china/add' => 'admin#china_add'
  post '/admin/japan/add' => 'admin#japan_add'
  post '/admin/europe/add' => 'admin#europe_add'
  post '/admin/flour/add' => 'admin#flour_add'
  post '/admin/meat/add' => 'admin#meat_add'
  post '/admin/chicken/add' => 'admin#chicken_add'
  post '/admin/alcohol/add' => 'admin#cafe_add'   #add model data 
  
    
  
  
  
  
  
  
  


end

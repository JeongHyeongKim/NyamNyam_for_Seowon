Rails.application.routes.draw do
  
  ##########################for kakao api################################

  get '/keyboard' => 'api#api_init'
  post '/message' => 'api#api_message'


  ##########################for model data###############################


  get '/admin' => 'admin#select_model' #for admin page
  
  get '/admin/cafe' => 'admin#cafe_list'
  get '/admin/snack' => 'admin#snack_list'
  get '/admin/korea' => 'admin#korea_list'
  get '/admin/china' => 'admin#china_list'
  get '/admin/japan' => 'admin#japan_list'
  get '/admin/europe' => 'admin#europe_list'
  get '/admin/flour' => 'admin#flour_list'
  get '/admin/meat' => 'admin#meat_list'
  get '/admin/chicken' => 'admin#chicken_list'
  get '/admin/alcohol' => 'admin#alcohol_list'    #listing each models
  
  post '/admin/cafe/add' => 'admin#cafe_add'
  post '/admin/snack/add' => 'admin#snack_add'
  post '/admin/korea/add' => 'admin#korea_add'
  post '/admin/china/add' => 'admin#china_add'
  post '/admin/japan/add' => 'admin#japan_add'
  post '/admin/europe/add' => 'admin#europe_add'
  post '/admin/flour/add' => 'admin#flour_add'
  post '/admin/meat/add' => 'admin#meat_add'
  post '/admin/chicken/add' => 'admin#chicken_add'
  post '/admin/alcohol/add' => 'admin#alcohol_add'   #add model data 
  
  
  get '/admin/cafe_destroy_one/:post_id' => 'admin#cafe_destroy_one'
  get '/admin/snack_destroy_one/:post_id' => 'admin#snack_destroy_one'
  get '/admin/korea_destroy_one/:post_id' => 'admin#korea_destroy_one'
  get '/admin/china_destroy_one/:post_id' => 'admin#china_destroy_one'
  get '/admin/japan_destroy_one/:post_id' => 'admin#japan_destroy_one'
  get '/admin/europe_destroy_one/:post_id' => 'admin#europe_destroy_one'
  get '/admin/flour_destroy_one/:post_id' => 'admin#flour_destroy_one'
  get '/admin/meat_destroy_one/:post_id' => 'admin#meat_destroy_one'
  get '/admin/chicken_destroy_one/:post_id' => 'admin#chicken_destroy_one'
  get '/admin/alcohol_destroy_one/:post_id' => 'admin#alcohol_destroy_one'    ##delete one data
  
  
  get 'admin/cafe_edit/:post_id' => 'admin#cafe_edit'
  get 'admin/korea_edit/:post_id' => 'admin#korea_edit'
  get 'admin/snack_edit/:post_id' => 'admin#snack_edit'
  get 'admin/japan_edit/:post_id' => 'admin#japan_edit'
  get 'admin/china_edit/:post_id' => 'admin#china_edit'
  get 'admin/europe_edit/:post_id' => 'admin#europe_edit'
  get 'admin/flour_edit/:post_id' => 'admin#flour_edit'
  get 'admin/meat_edit/:post_id' => 'admin#meat_edit'
  get 'admin/chicken_edit/:post_id' => 'admin#chicken_edit'
  get 'admin/alcohol_edit/:post_id' => 'admin#alcohol_edit'      ##edit one data
  
  
  post 'admin/cafe_update/:post_id' => 'admin#cafe_update'
  post 'admin/korea_update/:post_id' => 'admin#korea_update'
  post 'admin/snack_update/:post_id' => 'admin# snack_update'
  post 'admin/japan_update/:post_id' => 'admin#japan_update'
  post 'admin/china_update/:post_id' => 'admin#china_update'
  post 'admin/europe_update/:post_id' => 'admin#europe_update'
  post 'admin/flour_update/:post_id' => 'admin#flour_update'
  post 'admin/meat_update/:post_id' => 'admin#meat_update'
  post 'admin/chicken_update/:post_id' => 'admin#chicken_update'
  post 'admin/alcohol_update/:post_id' => 'admin#alcohol_update'     ##update one data
  
  get 'admin/cafe_destroy_all' => 'admin#cafe_destroy_all'
  get 'admin/snack_destroy_all' => 'admin#snack_destroy_all'
  get 'admin/korea_destroy_all' => 'admin#koera_destroy_all'
  get 'admin/japan_destroy_all' => 'admin#japan_destroy_all'
  get 'admin/china_destroy_all' => 'admin#china_destroy_all'
  get 'admin/europe_destroy_all' => 'admin#europe_destroy_all'
  get 'admin/flour_destroy_all' => 'admin#flour_destroy_all'
  get 'admin/meat_destroy_all' => 'admin#meat_destroy_all'
  get 'admin/chicken_destroy_all' => 'admin#chicken_destroy_all'
  get 'admin/alcohol_destroy_all' => 'admin#alcohol_destroy_all'
  
  
    
  
  
  
  
  
  
  


end

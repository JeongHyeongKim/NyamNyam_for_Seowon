Rails.application.routes.draw do
  
  ##########################for kakao api################################

  get '/keyboard' => 'api#api_init'
  post '/message' => 'api#api_message'


  ##########################for model data###############################


  get '/admin/bob' => 'admin#bob_list'
  get '/admin/dessert' => 'admin#dessert_list'
  get '/admin/alcohol' => 'admin#alcohol_list'    #listing each models
  
  post '/admin/bob/add' => 'admin#bob_add'
  post '/admin/dessert/add' => 'admin#dessert_add'
  post '/admin/alcohol/add' => 'admin#alcohol_add'   #add model data 
  

  
  get '/admin/bob_destroy_one/:post_id' => 'admin#bob_destroy_one'
  get '/admin/dessert_destroy_one/:post_id' => 'admin#dessert_destroy_one'
  get '/admin/alcohol_destroy_one/:post_id' => 'admin#alcohol_destroy_one'    ##delete one data
  
  
  get 'admin/bob_edit/:post_id' => 'admin#bob_edit'
  get 'admin/dessert_edit/:post_id' => 'admin#dessert_edit'
  get 'admin/alcohol_edit/:post_id' => 'admin#alcohol_edit'      ##edit one data
  
  
  post 'admin/bob_update/:post_id' => 'admin#bob_update'
  post 'admin/dessert_update/:post_id' => 'admin#dessert_update'
  post 'admin/alcohol_update/:post_id' => 'admin#alcohol_update'     ##update one data
  
  get 'admin/bob_destroy_all' => 'admin#bob_destroy_all'
  get 'admin/dessert_destroy_all' => 'admin#dessert_destroy_all'
  get 'admin/alcohol_destroy_all' => 'admin#alcohol_destroy_all'
  
  
end

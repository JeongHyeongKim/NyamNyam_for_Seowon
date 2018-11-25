class AdminController < ApplicationController
    
    # 현재 만든 버튼 : 알콜, 꼬꼬, 고기, 양식, 분식, 일식, 한식, 중식

    def select_model #초기화면
    end
    
    ###############################for listing data##################################
    
    def bob_list
        @bob=Bob.all
    end
    
    def dessert_list
        @dessert=Dessert.all
    end
    
    def alcohol_list
        @alcohol=Alcohol.all
    end
    
    
    ###############################for adding data###################################
    
    def bob_add
        @bob=Bob.new
        @bob.name=params[:name]
        @bob.photo_url=params[:photo_url]
        @bob.detail_url=params[:detail_url]
        @bob.open_time=params[:open_time]
        @bob.category=params[:category]
        @bob.contact=params[:contact]
        @bob.save
        redirect_to '/admin/bob'
    end
    
    def dessert_add
        @dessert=Dessert.new
        @dessert.name=params[:name]
        @dessert.photo_url=params[:photo_url]
        @dessert.detail_url=params[:detail_url]
        @dessert.open_time=params[:open_time]
        @dessert.contact=params[:contact]
        @dessert.save
        redirect_to '/admin/dessert'
    end

    def alcohol_add
        @alcohol=Alcohol.new
        @alcohol.name=params[:name]
        @alcohol.photo_url=params[:photo_url]
        @alcohol.detail_url=params[:detail_url]
        @alcohol.open_time=params[:open_time]
        @alcohol.category=params[:category]
        @alcohol.contact=params[:contact]
        @alcohol.save
        redirect_to '/admin/alcohol'
    end
    
    ###############################destroy 1 data###################################
    
    
    def bob_destroy_one
        @what_delete=Bob.find(params[:post_id])
        @what_delete.destroy
        redirect_to '/admin/bob'
    end
    
    def dessert_destroy_one
        @what_delete=Dessert.find(params[:post_id])
        @what_delete.destroy
        redirect_to '/admin/dessert'
    end

    def alcohol_destroy_one
        @what_delete=Alcohol.find(params[:post_id])
        @what_delete.destroy
        redirect_to '/admin/alcohol'
    end
    
    ###############################edit data###################################
    def bob_edit
        @bob=Bob.all
        @data=Bob.find(params[:post_id])
    end
    
    def dessert_edit
        @dessert=Dessert.all
        @data=Dessert.find(params[:post_id])
    end
    
    def alcohol_edit
        @alcohol=Alcohol.all
        @data=Alcohol.find(params[:post_id])
    end
    
    ###############################edit data###################################
    def bob_update
        @data=Bob.find(params[:post_id])
        @data.name=params[:name]
        @data.photo_url=params[:photo_url]
        @data.detail_url=params[:detail_url]
        @data.open_time=params[:open_time]
        @data.category=params[:category]
        @data.contact=params[:contact]
        @data.save
        redirect_to '/admin/bob'
    end
    
    def dessert_update
        @data=Dessert.find(params[:post_id])
        @data.name=params[:name]
        @data.photo_url=params[:photo_url]
        @data.detail_url=params[:detail_url]
        @data.open_time=params[:open_time]
        @data.contact=params[:contact]
        @data.save
        redirect_to '/admin/dessert'
    end
    
    def alcohol_update
        @data=Alcohol.find(params[:post_id])
        @data.name=params[:name]
        @data.photo_url=params[:photo_url]
        @data.detail_url=params[:detail_url]
        @data.open_time=params[:open_time]
        @data.category=params[:category]
        @data.contact=params[:contact]
        @data.save
        redirect_to '/admin/alcohol'
    end
    
    ########################################destroy all data####################################
    


end



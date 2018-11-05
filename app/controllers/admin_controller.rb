class AdminController < ApplicationController
    
    # 현재 만든 버튼 : 알콜, 꼬꼬, 고기, 양식, 분식, 일식, 한식, 중식

    def select_model #초기화면
    end
    
    ###############################for listing data##################################
    
    def cafe_list
        @cafe=Caffeine.all
    end
    
    def snack_list
        @snack=Snack.all
    end
    
    def korea_list
        @korea=Korea.all
    end
    
    def china_list
        @china=China.all
    end

    def japan_list
        @japan=Japan.all
    end
    
    def europe_list
        @europe=Europe.all
    end
    
    def flour_list
        @flour=Flour.all
    end
    
    def meat_list
        @meat=Meat.all
    end
    
    def chicken_list
        @chicken=Chicken.all
    end
    
    def alcohol_list
        @alcohol=Alcohol.all
    end
    
    
    ###############################for adding data###################################
    
    def cafe_add
        @cafe=Caffeine.new
        @cafe.name=params[:name]
        @cafe.photo_url=params[:photo_url]
        @cafe.detail_url=params[:detail_url]
        @cafe.save
        redirect_to '/admin/cafe'
    end
    
    def snack_add
    end
    
    def korea_add
    end
    
    def japan_add
    end
    
    def china_add
    end
    
    def europe_add
<<<<<<< HEAD
        @europe=Europe.new
        @europe.name=params[:name]
        @europe.photo_url=params[:photo_url]
        @europe.detail_url=params[:detail_url]
        @europe.open_time=params[:open_time]
        @europe.location=params[:location]
        @europe.save
        redirect_to '/admin/europe'
=======
>>>>>>> parent of 0b71f24... 20181101v1
    end
    
    def flour_add
    end
    
    def meat_add
    end
    
    def chicken_add
    end
    
    def alcohol_add
    end
    
    
    
<<<<<<< HEAD
    def cafe_destroy_one
        @what_delete=Caffeine.find(params[:post_id])
        @what_delete.destroy
        redirect_to '/admin/cafe'
    end
    
    def snack_destroy_one
        @what_delete=Snack.find(params[:post_id])
        @what_delete.destroy
        redirect_to '/admin/snack'
    end
    
    def korea_destroy_one
        @what_delete=Korea.find(params[:post_id])
        @what_delete.destroy
        redirect_to '/admin/korea'
    end
    
    def japan_destroy_one
        @what_delete=Japan.find(params[:post_id])
        @what_delete.destroy
        redirect_to '/admin/japan'
    end
    
    def china_destroy_one
        @what_delete=China.find(params[:post_id])
        @what_delete.destroy
        redirect_to '/admin/china'
    end
    
    def europe_destroy_one
        @what_delete=Europe.find(params[:post_id])
        @what_delete.destroy
        redirect_to '/admin/europe'
    end
    
    def flour_destroy_one
        @what_delete=Flour.find(params[:post_id])
        @what_delete.destroy
        redirect_to '/admin/flour'
    end
    
    def meat_destroy_one
        @what_delete=Meat.find(params[:post_id])
        @what_delete.destroy
        redirect_to '/admin/meat'
    end
    
    def chicken_destroy_one
        @what_delete=Chicken.find(params[:post_id])
        @what_delete.destroy
        redirect_to '/admin/chicken'
    end
    
    def alcohol_destroy_one
        @what_delete=Alcohol.find(params[:post_id])
        @what_delete.destroy
        redirect_to '/admin/alcohol'
    end
    
    ###############################edit data###################################
    def cafe_edit
        @cafe=Caffeine.all
        @data=Caffeine.find(params[:post_id])
    end
    
    def snack_edit
        @snack=Snack.all
        @data=Snack.find(params[:post_id])
    end
    
    def korea_edit
        @korea=Korea.all
        @data=Korea.find(params[:post_id])
    end
    
    def japan_edit
        @japan=Japan.all
        @data=Japan.find(params[:post_id])
    end
    
    def china_edit
        @china=China.all
        @data=China.find(params[:post_id])
    end
    
    def europe_edit
        @europe=Europe.all
        @data=Europe.find(params[:post_id])
    end
    
    def flour_edit
        @flour=Flour.all
        @data=Flour.find(params[:post_id])
    end
    
    def meat_edit
        @meat=Meat.all
        @data=Meat.find(params[:post_id])
    end
    
    def chicken_edit
        @chicken=Chicken.all
        @data=Chicken.find(params[:post_id])
    end
    
    def alcohol_edit
        @alcohol=Alcohol.all
        @data=Alcohol.find(params[:post_id])
    end
    
    ###############################edit data###################################
    def cafe_update
        @data=Caffeine.find(params[:post_id])
        @data.name=params[:name]
        @data.photo_url=params[:photo_url]
        @data.detail_url=params[:detail_url]
        @data.open_time=params[:open_time]
        @data.location=params[:location]
        @data.save
        redirect_to '/admin/cafe'
    end
    
    def snack_update
        @data=Snack.find(params[:post_id])
        @data.name=params[:name]
        @data.photo_url=params[:product]
        @data.detail_url=params[:detail_url]
        @data.open_time=params[:open_time]
        @data.location=params[:location]
        @data.save
        redirect_to '/admin/snack'
    end
    
    def korea_update
        @data=Korea.find(params[:post_id])
        @data.name=params[:name]
        @data.photo_url=params[:product]
        @data.detail_url=params[:detail_url]
        @data.open_time=params[:open_time]
        @data.location=params[:location]
        @data.save
        redirect_to '/admin/korea'
    end
    
    def japan_update
        @data=Japan.find(params[:post_id])
        @data.name=params[:name]
        @data.photo_url=params[:product]
        @data.detail_url=params[:detail_url]
        @data.open_time=params[:open_time]
        @data.location=params[:location]
        @data.save
        redirect_to '/admin/japan'
    end
    
    def china_update
        @data=China.find(params[:post_id])
        @data.name=params[:name]
        @data.photo_url=params[:product]
        @data.detail_url=params[:detail_url]
        @data.open_time=params[:open_time]
        @data.location=params[:location]
        @data.save
        redirect_to '/admin/china'
    end
    
    def europe_update
        @data=Europe.find(params[:post_id])
        @data.name=params[:name]
        @data.photo_url=params[:product]
        @data.detail_url=params[:detail_url]
        @data.open_time=params[:open_time]
        @data.location=params[:location]
        @data.save
        redirect_to '/admin/europe'
    end
    
    def flour_update
        @data=Flour.find(params[:post_id])
        @data.name=params[:name]
        @data.photo_url=params[:product]
        @data.detail_url=params[:detail_url]
        @data.open_time=params[:open_time]
        @data.location=params[:location]
        @data.save
        redirect_to '/admin/flour'
    end
    
    def meat_update
        @data=Meat.find(params[:post_id])
        @data.name=params[:name]
        @data.photo_url=params[:product]
        @data.detail_url=params[:detail_url]
        @data.open_time=params[:open_time]
        @data.location=params[:location]
        @data.save
        redirect_to '/admin/meat'
    end
    
    def chicken_update
        @data=Chicken.find(params[:post_id])
        @data.name=params[:name]
        @data.photo_url=params[:product]
        @data.detail_url=params[:detail_url]
        @data.open_time=params[:open_time]
        @data.location=params[:location]
        @data.save
        redirect_to '/admin/chicken'
    end
    
    def alcohol_update
        @data=Alcohol.find(params[:post_id])
        @data.name=params[:name]
        @data.photo_url=params[:product]
        @data.detail_url=params[:detail_url]
        @data.open_time=params[:open_time]
        @data.location=params[:location]
        @data.save
        redirect_to '/admin/alcohol'
    end
    
    ########################################destroy all data####################################
    
    def cafe_destroy_all
        @Cafe.destroy_all
        redirect_to '/admin/cafe'
    end
    
    def snack_destroy_all
        @Snack.destroy_all
        redirect_to '/admin/snack'
    end
    
    def korea_destroy_all
        @Korea.destroy_all
        redirect_to '/admin/korea'
    end
    
    def japan_destroy_all
        @Japan.destroy_all
        redirect_to '/admin/japan'
    end
    
    def china_destroy_all
        @China.destroy_all
        redirect_to '/admin/china'
    end
    
    def europe_destroy_all
        @Europe.destroy_all
        redirect_to '/admin/europe'
    end
    
    def flour_destroy_all
        @Flour.destroy_all
        redirect_to '/admin/flour'
    end
    
    def meat_destroy_all
        @Meat.destroy_all
        redirect_to '/admin/meat'
    end
    
    def chicken_destroy_all
        @Chicken.destroy_all
        redirect_to '/admin/chicken'
    end
    
    def alcohol_destroy_all
        @Alcohol.destroy_all
        redirect_to '/admin/alcohol'
    end
=======
>>>>>>> parent of 0b71f24... 20181101v1
end

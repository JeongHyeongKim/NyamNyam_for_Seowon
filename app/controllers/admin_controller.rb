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
    end
    
    def flour_add
    end
    
    def meat_add
    end
    
    def chicken_add
    end
    
    def alcohol_add
    end
    
    
    
end

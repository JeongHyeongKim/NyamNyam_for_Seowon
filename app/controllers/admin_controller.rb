class AdminController < ApplicationController
    
    # 알콜, 꼬꼬, 고기, 양식, 분식, 일식, 한식, 중식
    
    #{
#  "message": {
#    "photo": {
#      "url": "https://photo.src",
#      "width": 640,
#      "height": 480
#    },
#    "message_button": {
#      "label": "주유 쿠폰받기",
#      "url": "https://coupon/url"
#    }
#  },
#  "keyboard": {
#    "type": "buttons",
#    "buttons": [
#      "처음으로",
#      "다시 등록하기",
#      "취소하기"
#    ]
#  }
#}

    def select_model 
    end
    
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
    
end

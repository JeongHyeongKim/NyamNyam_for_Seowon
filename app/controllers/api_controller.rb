class ApiController < ApplicationController
  require 'unirest'
  
  @@layer_depth=1
  @@initial_button=["학식/긱사냠냠", "카페냠냠", "간식냠냠", "한식냠냠", "중식냠냠", "일식냠냠", "양식냠냠","분식냠냠","고기냠냠","꼬꼬냠냠","카레냠냠","알콜냠냠","랜덤냠냠"]
  @@school_food=["홈으로","긱사냠냠", "학식냠냠", "비즈니스대학식당"]

  
  #비즈니스대학 : 점심만있음
  #긱사식당 #아침, 점심 저녁  , (한식 일품) 저녁에는 축구부 있음
  
  
  @@parameter_content="카페냠냠"
  #각각 모델에 대한 이름 엑세스? 반응속도 
  
###################################################################################  
# http://k.kakaocdn.net/dn/CljIq/btqmRoMuyOM/5J5keZ0SvzG1rlVrrS9uU1/img_xl.jpg => test photo
# http://pf.kakao.com/_xhuxdtC/20814072 => test 메뉴판



  def self.call_dorm_food #긱사식단
      time_now=Time.now
      today = [time_now.year, time_now.month, time_now.day] * '-'
      response = Unirest.get 'https://bablabs.com/openapi/v1/campuses/hWiFLE5emh/stores?type&date='+today,
                          headers:{"Accesstoken" => "Z9LHET60OrAV1zFuXqEMNOc7FarnKJLCokQhbFwkClsE6FScfC"}
      morning_1 = response.body["stores"][0]["menus"][0]["description"]   #아침 - 한식
      morning_2 = response.body["stores"][0]["menus"][1]["description"]   #아침 - 일품
      lunch_1 = response.body["stores"][0]["menus"][2]["description"]   #점심 - 한식
      lunch_2 = response.body["stores"][0]["menus"][3]["description"]   #점심 - 일품
      dinner_1 = response.body["stores"][0]["menus"][4]["description"]   #저녁 - 한식
      dinner_2 = response.body["stores"][0]["menus"][5]["description"]   #저녁 - 일품
      dinner_soccer = response.body["stores"][0]["menus"][6]["name"] #저녁 - 축구부
      
      
      @meal =today + "일 식단\n■아침-1층\n#{morning_1}\n\n■아침-2층\n#{morning_2}\n\n■점심-1층\n#{lunch_1}\n\n■점심-2층\n#{lunch_2}\n\n■저녁-1층\n#{dinner_1}\n\n■저녁-2층\n#{dinner_2}\n\n■축구부\n#{dinner_soccer}"
      return @meal
  end
  
  def self.call_school_food #학식 식단
      time_now=Time.now
      today=[time_now.year, time_now.month, time_now.day] * '-'
       response=Unirest.get 'https://bablabs.com/openapi/v1/campuses/hWiFLE5emh/stores?type&date='+today,
                          headers:{"Accesstoken" => "Z9LHET60OrAV1zFuXqEMNOc7FarnKJLCokQhbFwkClsE6FScfC"}
      eur = response.body["stores"][1]["menus"][0]["name"]+ " "+response.body["stores"][0]["menus"][0]["description"]
      kor = response.body["stores"][1]["menus"][1]["name"]+ " "+response.body["stores"][0]["menus"][1]["description"]
      stone=response.body["stores"][1]["menus"][2]["name"]+ " "+response.body["stores"][0]["menus"][2]["description"]
      first=response.body["stores"][1]["menus"][3]["name"]+ " "+response.body["stores"][0]["menus"][3]["description"]
      
      
      @meal =today + "일 식단\n■양식\n#{eur}\n\n■한식\n#{kor}\n\n■돌솥\n#{stone}\n\n■일품\n#{first}"
      return @meal
  end
  
  def self.call_business_food
      time_now=Time.now
      today=[time_now.year, time_now.month, time_now.day] * '-'
       today=[time_now.year, time_now.month, time_now.day] * '-'
      response=Unirest.get 'https://bablabs.com/openapi/v1/campuses/hWiFLE5emh/stores?type&date='+today,
                          headers:{"Accesstoken" => "Z9LHET60OrAV1zFuXqEMNOc7FarnKJLCokQhbFwkClsE6FScfC"}
      business = +response.body["stores"][0]["menus"][0]["name"]+ " "+response.body["stores"][2]["menus"][0]["description"]
      
      
      @meal =today + "일 식단\n■점심\n#{business}"
      return @meal
  end
  
  def self.delete_tag(data)
    @response=Array.new
    @response_buffer=data.split(//)
    for i in 1..5
      @response_buffer.delete_at(0)
    end
    @converted_response=String.new
    @converted_response=@response_buffer.join
    return @converted_response
    
  end
  
  def self.make_button(data) #버튼과 텍스트만 다룰 때
          @text=@@parameter_content+" 리스트입니다."
          
      @msg={
            message: {
                text: @text,

              },
              keyboard: {
                type: "buttons",
                buttons:data
              }
            }
      return @msg
  end 
  
  def self.add_label(market_information) #위치 라벨 추가 및 버튼레이어 통합
    
    @button_layer_back=Array.new #후문
    @button_layer_middle=Array.new #중문
    @button_layer_west=Array.new #서문
    @button_layer_etc=Array.new #기타
    @button_layer_front=Array.new #정문
    @home_button=Array.new
    @home_button.push("홈으로")
    
    if (market_information.first.nil?)
        
    else

        for i in 1..market_information.maximum("id")
       if market_information.where(id:i).empty?
            next
       end

        if market_information.find(i).location=="중문"
            @button_layer_middle.push("[중문] "+market_information.find(i).name)
        elsif market_information.find(i).location=="서문"
            @button_layer_west.push("[서문] "+market_information.find(i).name)
        elsif market_information.find(i).location=="후문"
            @button_layer_back.push("[후문] "+market_information.find(i).name)
        elsif market_information.find(i).location=="정문"
            @button_layer_front.push("[정문] "+market_information.find(i).name)
        elsif market_information.find(i).location=="기타"
            @button_layer_etc.push("[기타] "+market_information.find(i).name)
        end       
    end#버튼 생성
    end
    
    return @home_button+@button_layer_middle+@button_layer_front+@button_layer_back+@button_layer_west+@button_layer_etc
  end
  
  def self.make_home_button(data) #버튼과 텍스트만 다룰 때

      @msg={
            message: {
                text: "홈으로",

              },
              keyboard: {
                type: "buttons",
                buttons:data
              }
            }
      return @msg
  end 
  
  def self.show_detail(photo, detail, open_time, button, contact) #사진과 링크도 포함시 사용하는 함수
      @msg={
                     message: {
                     text: "영업시간 : "+open_time+"\n"+"전화번호 : "+contact,
                     photo:{
                       url:photo,
                       width:640,
                       height:480
                     },
                     message_button:{
                       label:"메뉴판보기",
                       url:detail
                     }
                    },
                     keyboard: {
                       type: "buttons",
                      buttons:button
                     }
              }
      return @msg
  end
  
  def self.show_menu(button,menu) #사진과 링크도 포함시 사용하는 함수
      @msg={
                     message: {
                     text: menu
                     },
                     keyboard: {
                       type: "buttons",
                      buttons:button
                     }
              }
      return @msg
  end

################################################################################

   def api_init
             @msg =
            {
              type: "buttons",
              buttons: @@initial_button
            }
        render json: @msg, status: :ok
   end
   
   

  def api_message
    @response=params[:content]
    
    if @@layer_depth==1 ##초기 메뉴화면, 각 가게 화면은 for문으로 통합예정
    
      if @response == "카페냠냠" 
            @market_information=Caffeine.all
            @button_layer=Array.new #최종 버튼
            @@parameter_content="카페냠냠"
            @@layer_depth = 2 
            
            @button_layer=ApiController.add_label(@market_information)
            @msg=ApiController.make_button(@button_layer)
            render json: @msg, status: :ok

      elsif @response == "간식냠냠"
            @market_information=Snack.all
            @button_layer=Array.new
            @@parameter_content="간식냠냠"
            @@layer_depth=2
            
            @button_layer=ApiController.add_label(@market_information)
            @msg=ApiController.make_button(@button_layer)
            render json: @msg, status: :ok
            
      elsif @response == "한식냠냠"
            @market_information=Korea.all
            @button_layer=Array.new
            @@parameter_content="한식냠냠"
            @@layer_depth=2
            
            @button_layer=ApiController.add_label(@market_information)
            @msg=ApiController.make_button(@button_layer)
            render json: @msg, status: :ok
            
      elsif @response == "중식냠냠"
            @market_information=China.all
            @button_layer=Array.new
            @@parameter_content="중식냠냠"
            @@layer_depth=2
            
            @button_layer=ApiController.add_label(@market_information)
            @msg=ApiController.make_button(@button_layer)
            render json: @msg, status: :ok
            
      elsif @response == "일식냠냠"
            @market_information=Japan.all
            @button_layer=Array.new
            @@parameter_content="일식냠냠"
            @@layer_depth=2
            
            @button_layer=ApiController.add_label(@market_information)
            @msg=ApiController.make_button(@button_layer)
            render json: @msg, status: :ok
            
      elsif @response == "양식냠냠"
            @market_information=Europe.all
            @button_layer=Array.new
            @@parameter_content="양식냠냠"
            @@layer_depth=2
            
            @button_layer=ApiController.add_label(@market_information)
            @msg=ApiController.make_button(@button_layer)
            render json: @msg, status: :ok
            
      elsif @response == "분식냠냠"
            @market_information=Flour.all
            @button_layer=Array.new
            @@parameter_content="분식냠냠"
            @@layer_depth=2
            
            @button_layer=ApiController.add_label(@market_information)
            @msg=ApiController.make_button(@button_layer)
            render json: @msg, status: :ok
            
      elsif @response == "고기냠냠"
            @market_information=Meat.all
            @button_layer=Array.new
            @@parameter_content="고기냠냠"
            @@layer_depth=2
            
            @button_layer=ApiController.add_label(@market_information)
            @msg=ApiController.make_button(@button_layer)
            render json: @msg, status: :ok
            
      elsif @response == "꼬꼬냠냠"
            @market_information=Chicken.order(:name)
            
            @button_layer=Array.new
            @@parameter_content="꼬꼬냠냠"
            @@layer_depth=2
            
            @button_layer=ApiController.add_label(@market_information)
            @msg=ApiController.make_button(@button_layer)
            render json: @msg, status: :ok
            
      elsif @response == "알콜냠냠"
            @market_information=Alcohol.all
            @button_layer=Array.new
            @@parameter_content="알콜냠냠"
            @@layer_depth=2
            
            @button_layer=ApiController.add_label(@market_information)
            @msg=ApiController.make_button(@button_layer)
            render json: @msg, status: :ok
            
      elsif @response == "학식/긱사냠냠"
            @@parameter_content="학식/긱사냠냠"
            @@layer_depth=2
            @msg=ApiController.make_button(@@school_food)
            render json: @msg, status: :ok
            
      else  #임시 예외처리
            @@parameter_content="홈으로"
            @@layer_depth=1
            @msg = ApiController.make_home_button(@@initial_button)
            render json: @msg, status: :ok
      end
      
      
      
    elsif @@layer_depth==2##메뉴 1차선택
      if @response=="홈으로"
            @@parameter_content="홈으로"
            @@layer_depth=1
            @msg = ApiController.make_home_button(@@initial_button)
            render json: @msg, status: :ok
                
      elsif @@parameter_content=="카페냠냠"
            @button_layer=Array.new #최종 버튼
            @content_information=Caffeine.all #카페의 모든 정보
            @converted_response=ApiController.delete_tag(@response) #사용자로부터 받은 입력값
            
            @button_layer=ApiController.add_label(@content_information) 
            
            for i in 1..@content_information.maximum("id")  #DB많아지면 연산이 길다
              if @content_information.where(id:i).empty?
                  next
              end
              @content_case=@content_information.find(i).name #DB의 업체 이름 비교대상

              if @converted_response==@content_case   #if_start카페 리스트
                  @content_photo=@content_information.find(i).photo_url #해당 업체의 사진
                  @content_detail=@content_information.find(i).detail_url #해당 업체의 디테일 페이지
                  @content_opentime=@content_information.find(i).open_time #해당 업체의 오픈시간
                  @content_contact=@content_information.find(i).contact 

                  @msg=ApiController.show_detail(@content_photo, @content_detail, @content_opentime, @button_layer, @content_contact)
                  i=9999 #강제로 for문 탈출
                  render json: @msg, status: :ok
              end   #if end
            end                           #for_end
      elsif @@parameter_content=="간식냠냠"
            @button_layer=Array.new #최종 버튼
            @content_information=Snack.all #카페의 모든 정보
            @converted_response=ApiController.delete_tag(@response) #사용자로부터 받은 입력값
            
            @button_layer=ApiController.add_label(@content_information) 
            
            for i in 1..@content_information.maximum("id")  #DB많아지면 연산이 길다
              if @content_information.where(id:i).empty?
                  next
              end
              @content_case=@content_information.find(i).name #DB의 업체 이름 비교대상

              if @converted_response==@content_case   #if_start카페 리스트
                  @content_photo=@content_information.find(i).photo_url #해당 업체의 사진
                  @content_detail=@content_information.find(i).detail_url #해당 업체의 디테일 페이지
                  @content_opentime=@content_information.find(i).open_time #해당 업체의 오픈시간
                  @content_contact=@content_information.find(i).contact 

                  @msg=ApiController.show_detail(@content_photo, @content_detail, @content_opentime, @button_layer,@content_contact)
                  i=9999 #강제로 for문 탈출
                  render json: @msg, status: :ok
              end   #if end
            end                           #for_end
      elsif @@parameter_content=="한식냠냠"
            @button_layer=Array.new #최종 버튼
            @content_information=Korea.all #카페의 모든 정보
            @converted_response=ApiController.delete_tag(@response) #사용자로부터 받은 입력값
            
            @button_layer=ApiController.add_label(@content_information) 
            
            for i in 1..@content_information.maximum("id")  #DB많아지면 연산이 
              if @content_information.where(id:i).empty?
                  next
              end
              @content_case=@content_information.find(i).name #DB의 업체 이름 비교대상

              if @converted_response==@content_case   #if_start카페 리스트
                  @content_photo=@content_information.find(i).photo_url #해당 업체의 사진
                  @content_detail=@content_information.find(i).detail_url #해당 업체의 디테일 페이지
                  @content_opentime=@content_information.find(i).open_time #해당 업체의 오픈시간
                  @content_contact=@content_information.find(i).contact 

                  @msg=ApiController.show_detail(@content_photo, @content_detail, @content_opentime, @button_layer, @content_contact)
                  i=9999 #강제로 for문 탈출
                  render json: @msg, status: :ok
              end   #if end
            end                           #for_end
      elsif @@parameter_content=="중식냠냠"
            @button_layer=Array.new #최종 버튼
            @content_information=China.all #카페의 모든 정보
            @converted_response=ApiController.delete_tag(@response) #사용자로부��� 받은 입력값
            
            @button_layer=ApiController.add_label(@content_information) 
            
            for i in 1..@content_information.maximum("id")  #DB많아지면 연산이 길다
              if @content_information.where(id:i).empty?
                  next
              end
              @content_case=@content_information.find(i).name #DB의 업체 이름 비교대상

              if @converted_response==@content_case   #if_start카페 리스트
                  @content_photo=@content_information.find(i).photo_url #해당 업체의 사진
                  @content_detail=@content_information.find(i).detail_url #해당 업체의 디테일 페이지
                  @content_opentime=@content_information.find(i).open_time #해당 업체의 오픈시간
                  @content_contact=@content_information.find(i).contact 

                  @msg=ApiController.show_detail(@content_photo, @content_detail, @content_opentime, @button_layer, @content_contact)
                  i=9999 #강제로 for문 탈출
                  render json: @msg, status: :ok
              end   #if end
            end                           #for_end
      elsif @@parameter_content=="일식냠냠"
            @button_layer=Array.new #최종 버튼
            @content_information=Japan.all #카페의 모든 정보
            @converted_response=ApiController.delete_tag(@response) #사용자로부터 받은 입력값
            
            @button_layer=ApiController.add_label(@content_information) 
            
            for i in 1..@content_information.maximum("id")  #DB많아지면 연산이 길다
              if @content_information.where(id:i).empty?
                  next
              end
              @content_case=@content_information.find(i).name #DB의 업체 이름 비교대상

              if @converted_response==@content_case   #if_start카페 리스트
                  @content_photo=@content_information.find(i).photo_url #해당 업체의 사진
                  @content_detail=@content_information.find(i).detail_url #해당 업체의 디테일 페이지
                  @content_opentime=@content_information.find(i).open_time #해당 업체의 오픈시간
                  @content_contact=@content_information.find(i).contact 

                  @msg=ApiController.show_detail(@content_photo, @content_detail, @content_opentime, @button_layer, @content_contact)
                  i=9999 #강제로 for문 탈출
                  render json: @msg, status: :ok
              end   #if end
            end                           #for_end
      elsif @@parameter_content=="양식냠냠"
            @button_layer=Array.new #최종 버튼
            @content_information=Europe.all #카페의 모든 정보
            @converted_response=ApiController.delete_tag(@response) #사용자로부터 받은 입력값
            
            @button_layer=ApiController.add_label(@content_information) 
            
            for i in 1..@content_information.maximum("id")  #DB많아지면 연산이 길다
              if @content_information.where(id:i).empty?
                  next
              end
              @content_case=@content_information.find(i).name #DB의 업체 이름 비교대상

              if @converted_response==@content_case   #if_start카페 리스트
                  @content_photo=@content_information.find(i).photo_url #해당 업체의 사진
                  @content_detail=@content_information.find(i).detail_url #해당 업체의 디테일 페이지
                  @content_opentime=@content_information.find(i).open_time #해당 업체의 오픈시간
                  @content_contact=@content_information.find(i).contact 

                  @msg=ApiController.show_detail(@content_photo, @content_detail, @content_opentime, @button_layer, @content_contact)
                  i=9999 #강제로 for문 탈출
                  render json: @msg, status: :ok
              end   #if end
            end                           #for_end
            
      elsif @@parameter_content=="분식냠냠"
            @button_layer=Array.new #최종 버튼
            @content_information=Flour.all #카페의 모든 정보
            @converted_response=ApiController.delete_tag(@response) #사용자로부터 받은 입력값
            
            @button_layer=ApiController.add_label(@content_information) 
            
            for i in 1..@content_information.maximum("id")  #DB많아지면 연산이 길다
              if @content_information.where(id:i).empty?
                  next
              end
              @content_case=@content_information.find(i).name #DB의 업체 이름 비교대상

              if @converted_response==@content_case   #if_start카페 리스트
                  @content_photo=@content_information.find(i).photo_url #해당 업체의 사진
                  @content_detail=@content_information.find(i).detail_url #해당 업체의 디테일 페이지
                  @content_opentime=@content_information.find(i).open_time #해당 업체의 오픈시간
                  @content_contact=@content_information.find(i).contact

                  @msg=ApiController.show_detail(@content_photo, @content_detail, @content_opentime, @button_layer, @content_contact)
                  i=9999 #강제로 for문 탈출
                  render json: @msg, status: :ok
              end   #if end
            end                           #for_end
            
      elsif @@parameter_content=="고기냠냠"
            @button_layer=Array.new #최종 버튼
            @content_information=Meat.all #카페의 모든 정보
            @converted_response=ApiController.delete_tag(@response) #사용자로부터 받은 입력값
            
            @button_layer=ApiController.add_label(@content_information) 
            
            for i in 1..@content_information.maximum("id")  #DB많아지면 연산이 길다
              if @content_information.where(id:i).empty?
                  next
              end
              @content_case=@content_information.find(i).name #DB의 업체 이름 비교대상

              if @converted_response==@content_case   #if_start카페 리스트
                  @content_photo=@content_information.find(i).photo_url #해당 업체의 사진
                  @content_detail=@content_information.find(i).detail_url #해당 업체의 디테일 페이지
                  @content_opentime=@content_information.find(i).open_time #해당 업체의 오픈시간
                  @content_contact=@content_information.find(i).contact

                  @msg=ApiController.show_detail(@content_photo, @content_detail, @content_opentime, @button_layer, @content_contact)
                  i=9999 #강제로 for문 탈출
                  render json: @msg, status: :ok
              end   #if end
            end                           #for_end
            
      elsif @@parameter_content=="꼬꼬냠냠"
            @button_layer=Array.new #최종 버튼
            @content_information=Chicken.all #카페의 모든 정보
            @converted_response=ApiController.delete_tag(@response) #사용자로부터 받은 입력값
            
            @button_layer=ApiController.add_label(@content_information) 
            
            for i in 1..@content_information.maximum("id")  #DB많아지면 연산이 길다
              if @content_information.where(id:i).empty?
                  next
              end
              @content_case=@content_information.find(i).name #DB의 업체 이름 비교대상
              

              if @converted_response==@content_case   #if_start카페 리스트
                  @content_photo=@content_information.find(i).photo_url #해당 업체의 사진
                  @content_detail=@content_information.find(i).detail_url #해당 업체의 디테일 페이지
                  @content_opentime=@content_information.find(i).open_time #해당 업체의 오픈시간
                  @content_contact=@content_information.find(i).contact

                  @msg=ApiController.show_detail(@content_photo, @content_detail, @content_opentime, @button_layer, @content_contact)
                  i=9999 #강제로 for문 탈출
                  render json: @msg, status: :ok
              end   #if end
            end                           #for_end
            
      elsif @@parameter_content=="알콜냠냠"
            @button_layer=Array.new #최종 버튼
            @content_information=Alcohol.all #카페의 모든 정보
            @converted_response=ApiController.delete_tag(@response) #사용자로부터 받은 입력값
            
            @button_layer=ApiController.add_label(@content_information) 
            
            for i in 1..@content_information.maximum("id")  #DB많아지면 연산이 길다market_information.maximum("id")
              if @content_information.where(id:i).empty?
                  next
              end
              @content_case=@content_information.find(i).name #DB의 업체 이름 비교대상

              if @converted_response==@content_case   #if_start카페 리스트
                  @content_photo=@content_information.find(i).photo_url #해당 업체의 사진
                  @content_detail=@content_information.find(i).detail_url #해당 업체의 디테일 페이지
                  @content_opentime=@content_information.find(i).open_time #해당 업체의 오픈시간
                  @content_contact=@content_information.find(i).contact

                  @msg=ApiController.show_detail(@content_photo, @content_detail, @content_opentime, @button_layer, @content_contact)
                  i=9999 #강제로 for문 탈출
                  render json: @msg, status: :ok
              end   #if end
            end                           #for_end
       elsif @@parameter_content=="학식/긱사냠냠" #비즈니스대학, 긱사냠냠, 학식냠냠
             @button_layer=Array.new
             if @response=="긱사냠냠"                                #
                 @msg=ApiController.show_menu(@@school_food, ApiController.call_dorm_food)
                 render json:@msg, status: :ok
                 
             elsif @response=="학식냠냠"
                 @msg=ApiController.show_menu(@@school_food, ApiController.call_school_food)
                 render json:@msg, status: :ok
             elsif @response=="비즈니스대학식당"
                 @msg=ApiController.show_menu(@@school_food, ApiController.call_business_food)
                 render json:@msg, status: :ok
             end
             
             
      
                
      end #버튼제어 종료

  
  
    end #layer_depth end
    
    
  end  #api_message end
    
    
end  #controller class end


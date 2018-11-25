class ApiController < ApplicationController
  require 'unirest'
  
  @@layer_depth=1
  @@initial_button=["학식/긱사냠냠", "식사냠냠", "카페냠냠", "알콜냠냠"]
  @@school_food=["홈으로","학식냠냠", "긱사냠냠"]

  
  #pdf제공으로 인해 모바일 페이지로 안내 예정
  
  
  @@parameter_content="카페냠냠"
  #각각 모델에 대한 이름 엑세스? 반응속도 
  
###################################################################################  
# http://k.kakaocdn.net/dn/CljIq/btqmRoMuyOM/5J5keZ0SvzG1rlVrrS9uU1/img_xl.jpg => test photo
# http://pf.kakao.com/_xhuxdtC/20814072 => test 메뉴판

  
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
  
  def self.add_label_bob(market_information) #위치 라벨 추가 및 버튼레이어 통합
    
    @button_layer_korea=Array.new #한식
    @button_layer_japan=Array.new #일식
    @button_layer_china=Array.new #중식
    @button_layer_europe=Array.new #양식
    @button_layer_flour=Array.new #분식
    @button_layer_chicken=Array.new #꼬꼬
    @button_layer_meat=Array.new #고기
    @button_layer_etc=Array.new
    @home_button=Array.new
    @home_button.push("홈으로")
    
    if (market_information.first.nil?)
        
    else

        for i in 1..market_information.maximum("id")
       if market_information.where(id:i).empty?
            next
       end

        if market_information.find(i).category=="한식"
            @button_layer_korea.push("[한식] "+market_information.find(i).name)
        elsif market_information.find(i).category=="일식"
            @button_layer_japan.push("[일식] "+market_information.find(i).name)
        elsif market_information.find(i).category=="중식"
            @button_layer_china.push("[중식] "+market_information.find(i).name)
        elsif market_information.find(i).category=="양식"
            @button_layer_europe.push("[양식] "+market_information.find(i).name)
        elsif market_information.find(i).category=="간식"
            @button_layer_flour.push("[간식] "+market_information.find(i).name)
        elsif market_information.find(i).category=="꼬꼬"
            @button_layer_chicken.push("[꼬꼬] "+market_information.find(i).name)
        elsif market_information.find(i).category=="고기"
            @button_layer_meat.push("[고기] "+market_information.find(i).name)
        elsif market_information.find(i).category=="기타"
            @button_layer_etc.push("[기타] "+market_information.find(i).name)
        end       
    end#버튼 생성
    end
    
    return @home_button+@button_layer_korea+@button_layer_china+@button_layer_japan+@button_layer_europe+@button_layer_flour+@button_layer_chicken+@button_layer_meat+@button_layer_etc
  end
  
    def self.add_label_alcohol(market_information) #위치 라벨 추가 및 버튼레이어 통합
    
    @button_layer_soju=Array.new #한식
    @button_layer_beer=Array.new #일식
    @button_layer_kor=Array.new #중식
    @button_layer_etc=Array.new #양식
    @home_button=Array.new
    @home_button.push("홈으로")
    
    if (market_information.first.nil?)
        
    else

        for i in 1..market_information.maximum("id")
       if market_information.where(id:i).empty?
            next
       end

        if market_information.find(i).category=="소주"
            @button_layer_soju.push("[소주] "+market_information.find(i).name)
        elsif market_information.find(i).category=="맥주"
            @button_layer_beer.push("[맥주] "+market_information.find(i).name)
        elsif market_information.find(i).category=="전통"
            @button_layer_kor.push("[전통] "+market_information.find(i).name)
        else market_information.find(i).category=="기타"
            @button_layer_etc.push("[기타] "+market_information.find(i).name)
        end       
    end#버튼 생성
    end
    
    return @home_button+@button_layer_soju+@button_layer_beer+@button_layer_kor+@button_layer_etc
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
  #http://home.seowon.ac.kr/user/indexSub.action?codyMenuSeq=8810&siteId=dormit&menuUIType=top
  def self.show_school_food(button, res) #학식, 긱사냠냠 안내 함수
      if res=="학식냠냠"
          @msg={
                     message: {
                     text: "크롤링이 불가합니다! 버튼을 누르면 페이지 링크로 안내해드릴게요!",
                     message_button:{
                       label:"식단표 링크",
                       url:"https://m.seowon.ac.kr/html/themes/m/web/view.jsp?menuId=campuslife_f_09_01"
                     }
                     },
                     keyboard: {
                       type: "buttons",
                      buttons:button
                     }
              }
          return @msg
      elsif res=="긱사냠냠"
      
          @msg={
                     message: {
                     text: "크롤링이 불가합니다! 버튼을 누르면 페이지 링크로 안내해드릴게요!",
                     message_button:{
                       label:"식단표 링크",
                       url:"http://home.seowon.ac.kr/user/indexSub.action?codyMenuSeq=8810&siteId=dormit&menuUIType=top"
                     }
                     },
                     keyboard: {
                       type: "buttons",
                      buttons:button
                     }
              }
          return @msg
      end
  end
  
  def self.add_label_dessert(market_information) #위치 라벨 추가 및 버튼레이어 통합
    
    @home_button=Array.new
    @home_button.push("홈으로")
    
    if (market_information.first.nil?)
        
    else

       for i in 1..market_information.maximum("id")
            if market_information.where(id:i).empty?
                next
            end

       
            @home_button.push(market_information.find(i).name)
       end       
    end
    
    return @home_button
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
    
      if @response == "학식/긱사냠냠" 
            @@parameter_content="학식/긱사냠냠"
            @@layer_depth = 2 
            
            @msg=ApiController.make_button(@@school_food) # 모바일 페이지로 안내 예정 수정!
            render json: @msg, status: :ok

      elsif @response == "식사냠냠"
            @market_information=Bob.all
            @button_layer=Array.new
            @@parameter_content="식사냠냠"
            @@layer_depth=2
            
            @button_layer=ApiController.add_label_bob(@market_information)
            @msg=ApiController.make_button(@button_layer)
            render json: @msg, status: :ok
            
      elsif @response == "카페냠냠"
            @market_information=Dessert.all
            @button_layer=Array.new
            @@parameter_content="카페냠냠"
            @@layer_depth=2
            
            @button_layer=ApiController.add_label_dessert(@market_information)
            @msg=ApiController.make_button(@button_layer)
            render json: @msg, status: :ok
            
      elsif @response == "알콜냠냠"
            @market_information=Alcohol.all
            @button_layer=Array.new
            @@parameter_content="알콜냠냠"
            @@layer_depth=2
            
            @button_layer=ApiController.add_label_alcohol(@market_information)
            @msg=ApiController.make_button(@button_layer)
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
            
      elsif @response == "학식/긱사냠냠" 
            @@parameter_content="학식/긱사냠냠"
            @@layer_depth = 2 
            
            @msg=ApiController.make_button(@@school_food) # 모바일 페이지로 안내 예정 수정!
            render json: @msg, status: :ok

      elsif @response == "식사냠냠"
            @market_information=Bob.all
            @button_layer=Array.new
            @@parameter_content="식사냠냠"
            @@layer_depth=2
            
            @button_layer=ApiController.add_label_bob(@market_information)
            @msg=ApiController.make_button(@button_layer)
            render json: @msg, status: :ok
            
      elsif @response == "카페냠냠"
            @market_information=Dessert.all
            @button_layer=Array.new
            @@parameter_content="카페냠냠"
            @@layer_depth=2
            
            #@button_layer=ApiController.add_label(@market_information)
            @msg=ApiController.make_button(@button_layer)
            render json: @msg, status: :ok
            
      elsif @response == "알콜냠냠"
            @market_information=Alcohol.all
            @button_layer=Array.new
            @@parameter_content="알콜냠냠"
            @@layer_depth=2
            
            @button_layer=ApiController.add_label_alcohol(@market_information)
            @msg=ApiController.make_button(@button_layer)
            render json: @msg, status: :ok
            
#################################layer_depth 공유문제 해결####################################

      elsif @@parameter_content=="식사냠냠"
            @button_layer=Array.new #최종 버튼
            @content_information=Bob.all #카페의 모든 정보
            @converted_response=ApiController.delete_tag(@response) #사용자로부터 받은 입력값
            
            @button_layer=ApiController.add_label_bob(@content_information) 
            
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
      elsif @@parameter_content=="카페냠냠"
            @button_layer=Array.new #최종 버튼
            @content_information=Dessert.all #카페의 모든 정보
            
            @button_layer=ApiController.add_label_dessert(@content_information) 
            
            for i in 1..@content_information.maximum("id")  #DB많아지면 연산이 길다
              if @content_information.where(id:i).empty?
                  next
              end
              @content_case=@content_information.find(i).name #DB의 업체 이름 비교대상

              if @response==@content_case   #if_start카페 리스트
                  @content_photo=@content_information.find(i).photo_url #해당 업체의 사진
                  @content_detail=@content_information.find(i).detail_url #해당 업체의 디테일 페이지
                  @content_opentime=@content_information.find(i).open_time #해당 업체의 오픈시간
                  @content_contact=@content_information.find(i).contact 

                  @msg=ApiController.show_detail(@content_photo, @content_detail, @content_opentime, @button_layer,@content_contact)
                  i=9999 #강제로 for문 탈출
                  render json: @msg, status: :ok
              end   #if end
            end                           #for_end
      elsif @@parameter_content=="알콜냠냠"
            @button_layer=Array.new #최종 버튼
            @content_information=Alcohol.all #카페의 모든 정보
            @converted_response=ApiController.delete_tag(@response) #사용자로부터 받은 입력값
            
            @button_layer=ApiController.add_label_alcohol(@content_information) 
            
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
      elsif @@parameter_content=="학식/긱사냠냠"
            @msg=ApiController.show_school_food(@@school_food, @response)
            render json: @msg, status: :ok
            


       else 
            @@parameter_content="홈으로"
            @@layer_depth=1
            @msg = ApiController.make_home_button(@@initial_button)
            render json: @msg, status: :ok
             
             
      
                
      end #버튼제어 종료

  
  
    end #layer_depth end
    
    
  end  #api_message end
    
    
end  #controller class end


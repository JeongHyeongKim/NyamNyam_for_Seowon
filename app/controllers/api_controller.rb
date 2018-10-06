class ApiController < ApplicationController
  
  @@layer_depth = "1"
  @@initial_button=["학식/긱사냠냠", "카페냠냠", "간식냠냠", "한식냠냠", "중식냠냠", "일식냠냠", "양식냠냠","분식냠냠","고기냠냠","꼬꼬냠냠","카레냠냠","알콜냠냠","랜덤냠냠"]
  @@parameter_content="카페냠냠"
  #각각 모델에 대한 이름 엑세스? 반응속도 
  
###################################################################################  

  def make_button(data) #버튼과 텍스트만 다룰 때
      if @@parameter=="흠으로"
          @text="홈으로"
      else
          @text=@@parameter+" 리스트입니다."
      end
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
  
  def show_detail(photo, detail, button) #사진과 링크도 포함시 사용하는 함수
      @msg={
                     message: {
                     text: "쩝쩝",
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
                       type: "button",
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
    
    if @@layer_depth==1 ##초기 메뉴화면
    
      if @response == "카페냠냠"
            @market_information=Cafe.all
            @button_layer=Array.new
            @@parameter_content="카페냠냠"
            
            for i in 1..@market_information.length
              @button_layer.push(@market_information.find(i).name)
            end         #객체 불러와서 버튼에 그 객체 가게이름 버튼레이어 에다넣음
            
            @@layer_depth = "2"   #카페 리스트
            
#            @msg = {
#            message: {
#                text: "카페냠냠 리스트입니다.",
#
#              },
#              keyboard: {
#                type: "buttons",
#                buttons:@button_layer
#              }
#            }
             @msg=make_button(@button_layer)
            render json: @msg, status: :ok
      end
    
      
    elsif @@layer_depth==2##메뉴 1차선택
      if @response=="홈으로"
            @@parameter_content="홈으로"
            @@layer_depth="1"
            @msg = make_button(@@initial_button)
#            {
#                     message: {
#                     text: "홈으로 돌아갑니다.",
#                    },
#                     keyboard: {
#                       type: "buttons",
#                      buttons: @@initial_button
#                     }
#                    }
            render json: @msg, status: :ok
                
      elsif @@parameter_content=="카페냠냠"
            @button_layer=Array.new
            @content_information=Caffeine.all
            for i in 1..@content_information.length
              @button_layer.push(@content_information.find(i).name)
            end              #버튼 생성
              
            for i in 2..@discount_information.length  #DB많아지면 연산이 길다
              @content_case=@content_information.find(i).name #카페이름

          
              if @response==@content_case   #if_start카페 리스트
                  @content_photo=@content_information.find(i).photo_url #해당 업체의 사진
                  @content_detail=@content_information.find(i).detail_url #해당 업체의 디테일 페이지
#                  @msg = {
#                    message: {
#                      text: @discount_info, #내용이랑 사진 있으면 거기다가 더 추가하면 된다.
#                    },
#                    keyboard: {
#                      type: "buttons",
#                      buttons: @button_layer
#                     }
#                  }
                   @msg=show_detail(@content_photo, @content_detail, @button_layer)
                  i=9999 #강제로 for문 탈출
                  render json: @msg, status: :ok
              end   #if end
              
            end                           #for_end
                
      end #버튼제어 종료

  
  
    end #layer_depth end
    
    
  end  #api_message end
    
    
end  #controller class end
  

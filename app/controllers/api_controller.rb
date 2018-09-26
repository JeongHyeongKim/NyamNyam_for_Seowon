class ApiController < ApplicationController
   def api_init
             @msg =
            {
              type: "buttons",
              buttons: ["소개", "블로그", "깃허브","기타"]
            }
        render json: @msg, status: :ok
  end

  def api_message
  end
end
